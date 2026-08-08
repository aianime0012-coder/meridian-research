# Automation System — Meridian Research & Advisory

> Version 1.0 · Owned by Cog (Automation) + Forge (Engineering) · The rule: **if it repeats, automate it.**

## Principles

1. **API first** — when an API exists, build an integration (`14-integrations/`).
2. **Browser automation** — when no API exists (and ToS allows), use controlled browser automation; otherwise manual-assisted.
3. **Minimize human involvement** — humans only at legal/financial gates.
4. **Observable** — every automation logs, alerts on failure, and reports to dashboards.
5. **Portable** — workflows defined as declarative runbooks (`17-ops/workflows/`) that can run on n8n, Azure Logic Apps, or custom scheduler.

## Automation layers

| Layer | Tools | Responsibility |
|---|---|---|
| **Orchestration** | n8n (or Azure Logic Apps) | Multi-step workflows, triggers, retries, error handling |
| **Scheduling** | cron / GitHub Actions / Logic Apps | Periodic jobs (daily, weekly, monthly) |
| **Agents** | Meridian OS agents (opencode/claude + skills) | Judgment-heavy tasks: research, drafting, QA |
| **Integrations** | REST APIs, webhooks | CRM, payments, email, calendar, storage, LLM |
| **Data** | SQLite → analytics DB | Persistent records, KPI logs |
| **Delivery** | Dashboard/report generators | Reports, invoices, alerts |

## Workflow catalog

Every workflow is a runbook in `17-ops/workflows/` with: trigger, steps, owners, error handling, SLA. Full catalog: `07-automation/workflow-catalog.md`.

High-level workflow groups:

| Group | Example workflows |
|---|---|
| Lead gen | Source-pull cron, enrich, score, create record, generate sequence |
| Sales | Reply triage, proposal generation, meeting booking, contract prep, onboarding |
| Marketing | Content pipeline, newsletter build, webinar follow-up, SEO report |
| Delivery | Engagement setup, milestone tracking, QA gate, deliverable send, archive |
| Research | Signal ingestion, weekly brief, competitive watch, tool radar |
| Finance | Invoice generation, dunning, MRR rollup, forecast, tax prep |
| Ops | Daily retro, KPI snapshot, system health, backup |

## Automation opportunities (priority backlog)

1. **Lead source pulls** (Crunchbase, funding feeds, job boards) — nightly. *(Design complete — `02-leadgen/sources.md`.)*
2. **Opportunity scoring + CRM record creation** — on enrich. *(Design complete.)*
3. **Proposal generation** — from deal + evidence pack. *(Design complete — `03-sales/proposal-playbook.md`.)*
4. **Newsletter assembly** — from research signals. *(Design complete.)*
5. **Weekly signals brief** — Friday, from signal inbox. *(Design complete.)*
6. **MRR/KPI rollup + dashboard refresh** — nightly. *(Design complete.)*
7. **Dunning (failed payment retries + notices)** — via Stripe webhooks. *(Design complete — `09-payments/`.)*
8. **Daily retro + improvement log** — nightly agent run. *(Design complete — `13-improvement/`.)*

## Browser automation policy

- Only where APIs are absent and platform ToS permits.
- Rate-limited, consent-respecting, opt-out honoring.
- Logged and reviewed by Sentinel (Security) — see `20-security.md`.
- Preferred targets: public data portals, government databases, public directories.

## Monitoring & alerts

- Every workflow reports success/failure to the Ops dashboard (`15-dashboards/ops.html`).
- Failure → alert → Dispatch retries → escalate to Cog → COO if > 2 failures.
- Uptime target ≥ 99% for revenue-critical workflows (billing, delivery).

## Optimization loop

Monthly automation review: measure manual steps remaining, failure rates, cost per automation; decommission or merge underperforming; document in `13-improvement/`.

## Related

`workflow-catalog.md` · `14-integrations/integration-matrix.md` · `17-ops/workflows/` · `17-ops/schedules/` · `01-departments/16-automation.md`
