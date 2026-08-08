# WF-FN-03 — MRR/ARR Rollup

> Version 1.0 · Owner: Ledger (Finance) · Schedule/Trigger: Cron — nightly · Priority: rev-relevant

## Objective

Recompute the company's recurring revenue truth nightly: pull subscriptions and invoices from Stripe, reconcile against CRM-contracted revenue, calculate MRR/ARR, churn, and expansion/contraction by service line and cohort, write a timestamped snapshot to `kpi_log`, and refresh the finance dashboard. This is the single source of truth that feeds the weekly finance flash, cash-flow forecast (WF-FN-04), and the CEO/COO finance pack. Guards: MRR growth ≥ +8%/mo, NRR ≥ 115%, forecast accuracy ≤ 10% (`01-departments/12-finance.md`).

## Trigger

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) |
| Cadence / time | Nightly 00:15 UTC (after Stripe day settle); monthly cohort snapshot on 1st |
| Source node | n8n Cron node (`15 0 * * *`) + monthly `0 2 1 * *` for cohort report |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Subscriptions (active, canceled, trialing) | Stripe API `GET /v1/subscriptions` | Owner (Stripe connect) |
| Invoices + charges + refunds | Stripe API `GET /v1/invoices`, `GET /v1/charges` | Owner |
| Contract/off-Stripe deals (manual invoices) | HubSpot deals + `invoices` table | Tally |
| Prior MRR snapshot + cohorts | SQLite `kpi_log`, `revenue_metrics` | Ledger |
| Revenue recognition rules (recurring vs one-time, proration) | `08-finance/` finance model config | Ledger |
| Dashboard config | `15-dashboards/` finance dashboard | Euclid |

## Steps

1. **Start nightly run** — Tool: n8n Cron node (00:15 UTC) · Owner: Ledger → Output: run context with `run_date`
2. **Pull subscriptions** — Tool: HTTP Request → Stripe `GET /v1/subscriptions` (paginated, `status=all`, `limit=100`) · Owner: Ledger → Output: subscription rows with `current_period_end`, `plan`/`price`, `status`
3. **Pull invoices & charges** — Tool: HTTP Request → Stripe `GET /v1/invoices` + `GET /v1/charges` + refunds (last 30 days) · Owner: Ledger → Output: invoice/charge/refund rows
4. **Pull off-Stripe contract revenue** — Tool: HTTP Request → HubSpot deals API (won, recurring flag) + Execute Query (manual `invoices` table) · Owner: Tally → Output: reconciled contract revenue rows
5. **Classify revenue events** — Tool: Code node: `new` (first paid sub), `expansion` (price/seat increase), `contraction` (downgrade), `churn` (cancel/no re-sign), `one-time` (projects excluded from MRR) · Owner: Ledger → Output: event-classified rows
6. **Recognize MRR** — Tool: Code node computing monthly-equivalent per subscription (annual → /12, proration on mid-cycle changes, FX normalization) · Owner: Ledger → Output: per-client MRR rows
7. **Compute aggregates** — Tool: Code node: MRR, ARR = MRR × 12, gross churn, net retention (NRR/GRR), expansions vs contractions, by service line + cohort · Owner: Ledger → Output: aggregate metrics
8. **Write snapshot** — Tool: Execute Query (SQLite `kpi_log` / `revenue_metrics`: append-only snapshot with `run_id`, never overwrite history) · Owner: Ledger → Output: historical series for trend + forecast
9. **Refresh finance dashboard** — Tool: HTTP Request / dashboard generator reads `revenue_metrics` → update Grafana/custom HTML + weekly finance flash inputs · Owner: Ledger → Output: refreshed dashboard
10. **Anomaly check** — Tool: Code node comparing delta vs prior day/week (MRR Δ, churn Δ, refund spike) against thresholds → flag list · Owner: Ledger → Output: anomaly flags for review
11. **Log + report** — Tool: Execute Query (`kpi_log`: MRR, ARR, churn, NRR, per-service breakdown, run status) + POST Ops dashboard · Owner: Ledger → Output: audit + dashboard entry

## Decision points / branching

1. IF subscription is one-time project invoice THEN exclude from MRR (count in booked revenue only) — owner: Ledger
2. IF event is prorated mid-cycle change THEN recognize prorated amount for the period — owner: Ledger
3. IF refund issued THEN net against revenue in the refund period, flag anomaly — owner: Tally
4. IF MRR delta vs prior day > threshold (e.g. ±5%) THEN create anomaly flag for Ledger review — owner: Ledger
5. IF a client has both Stripe and off-Stripe revenue THEN merge on `client_id` before aggregating (no double count) — owner: Ledger
6. IF variance vs forecast > 10% THEN escalate to CEO per `12-finance.md` — owner: Ledger

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Stripe API failure | Retry 3× exponential backoff; hold snapshot | Yes — revenue data integrity |
| Partial page / pagination failure | Retry from last cursor; never commit partial snapshot | Yes |
| Off-Stripe reconciliation gap | Flag "unmatched" rows, do not fabricate MRR | No — flagged |
| Duplicate snapshot | Upsert on `run_id` (idempotent) | No |
| Dashboard refresh failure | Retry; keep last-good render with stale banner | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Stripe connect down / auth failure | n8n alert → Slack/Discord | Cog + Ledger | immediate (revenue-critical 99% SLA) |
| MRR drop > 5% WoW or churn spike | Email via Resend + dashboard | Ledger → CEO | variance > 10% → CEO |
| Cash runway below operating threshold | Email via Resend | Ledger + CEO + COO | immediate |
| Snapshot not written by 01:00 UTC | Email via Resend | Ledger + Cog | next business day → COO |

## Success criteria

- [ ] MRR, ARR, churn, NRR/GRR, expansions, contractions recomputed nightly from reconciled Stripe + CRM data
- [ ] Snapshot appended to `kpi_log` / `revenue_metrics` (history preserved, `run_id` unique)
- [ ] Finance dashboard refreshed and consistent with the weekly finance flash
- [ ] Revenue-classification rules applied (recurring vs one-time); no double-counting across Stripe + off-Stripe
- [ ] Anomaly flags reviewed by Ledger; forecast variance ≤ 10% reported to CEO

## Related

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `01-departments/12-finance.md` · `WF-FN-01` · `WF-FN-02` · `WF-FN-04` · `WF-FN-05` · `09-payments/` · `14-integrations/integration-matrix.md`
