# CRM Mapping — Meridian Research & Advisory

> Version 1.0 · Owned by Forge · Maps the canonical schema (`16-crm/schema.sql`) to hosted CRMs so the company is provider-portable.

## Canonical source of truth

SQLite schema in `16-crm/schema.sql`. Hosted CRMs (HubSpot primary, Airtable
fallback) are **views/upserts** of the canonical data, not the source of truth.

## Object mapping

| Canonical table | HubSpot object | Airtable base | Notes |
|---|---|---|---|
| `companies` | Company | Accounts | domain = dedupe key |
| `contacts` | Contact | Contacts | linked to Company |
| `deals` | Deal | Deals | pipeline stages map 1:1 |
| `activities` | Engagement | Activities | append-only log |
| `sequences` / `sequence_runs` | Sequence (custom) | Sequences | outreach cadence |
| `subscriptions` | (custom) | Subscriptions | MRR source |
| `invoices` | (custom) | Invoices | mirror of Stripe |
| `engagements` | (custom) | Engagements | delivery records |
| `kpi_log` | (dashboards) | KPIs | metrics history |

## Pipeline stage mapping

| Canonical | HubSpot |
|---|---|
| lead | lead |
| sql | sql |
| discovery | discovery |
| proposal | proposal |
| negotiation | negotiation |
| won | closedwon |
| lost | closedlost (with reason) |

## Field mapping (companies)

Canonical → HubSpot property names (custom properties as needed):

`company_name→name`, `domain→domain`, `industry→industry`,
`employee_band→hs_num_employees_enum`, `hq_country→country`, `hq_city→city`,
`revenue_band→revenue_band`, `funding_total_usd→funding_total_usd`,
`ai_signals→ai_signals` (textarea), `pain_points→pain_points`,
`budget_estimate_usd→budget_estimate`, `fit_score→fit_score`,
`tier→meridian_tier`, `source_channel→source_channel`, `status→status`.

## Sync rules

- **Direction:** canonical DB → CRM (one-way push; CRM edits are discouraged).
- **Frequency:** real-time via webhook/n8n for deals/activities; nightly full reconcile.
- **Dedupe:** by normalized `domain` for companies; by email for contacts.
- **Failures:** sync failures logged; retry; escalate to Cog if > 2 consecutive.

## Airtable fallback

If HubSpot is not yet provisioned, Airtable base "Meridian CRM" with the same
table names. Connection via Airtable REST API. Schema-compatible by design.

## Related

`16-crm/schema.sql` · `02-leadgen/crm-record-spec.md` · `14-integrations/integration-matrix.md`
