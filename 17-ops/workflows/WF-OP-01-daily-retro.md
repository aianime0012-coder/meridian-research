# WF-OP-01 — Daily Retro

> Version 1.0 · Owner: Cadence (COO) · Schedule/Trigger: Cron — nightly 20:00 UTC · Priority: normal

## Objective

Run the daily improvement loop: gather every failure, blocker, and anomaly from workflow logs and KPIs over the prior 24h, answer the six questions (what failed / why / automate / simplify / delegate / become software / increase profit), write dated entries to the improvement log, and flag actions with owners and due dates. This is the mechanism that turns recurring pain into either a killed process, a simplified one, or a new automation — feeding `13-improvement/` and the monthly automation review in `07-automation/automation-system.md`.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) |
| Cadence / time | Nightly 20:00 UTC (after the day's batch window ends) |
| Source node | n8n Cron node (`0 20 * * *`) |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Workflow run logs (success/failure, durations, errors) | n8n execution DB / activity log API | Cog |
| Error tables + DLQs (poison records) | SQLite `errors`, `kpi_log` | Cog |
| KPI snapshot (last 24h + deltas) | WF-FN-03 / WF-OP-03 output, SQLite `kpi_log` | Ledger / Euclid |
| Open improvement items + stale items | `13-improvement/` log | Cadence |
| Escalation-flagged events (quality, security, compliance) | WF-DV-04 / Sentinel / Solon outputs | Norm / Sentinel / Solon |

## Steps

1. **Start retro run** — Tool: n8n Cron node (20:00 UTC) · Owner: Cadence → Output: retro context for the day
2. **Pull workflow failures** — Tool: HTTP Request → n8n execution API (last 24h, `status=failed`) + Execute Query (SQLite `errors`, DLQs) · Owner: Cog → Output: failure list with step, run_id, error
3. **Pull blockers & anomalies** — Tool: Execute Query (`kpi_log` deltas: MRR, churn, QA gate, lead volume) + check dashboard flags · Owner: Euclid → Output: anomaly list
4. **Pull open improvement items** — Tool: Execute Query (`13-improvement/` log: open, stale > 7d, overdue) · Owner: Cadence → Output: item status
5. **Root-cause classify each failure** — Tool: Cadence agent (LLM) grouping by cause class: data, integration, logic/config, quota/credential, external, human — no duplicates left unclassified · Owner: Cadence → Output: cause-tagged failures
6. **Apply the six filters** — Tool: Cadence agent: for each item decide `automate` (repeatable → WF backlog), `simplify` (reduce steps), `delegate` (assign owner/agent), `become software` (encode a judgment into a rule), `increase profit` (revenue/leakage impact), or `kill` (no value → decommission) · Owner: Cadence → Output: recommended action per item
7. **Write improvement log** — Tool: Execute Query / write to `13-improvement/` (append-only: item, cause, action, owner, due date, expected impact) · Owner: Cadence → Output: dated improvement entries
8. **Flag actions to owners** — Tool: HTTP Request → Resend email + assign tasks (HubSpot/n8n task or Slack/Discord DM) per owner · Owner: Cadence → Output: notifications + assignments
9. **Update risk register** — Tool: IF systemic/repeated failure THEN add/update risk entry (with Solon/Sentinel input where relevant) — owner: Cadence
10. **Log retro metrics** — Tool: Execute Query (`kpi_log`: # failures, # causes, # actions queued, # closed) + POST Ops dashboard · Owner: Cadence → Output: trend data for monthly automation review
11. **Feed morning standup** — Tool: Compose retro summary (what failed, top 3 actions, owners) → morning CEO/COO standup queue · Owner: Cadence → Output: standup brief

## Decision points / branching

1. IF a failure recurred ≥ 2 days running THEN mark `systemic`, escalate to Forge + COO, prioritize automation backlog — owner: Cadence
2. IF a failure touches revenue-critical workflow (WF-FN-*, WF-DV-*, WF-SL-*) THEN retro does not wait for nightly — immediate 24/7 alert path applies — owner: Cog
3. IF action = `automate` THEN push to Cog's automation backlog with priority; IF `kill` THEN decommission and note in decision log — owner: Cadence
4. IF item has no measurable impact THEN mark `kill` or `defer` (do not pad the log) — owner: Cadence
5. IF root cause is external (provider outage) THEN track with provider ticket, close when resolved — owner: Cog
6. IF improvement item is stale > 7d THEN re-assign or close with reason — owner: Cadence

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Execution log query fails | Retry 3× backoff; fall back to last snapshot + flag | No |
| No failures today | Log "clean run" entry (honest, still logged) | No |
| Owner assignment target unreachable | Queue notification for next standup, do not drop | No |
| Retro duplicate run | Upsert on `retro_date` (idempotent) | No |
| LLM classification error | Fall back to manual template classification, flag for review | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Same failure 2+ days | n8n alert → Slack/Discord | Forge + COO | 3+ days → CEO |
| Revenue-critical workflow failure | Immediate 24/7 alert (never waits for retro) | Cog + Dispatch → COO | immediate |
| Improvement backlog > 20 open items | Email via Resend | COO + Cog | monthly review |
| Security/compliance escalation flagged | Email via Resend + Security channel | Sentinel + Solon + COO | immediate |

## Success criteria

- [ ] All prior-24h failures, blockers, and anomalies gathered and root-cause classified (none unclassified)
- [ ] Each item resolved against the six filters (automate/simplify/delegate/become software/increase profit/kill) with owner + due date + expected impact
- [ ] Improvement log appended (dated, no orphans) and `kpi_log` updated with retro metrics
- [ ] Actionable items flagged to owners; systemic issues escalated per ladder
- [ ] Morning standup brief composed; closed items measured for impact in the monthly automation review

## Related

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `01-departments/02-coo.md` · `07-automation/automation-system.md` · `WF-OP-02` · `WF-OP-03` · `WF-DV-04` · `13-improvement/` · `00-company/decision-log.md`
