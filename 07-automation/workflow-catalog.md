# Workflow Catalog — Meridian Research & Advisory

> Version 1.0 · Every repeatable process is a workflow runbook in `17-ops/workflows/`. This catalog is the index.

## Workflow ID convention

`WF-<group>-<nn>` — groups: LG (lead gen), SL (sales), MK (marketing), DV (delivery), RS (research), FN (finance), OP (ops).

## Catalog

### Lead Generation

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-LG-01 | Source pulls (Crunchbase/funding/jobs/Maps/Clutch/etc.) | Schedule | Nightly | Ranger | Design |
| WF-LG-02 | Enrich company record | On new candidate | Event | Ranger | Design |
| WF-LG-03 | Opportunity scoring | On enrich | Event | Ranger | Design |
| WF-LG-04 | CRM record creation + dedupe | On score | Event | Ranger | Design |
| WF-LG-05 | Outreach sequence generation | On tier A/B | Event | Ranger/Vector | Design |
| WF-LG-06 | Follow-up + response tracking | On activity | Real-time | Vector | Design |
| WF-LG-07 | Re-score monitors (C-tier) | Schedule | Monthly | Ranger | Design |

### Sales

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-SL-01 | Inbound lead qualification | On form/booking | Real-time | Vector | Design |
| WF-SL-02 | Discovery scheduling | On SQL | Real-time | Vector | Design |
| WF-SL-03 | Proposal generation | On discovery done | Event | Quill | Design |
| WF-SL-04 | Contract prep + e-sign request | On proposal accept | Event | Amicus/Vector | Design |
| WF-SL-05 | Referral capture + reward | On referral | Event | Vector | Design |
| WF-SL-06 | Renewal reminder sequence | Day 90/60/45/30 | Schedule | Halo | Design |
| WF-SL-07 | Upsell trigger detection | On usage signals | Weekly | Halo | Design |

### Marketing

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-MK-01 | Content pipeline (brief→draft→QA→publish) | On calendar | Weekly | Astra | Design |
| WF-MK-02 | Newsletter assembly + send | Schedule | Weekly | Astra | Design |
| WF-MK-03 | Lead magnet delivery sequence | On signup | Event | Astra | Design |
| WF-MK-04 | Webinar follow-up nurture | On webinar end | Event | Astra | Design |
| WF-MK-05 | SEO performance report | Schedule | Monthly | Astra | Design |
| WF-MK-06 | Social scheduling + posting | Schedule | Daily | Astra | Design |
| WF-MK-07 | Scorecard/Magnet form → CRM lead + nurture | On form submit | Event | Astra/Cog | Design |

### Delivery

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-DV-01 | Engagement setup (workspace, files, calendar) | On won | Event | Dispatch | Design |
| WF-DV-02 | Kickoff brief collection | On setup | Event | Kepler | Design |
| WF-DV-03 | Milestone tracking + status report | Schedule | Weekly | Kepler | Design |
| WF-DV-04 | QA gate execution | On deliverable draft | Event | Norm | Design |
| WF-DV-05 | Deliverable send + feedback request | On QA pass | Event | Dispatch/Halo | Design |
| WF-DV-06 | Engagement archive + knowledge capture | On completion | Event | Mnemos | Design |

### Research

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-RS-01 | Signal ingestion + verification | Schedule | Hourly | Sage | Design |
| WF-RS-02 | Weekly signals brief | Schedule | Friday | Sage | Design |
| WF-RS-03 | Competitive watch | Schedule | Monthly | Sage | Design |
| WF-RS-04 | Policy watch | Schedule | Monthly | Sage/Solon | Design |
| WF-RS-05 | Tool radar (internal automation tools) | Schedule | Monthly | Sage/Cog | Design |

### Finance

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-FN-01 | Invoice generation + send | On milestone/schedule | Event | Tally | Design |
| WF-FN-02 | Dunning (retry + notice) | Stripe webhook | Real-time | Tally | Design |
| WF-FN-03 | MRR/ARR rollup + KPI snapshot | Schedule | Nightly | Ledger | Design |
| WF-FN-04 | Cash-flow forecast | Schedule | Weekly | Ledger | Design |
| WF-FN-05 | Month-end close + reconciliation | Schedule | Monthly | Tally | Design |
| WF-FN-06 | Tax prep pack | Schedule | Quarterly | Tally/Solon | Design |

### Operations

| ID | Workflow | Trigger | Frequency | Owner | Status |
|---|---|---|---|---|---|
| WF-OP-01 | Daily retro + improvement log | Schedule | Nightly | COO | Design |
| WF-OP-02 | System health + backup | Schedule | Daily | Forge/Sentinel | Design |
| WF-OP-03 | KPI board refresh | Schedule | Nightly | Euclid | Design |
| WF-OP-04 | Security scan + access review | Schedule | Weekly | Sentinel | Design |
| WF-OP-05 | Risk register review | Schedule | Monthly | Solon/Amicus | Design |

## Status legend

- **In repo** — definition exists in `17-ops/workflows/`.
- **Design** — spec complete in phase docs; to be implemented in n8n/Logic Apps.
- **Live** — implemented and passing.
- **Pending owner** — requires account/credential from owner first.

## Related

`07-automation/automation-system.md` · `17-ops/workflows/` · `17-ops/schedules/cron-schedule.md`
