# Dashboards — Meridian Research & Advisory

> Version 1.0 · Owned by Euclid (Analytics) · Live KPI views refreshed nightly by WF-OP-03.

## How to run

Open `index.html` in any browser — it loads `data.json` (seed data mirroring the
Year-1 financial model). For live data, point the dashboard at the ops DB:

1. Implement the `kpi_log` schema (`16-crm/schema.sql`) in SQLite.
2. Expose KPIs via a tiny API or generate `data.json` nightly (WF-OP-03).
3. Keep the JSON shape in `data.json` unchanged.

## Views

| Tab | Content | Source |
|---|---|---|
| Company | MRR, ARR, revenue, margins, runway, accounts, churn, NRR | `kpi_log` |
| Finance | Revenue & MRR series, cash forecast, expenses | Stripe + ledger |
| Sales | Pipeline, win rate, deal size, cycle, sources | CRM |
| Marketing | MQLs, conversions, SEO sessions, newsletter | HubSpot + analytics |
| Ops & Quality | On-time, QA pass, automation coverage, uptime, CSAT | workflow log + QA log |

## KPI definitions

Single source of truth: `08-finance/kpi-dictionary.md`. Never redefine a metric
here — update the dictionary and decision log instead.

## Extension

- Add auth when the dashboard is exposed (opencode/Cloudflare Access, SSO).
- Mobile-friendly by default; add alerting (Slack/email) on thresholds via n8n.
- Chart library swap (Chart.js/Recharts) allowed; keep data shape stable.

## Related

`08-finance/kpi-dictionary.md` · `17-ops/workflows/WF-OP-03.md` · `01-departments/25-analytics.md`
