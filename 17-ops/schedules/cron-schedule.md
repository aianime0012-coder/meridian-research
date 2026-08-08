# Cron & Schedule Map — Meridian Research & Advisory

> Version 1.0 · Owned by Cog · Implements the workflow catalog as scheduled jobs (n8n cron / GitHub Actions / Azure Logic Apps).

## Daily

| Time (UTC) | Workflow | Job |
|---|---|---|
| 00:00 | WF-OP-03 | KPI snapshot + dashboard refresh |
| 00:30 | WF-OP-02 | System health check + backup |
| 02:00 | WF-LG-01 | Lead source pulls (Crunchbase, funding, jobs, Maps, Clutch) |
| 04:00 | WF-RS-01 | Signal ingestion + verification pass |
| 05:00 | WF-MK-06 | Social queue posting (LinkedIn/X) |
| 06:00 | WF-LG-06 | Response/engagement scan → deal updates |
| 07:00 | WF-SL-06 | Renewal touch due today (reminder) |
| 08:00 | WF-DV-03 | Milestone/status sweep → alerts |
| 20:00 | WF-OP-01 | Daily retro + improvement log |
| 22:00 | WF-LG-05 | Outreach sequence step execution |

## Weekly

| Day (UTC) | Time | Workflow | Job |
|---|---|---|---|
| Mon | 09:00 | WF-MK-01 | Content pipeline kickoff (draft assignments) |
| Tue | 09:00 | WF-LG-07 | C-tier re-score + monitor refresh |
| Thu | 14:00 | WF-FN-04 | Cash-flow forecast |
| Fri | 10:00 | WF-RS-02 | Weekly Signals Brief assemble + route |
| Fri | 16:00 | WF-MK-02 | Newsletter assembly + send |
| Sun | 12:00 | WF-OP-04 | Security scan + access review |

## Monthly

| Day (UTC) | Workflow | Job |
|---|---|---|
| 1st | WF-FN-05 | Month-end close + reconciliation |
| 1st | WF-FN-03 | MRR/ARR rollup + cohort report |
| 2nd | WF-MK-05 | SEO performance report |
| 2nd | WF-RS-03 | Competitive watch |
| 3rd | WF-RS-04 | Policy watch |
| 3rd | WF-RS-05 | Tool radar |
| 4th | WF-OP-05 | Risk register review |
| Last Fri | WF-SL-07 | Upsell trigger scan |

## Quarterly

| Month | Workflow | Job |
|---|---|---|
| Q-end | WF-FN-06 | Tax prep pack |
| Q-end | 06-research | Vertical Snapshot publish (lead magnet) |
| Q-end | 00-company | Pricing review + calibration of scoring weights |

## Execution rules

- All times UTC; DST-safe scheduling.
- Each job: idempotent, retries 3× with backoff, logs outcome to `kpi_log`/activity.
- Failure → Ops dashboard + alert → Dispatch triage → Cog if systemic.
- Jobs tagged `revenue-critical` (WF-FN-*, WF-DV-*, WF-SL-*) get 99% uptime SLA and 24/7 alerting.

## Related

`07-automation/workflow-catalog.md` · `14-integrations/integration-matrix.md`
