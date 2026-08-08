# KPI Dictionary — Meridian Research & Advisory

> Version 1.0 · Owned by Euclid (Analytics) · Single definition authority for every metric on every dashboard. No metric is tracked until it is defined here.

## Definitions

| KPI | Formula | Frequency | Source | Owner |
|---|---|---|---|---|
| MRR | Sum of active subscription revenue (normalized to monthly) | Daily | Stripe + subscriptions | Ledger |
| ARR | MRR × 12 (+ annualized one-offs) | Daily | computed | Ledger |
| New MRR | MRR from new accounts this period | Daily | Stripe | Ledger |
| Expansion MRR | MRR increase from upsells | Daily | Stripe | Ledger |
| Contraction MRR | MRR decrease from downsells | Daily | Stripe | Ledger |
| Churned MRR | MRR lost to cancellations | Daily | Stripe | Ledger |
| Net Revenue Retention | (MRR − churn + expansion) ÷ prior MRR | Monthly | Stripe | Ledger |
| Gross margin | (Revenue − delivery cost) ÷ revenue | Monthly | ledger | Ledger |
| Net margin | (Revenue − all costs) ÷ revenue | Monthly | ledger | Ledger |
| Runway | Cash ÷ monthly net burn | Weekly | bank + forecast | Ledger |
| CAC | (S&M spend) ÷ new paying accounts | Monthly | ledger + Stripe | Ledger |
| DSO | (AR × days) ÷ revenue | Monthly | invoices | Tally |
| Churn rate | Churned MRR ÷ prior MRR | Monthly | Stripe | Ledger |
| Active accounts | Accounts with paid subscription | Daily | Stripe | Ledger |
| Pipeline value | Sum of open deals × probability | Daily | CRM | Vector |
| Win rate | Won ÷ (Won + Lost) | Monthly | CRM | Vector |
| Sales cycle | Median days first-touch → won | Monthly | CRM | Vector |
| Avg deal size | Booked revenue ÷ won deals | Monthly | CRM | Vector |
| MQLs | Marketing-qualified contacts | Daily | HubSpot | Astra |
| MQL→SQL | SQL ÷ MQL (cohort) | Monthly | CRM | Vector |
| Lead→SQL | SQL ÷ A+B leads | Monthly | CRM | Ranger |
| SQL→Won | Won ÷ SQL | Monthly | CRM | Vector |
| Organic sessions | Sessions via organic search | Daily | Plausible/GA4 | Astra |
| Newsletter open rate | Opens ÷ delivered | Weekly | Resend | Astra |
| CSAT | Avg client rating (1–5) | Per deliverable | feedback | Halo |
| NPS | Promoters − detractors (0–10 scale) | Quarterly | survey | Halo |
| On-time delivery | Milestones met on date ÷ due | Monthly | engagements | Kepler |
| QA pass rate | First-pass QA pass ÷ reviewed | Monthly | QA log | Norm |
| Automation coverage | Automated steps ÷ total repeatable steps | Monthly | workflow log | Cog |
| Uptime (critical workflows) | Successful runs ÷ total runs | Daily | workflow log | Cog |

## KPI tree

```
Revenue (MRR/ARR/one-time)
├── Acquisition: CAC, lead→SQL, SQL→Won, win rate
├── Retention: churn, NRR, CSAT, NPS, renewal rate
└── Expansion: upsell MRR, attach rate
Profit: GM, net margin, runway
Efficiency: automation coverage, delivery on-time, QA pass, uptime
```

## Recording

- All KPIs logged to `kpi_log` (schema `16-crm/schema.sql`) nightly by WF-OP-03.
- Dashboards read from `kpi_log` (`15-dashboards/`).
- Definitions change only via decision log (D-metric format) — no silent redefinitions.

## Related

`finance-system.md` · `15-dashboards/` · `01-departments/25-analytics.md`
