# WF-LG-01 — Lead Source Pull

> Version 1.0 · Owner: Ranger (Lead Gen) · Schedule/Trigger: Cron — nightly 02:00 UTC · Priority: high

## Objective

Continuously harvest candidate companies from every ICP-relevant source — Crunchbase, funding news RSS, job boards, Google Places, Clutch, and startup directories — normalize each hit into the staging `candidates` table, and dedupe by `company_domain` so downstream enrichment (WF-LG-02) and scoring (WF-LG-03) always operate on a clean, traceable record set. This is the intake engine behind the ≥ 3,000 discovered companies/mo target in `02-leadgen/leadgen-engine.md`.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) |
| Cadence / time | Nightly 02:00 UTC (full pass); funding RSS polls continuously at 15-min intervals |
| Source node | n8n Cron node (`0 2 * * *`) + n8n RSS Feed node for funding feeds |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Crunchbase API key (OAuth) | Crunchbase API v4 | Owner (vault: Bitwarden) |
| Funding RSS feeds (TechCrunch, Crunchbase News, verticals) | Public RSS | Cog |
| LinkedIn Jobs / remote board digests (Remote OK, We Work Remotely) | RSS + manual-assisted saved-search CSV | Owner/LinkedIn account |
| Google Places API key | Google Cloud console | Owner |
| Clutch licensed export / partner API | Licensed data export | Owner |
| Product Hunt API token (OAuth) | Product Hunt GraphQL | Owner |
| YC batch directory (manual-assisted CSV) | Public directory | Ranger |
| Last-run watermark (`last_pull_ts`) | SQLite `pull_watermarks` | Forge |

## Steps

1. **Start nightly full pass** — Tool: n8n Cron node (`0 2 * * *`) · Owner: Cog → Output: run context with `run_date`
2. **Pull Crunchbase delta** — Tool: HTTP Request → `GET /v4.0/entities/organizations?updated_since={watermark}` (OAuth) · Owner: Ranger → Output: raw JSON organizations (funding, financials, leadership)
3. **Poll funding news** — Tool: RSS Feed node (15-min, buffered for nightly aggregate) on TechCrunch / Crunchbase News → parse headline, round amount, series, investors, source_url · Owner: Ranger → Output: funding_signal rows
4. **Pull job-board hiring signals** — Tool: RSS + CSV digest (Remote OK, We Work Remotely, LinkedIn Jobs saved-search export) → match keywords (`AI`, `Machine Learning`, `Automation`, `Data Platform`, `Competitive Intelligence`) · Owner: Ranger → Output: hiring_signal rows with `posting_url` + `posted_at`
5. **Pull Google Places batch** — Tool: HTTP Request → `GET /maps/api/place/textsearch/json` (Places API, place-type + radius queries per ICP industry) · Owner: Ranger → Output: local/mid-market firm candidates with `place_id`
6. **Pull Clutch batch** — Tool: licensed export ingest (CSV/JSON upload node); manual-assisted collection capped ≤ 50 records/day where no export · Owner: Ranger → Output: agency/provider records with services + budget bands
7. **Pull startup directories** — Tool: HTTP Request → Product Hunt GraphQL (`POST https://api.producthunt.com/v2/api/graphql`, recent launches + upvotes); YC batch CSV monthly · Owner: Ranger → Output: startup momentum records with `ph_upvotes`
8. **Normalize into staging** — Tool: Code node / Execute Query (SQLite `candidates` table) · Owner: Ranger → Output: normalized rows carrying `source_id`, `source_type`, `collected_at`, `evidence_url`, `evidence_date` (no source ⇒ record rejected)
9. **Dedupe by domain** — Tool: Execute Query (SQLite) on canonical key `company_domain` (+ `contact_email`) → new inserts vs. merge-attach of additional signals to existing records · Owner: Ranger → Output: dedupe manifest (new / merged / rejected)
10. **Enforce ICP pre-filter** — Tool: Code node (size band 5–1000, priority industries) · Owner: Ranger → Output: `candidates` flagged `pass_icp` / `hold` (pull-and-hold staging model)
11. **Log pull manifest** — Tool: Execute Query (`kpi_log`, `pull_manifest` rows: per-source counts, errors, duplicates) + POST to Ops dashboard · Owner: Ranger → Output: audit trail for WF-OP-01
12. **Hand off to enrichment** — Tool: Webhook (outgoing) to WF-LG-02 queue · Owner: Ranger → Output: enriched `candidates` start being processed

## Decision points / branching

1. IF a record has no resolvable `company_domain` THEN hold in `errors` table with reason, do not outreach — owner: Ranger
2. IF a record already exists on `company_domain` THEN merge new signals into the existing row (attach, don't overwrite `collected_at` origin) — owner: Ranger
3. IF a source fails its API/quota THEN skip that source and complete the rest of the batch (graceful degradation) — owner: Ranger
4. IF record fails ICP pre-filter THEN keep in staging flagged `hold` (C-tier monitor candidates), do not score — owner: Ranger
5. IF manual-assisted source hits daily cap (Clutch 50, Wellfound 30) THEN defer remainder to next run's budget — owner: Ranger

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Crunchbase / Places API 429 or quota | Exponential backoff, retry ≤ 3×, then skip source + flag | No |
| Invalid OAuth / expired API key | Route to `errors` table, alert Sentinel + Cog | Yes — that source only |
| Record fails normalization (missing fields) | Reject with reason, log `source_id` for audit | No |
| RSS feed malformed / unreachable | Skip feed, note in manifest | No |
| Dedupe watermark read fails | Re-run full-day pull (idempotent, upsert) | Yes — retry then alert |

All runs are idempotent: re-running a pull upserts and never double-inserts on the `company_domain` key. Poison records never block the batch.

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Source fails 3× consecutively | n8n alert → Slack/Discord webhook | Cog + Dispatch | > 2 failures → COO |
| API key / credential invalid | Email via Resend | Sentinel + Owner | immediate |
| Zero new records across all sources | Dashboard alert + email | Ranger | same-day review → COO |
| Evidence coverage < 95% on new records | Weekly quality check (Norm) | Ranger + Norm | systemic → COO |

## Success criteria

- [ ] `candidates` table updated nightly; pull manifest logged with per-source new/merged/rejected counts
- [ ] ≥ 95% of new records carry `evidence_url` + `evidence_date` (no source, no record)
- [ ] No duplicate rows on `company_domain`; dedupe manifest appended to `kpi_log`
- [ ] ICP pre-filter flags applied; only `pass_icp` records advance to WF-LG-02
- [ ] Run completes within the 02:00–05:00 UTC window and reports success/failure to the Ops dashboard

## Related

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `02-leadgen/sources.md` · `02-leadgen/leadgen-engine.md` · `02-leadgen/crm-record-spec.md` · `WF-LG-02` · `WF-LG-03` · `14-integrations/integration-matrix.md`
