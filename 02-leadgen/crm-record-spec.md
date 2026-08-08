# CRM Record Spec — Meridian Research & Advisory

> Version 1.0 · Defines the standard record Ranger creates for every scored company. Schema: `16-crm/schema.sql`; UI: HubSpot/Airtable.

## Company record (required fields)

| Field | Type | Source | Notes |
|---|---|---|---|
| `company_name` | text | primary research | — |
| `website` | url | source | normalized (strip www, https-only) |
| `industry` | enum | ICP list | standardize to list |
| `employee_size_band` | enum | Crunchbase/LinkedIn | 1-9 / 10-49 / 50-199 / 200-500 / 500+ |
| `hq_country` | text | source | country code |
| `hq_city` | text | source | — |
| `revenue_band` | enum | estimate w/ method | e.g., $2M–$5M (est: 15 emp × $150k) |
| `funding_total` | currency | Crunchbase/News | nullable |
| `last_funding_date` | date | source | nullable |
| `tech_stack` | text[] | BuiltWith / site | key tools incl. AI |
| `ai_signals` | text[] | research | dated, sourced |
| `pain_points` | text[] | inference | each with evidence link |
| `budget_estimate` | currency | model | see `research-playbook.md` §budget |
| `budget_confidence` | enum | model | low/med/high |
| `icp_fit_score` | int 0-100 | scoring model | — |
| `pain_score` | int | scoring model | — |
| `budget_score` | int | scoring model | — |
| `accessibility_score` | int | scoring model | — |
| `timing_score` | int | scoring model | — |
| `fit_score` | int | scoring model | total |
| `tier` | enum A/B/C/D | scoring model | — |
| `source` | text | ingestion | channel + query |
| `discovered_at` | datetime | system | — |
| `last_scored_at` | datetime | system | — |

## Contact records (per decision-maker)

| Field | Notes |
|---|---|
| `contact_name` | full name |
| `role` | normalized role ladder |
| `email` | primary + source (Hunter/Apollo) |
| `linkedin_url` | public profile |
| `priority` | P1/P2/P3 (P1 = pain-owner) |
| `engagement_state` | new / touched / replied / meeting / lost |
| `opted_out` | boolean (compliance) |

## Deal record (created at handoff)

See `16-crm/schema.sql` for full schema. Minimum: `account`, `contacts[]`, `service`, `pipeline_stage`, `amount`, `probability`, `expected_close`, `next_action`, `sequence_id`.

## Activity log (immutable trail)

Every touch, open, click, reply, call, and internal note appends to `activities`. Used for Analytics attribution and compliance audit.

## Data hygiene rules

- One record per company (dedupe by normalized domain).
- Evidence-first: every signal field carries a `[source: URL, date]` suffix.
- Consent: opt-outs propagate across all channels within 24h.
- No PII beyond professional contact data; GDPR-compliant processing basis logged.
- Records older than 12 months with no activity are archived (not deleted) per retention policy.

## Handoff to Sales

Record status → `READY` after scoring + outreach sequence generated. Vector (Sales) picks up A-tier within 24h, B within 48h, C on nurture cadence.

## Related

`opportunity-scoring.md` · `16-crm/schema.sql` · `02-leadgen/outreach-sequence-spec.md`
