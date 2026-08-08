# Finance System — Meridian Research & Advisory

> Version 1.0 · Owned by Ledger (Finance) + Tally (Accounting) · Real-time visibility, conservative forecasting, clean books.

## Objective

Track every dollar: revenue, expenses, MRR/ARR, profit, taxes, invoices,
payroll, cash flow, forecasts, margins. Produce dashboards and reports, and
surface improvements automatically.

## Financial KPIs (definition authority: `08-finance/kpi-dictionary.md`)

| KPI | Definition | Target |
|---|---|---|
| MRR | Monthly recurring revenue | growing ≥ 10%/mo (Y1) |
| ARR | MRR × 12 (+ annualized one-offs) | per plan |
| Gross margin | (Revenue − delivery cost) ÷ revenue | ≥ 85% |
| Net margin | (Revenue − all costs) ÷ revenue | positive by M5 |
| Cash runway | Cash ÷ monthly burn | ≥ 12 months |
| Net revenue retention | (MRR incl. expansions − churn) ÷ prior MRR | ≥ 110% |
| CAC | Sales+marketing cost ÷ new clients | ≤ $300 |
| DSO | Days sales outstanding | ≤ 30 |
| Churn | Canceled MRR ÷ total MRR | ≤ 5%/mo |

## Books structure

- Chart of accounts + double-entry ledger: `08-finance/ledger.md` (implemented in the DB via `kpi_log` + Stripe exports + accounting sync to QuickBooks/Xero).
- Monthly close: reconcile Stripe ↔ bank ↔ books (WF-FN-05).
- Tax: quarterly prep pack (WF-FN-06), owner files with professional help (human gate).

## Financial model

`08-finance/financial-model.md` — Y1–Y3 P&L, cash flow, unit economics, scenario planning (base/bull/bear).

## Cash flow & forecasting

- Weekly forecast (WF-FN-04): expected receipts (invoices due, subs), committed costs (infra, LLM, tools), runway.
- Conservative: recognize revenue when delivered; invoice in advance for subs.
- Alert if runway < 12 months or MRR regresses 2 consecutive weeks.

## Cost control

| Category | Budget |
|---|---|
| Infrastructure (hosting, DB, dashboards) | < $200/mo |
| LLM/token costs | < $800/mo (Y1) |
| Tools/SaaS (CRM, email, scheduling, e-sign) | < $500/mo |
| Marketing spend | variable, ROI-gated |
| Owner salary/draw | as agreed (human gate) |

Every cost is categorized and reviewed monthly by Ledger; anomalies escalate to COO.

## Revenue recognition

- **Subscriptions:** recognized monthly as delivered.
- **Projects:** milestone-based (or % complete), matching delivery.
- **One-time products:** at delivery.
Rule keeps books aligned with QA-passed deliverables (no revenue before delivery).

## Reports produced (automated)

1. Daily: KPI snapshot.
2. Weekly: cash flow forecast, MRR update.
3. Monthly: P&L, MRR/ARR, churn cohort, margin report, close.
4. Quarterly: tax prep pack, pricing review input.
5. On-demand: investor pack (Delphi).

## Escalation

- Forecast misses > 20% → Ledger → CEO within 24h.
- Unreconciled transactions > 48h → Tally → Ledger.
- Tax/legal questions → Solon (Compliance) + Amicus (Legal) → owner for filing.

## Related

`financial-model.md` · `kpi-dictionary.md` · `ledger.md` · `09-payments/` · `15-dashboards/finance.html` · `01-departments/12-finance.md`
