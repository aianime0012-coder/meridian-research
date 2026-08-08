# Architecture Documentation — Meridian Research & Advisory

> Owned by Forge (Engineering) + Cog (Automation) · The system architecture of Meridian OS.

## Documents

| Doc | Path | Status |
|---|---|---|
| Repo map | `../README.md` | BUILT |
| Integration matrix | `../../14-integrations/integration-matrix.md` | BUILT |
| Automation system | `../../07-automation/automation-system.md` | BUILT |
| Workflow catalog | `../../07-automation/workflow-catalog.md` | BUILT |
| Schedule map | `../../17-ops/schedules/cron-schedule.md` | BUILT |
| CRM schema | `../../16-crm/schema.sql` | BUILT |
| CRM mapping | `../../16-crm/crm-mapping.md` | BUILT |
| KPI dictionary | `../../08-finance/kpi-dictionary.md` | BUILT |
| Dashboard | `../../15-dashboards/index.html` | BUILT (seed) |

## Architecture principles

1. Portable: canonical schema + provider-agnostic integrations (swap HubSpot↔Airtable, Stripe↔PayPal).
2. Observable: every workflow logs to `kpi_log`/activities and alerts on failure.
3. Secure by default: credentials in the password vault, no secrets in git, least privilege.
4. Human gates only where law demands: execution, filing, entity/financial acts.

## Known gaps / backlog

- [ ] Live DB + dashboard wiring (owner infra)
- [ ] n8n/Azure Logic Apps deployment of runbooks
- [ ] Vector store for RAG over the knowledge base
- [ ] LLM provider abstraction layer implementation
- [ ] API contract for enrichment integrations

## Related

`../../01-departments/17-engineering.md` · `../../01-departments/16-automation.md`
