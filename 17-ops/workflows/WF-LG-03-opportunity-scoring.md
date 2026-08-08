# WF-LG-03 — Opportunity Scoring

> Version 1.0 · Owner: Ranger (Lead Gen) · Schedule/Trigger: Event — on new/enriched record · Priority: high

## Objective

Apply the deterministic Fit Score model (`02-leadgen/opportunity-scoring.md`) to every new or enriched company record so limited outreach capacity goes to the accounts most likely to buy. The workflow computes five weighted sub-scores, enforces the ICP hard gate, assigns a tier A/B/C/D, and persists an auditable scoring snapshot to the `companies` table before handoff to CRM record creation (WF-LG-04). This drives the ≥ 60 A-tier opportunities/mo and ≥ 8% A-tier share targets.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Event (webhook) |
| Cadence / time | On record creation or enrichment completion (real-time, ≤ 5 min SLA) |
| Source node | n8n Webhook node (from WF-LG-02 enrichment) + retry queue for C-tier re-scores |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Enriched company record (firmographics, financials, tech, signals) | WF-LG-02 output / SQLite `companies` | Ranger |
| Verified signals for the record (dated, with `evidence_url`) | SQLite `signals` table (`06-research/signal-catalog.md`) | Sage |
| ICP priority industries + size bands | `02-leadgen/leadgen-engine.md` config | Ranger |
| Scoring weights (ICP 30% · Pain 30% · Budget 20% · Access 10% · Timing 10%) | `opportunity-scoring.md` config | Euclid |
| Re-score schedule (90-day C-tier sweep, new-signal triggers) | `17-ops/schedules/cron-schedule.md` | Cog |

## Steps

1. **Receive record** — Tool: n8n Webhook node (payload: `company_id`, enriched fields, signal refs) · Owner: Ranger → Output: scoring job context
2. **Load verified signals** — Tool: Execute Query (SQLite `signals`) for the `company_id`, filtering `status=verified`, dated within 90 days · Owner: Ranger → Output: signal list per record
3. **Compute ICP Fit (30%)** — Tool: Code node mapping industry + size to rubric (priority/adjacent/wrong; size band 5–1000) · Owner: Ranger → Output: `icp_fit` 0–100 (0 = hard gate)
4. **Compute Pain Signal (30%)** — Tool: Code node counting verified signals (3+ = 100, 2 = 80, 1 strong = 60, weak = 30, none = 10) per rubric · Owner: Ranger → Output: `pain_signal` 0–100
5. **Compute Budget Proxy (20%)** — Tool: Code node mapping revenue band; unknown → 40 + `flag_for_enrichment`; funding/hiring growth steps band up one · Owner: Ranger → Output: `budget_proxy` 0–100
6. **Compute Accessibility (10%)** — Tool: Code node on decision-maker discovery (2+ DMs = 100, 1 = 70, generic inbox = 40, none = 10) · Owner: Ranger → Output: `accessibility` 0–100
7. **Compute Timing (10%)** — Tool: Code node on recency of newest signal (≤30d = 100 … >90d = 30, none = 10) · Owner: Ranger → Output: `timing` 0–100
8. **Apply ICP hard gate** — Tool: Switch node: IF `icp_fit = 0` THEN tier D (excluded, logged) — owner: Ranger
9. **Weighted sum + tier assignment** — Tool: Code node: `Fit = icp*0.30 + pain*0.30 + budget*0.20 + access*0.10 + timing*0.10`; tier A ≥ 75, B 50–74, C < 50 · Owner: Ranger → Output: `fit_score` + `tier`
10. **Persist scoring snapshot** — Tool: Execute Query (SQLite `companies`, immutable `scoring_events` row with sub-scores + input snapshot for audit) · Owner: Ranger → Output: audited score record
11. **Route by tier** — Tool: Webhook (outgoing): tier A/B → WF-LG-04 record creation + Vector notify; tier C → `monitor` list (monthly re-score); tier D → archive reference · Owner: Ranger → Output: downstream handoffs
12. **Log to KPI** — Tool: Execute Query (`kpi_log`: score, tier, sub-scores, timestamp, run_id) + POST Ops dashboard · Owner: Ranger → Output: calibration data for Euclid's monthly weight review

## Decision points / branching

1. IF `icp_fit = 0` (wrong industry / consumer-only) THEN hard-exclude to tier D regardless of other sub-scores — owner: Ranger
2. IF budget band unknown THEN assume 40 and flag for enrichment in the next WF-LG-02 pass — owner: Ranger
3. IF no verified signals exist THEN score pain = 10, timing = 10, and route to enrichment (never guess) — owner: Ranger
4. IF tier = A/B THEN immediate handoff (A: outreach < 24h); IF tier = C THEN monitor + 90-day re-score — owner: Ranger
5. IF new signal arrives for an existing record THEN re-run this workflow (re-score trigger) — owner: Ranger
6. IF monthly calibration changes weights THEN recompute all active A/B/C records once with new config (Euclid) — owner: Euclid

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Record missing required fields | Route to `errors` table, notify Ranger (incomplete enrich) | No — record only |
| Signal query fails | Retry 3× backoff; then score with pain/timing defaults + flag | No |
| Scoring config invalid (weights ≠ 1.0) | Abort run, alert Euclid | Yes — batch |
| Webhook to WF-LG-04 down | Buffer event, replay ≤ 3×, then alert Dispatch | No — deferred |
| Duplicate scoring event | Upsert on `company_id + run_id` (idempotent, no double-score) | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Tier A surge > 3× weekly baseline | Dashboard alert + email | Ranger + Vector | same-day → COO |
| Mass ICP gate fails (> 50% of batch) | Email via Resend | Ranger + Euclid | ICP config review → COO |
| Enrichment gaps flagged on ≥ 20% of records | Weekly report | Ranger | systemic → COO |
| Scoring workflow down > 2 runs | n8n alert → Slack/Discord | Cog + Dispatch | > 2 runs → COO |

## Success criteria

- [ ] Every new/enriched record scored within 5 min of webhook receipt (SLA)
- [ ] Sub-scores and tier match `opportunity-scoring.md` thresholds exactly; ICP gate enforced
- [ ] Immutable `scoring_events` snapshot logged for every record (audit + calibration)
- [ ] A/B routed to WF-LG-04; C monitored; D excluded; handoffs confirmed
- [ ] Score, tier, and run metadata written to `kpi_log` for Euclid's monthly calibration loop

## Related

`07-automation/workflow-catalog.md` · `02-leadgen/opportunity-scoring.md` · `02-leadgen/leadgen-engine.md` · `02-leadgen/crm-record-spec.md` · `06-research/signal-catalog.md` · `WF-LG-01` · `WF-LG-02` · `WF-LG-04` · `01-departments/06-leadgen.md`
