# Ledger & Double-Entry Design — Meridian Research & Advisory

> Version 1.0 · Owned by Tally (Accounting) + Ledger (Finance) · Source of truth for every dollar. Implements the books structure in `08-finance/finance-system.md`.

## Purpose

Define the chart of accounts, posting rules, revenue recognition, and the reconciliation flow that keeps Stripe/PayPal, the bank, and the ledger (→ QuickBooks/Xero) in agreement at all times. The ledger is the foundation for WF-FN-05 (month-end close) and WF-FN-06 (tax prep).

## Chart of accounts (numeric codes)

Codes follow a 4-digit convention. Assets 1000s, Liabilities 2000s, Equity 3000s, Revenue 4000s, Expenses 5000s. Classes (QuickBooks/Xero "classes") track service line + billable/non-billable.

| Code | Account | Type | Notes |
|---|---|---|---|
| 1000 | Cash — Operating (checking) | Asset | Primary bank account |
| 1010 | Cash — Stripe balance | Asset | Held float, swept to 1000 |
| 1020 | Cash — PayPal balance | Asset | Secondary, swept monthly |
| 1100 | Accounts Receivable | Asset | Invoiced but unpaid |
| 1200 | Prepaid Expenses | Asset | Annual tool/subscription prepaids |
| 1300 | Customer Deposits | Asset | Net of liability 2300 tracking |
| 1400 | Fixed Assets (computer/equipment) | Asset | > $2,500 capitalization threshold |
| 1500 | Accumulated Depreciation | Asset (contra) | Straight-line, 3–5 yr |
| 2000 | Accounts Payable | Liability | Vendor invoices due |
| 2100 | Credit Card Payable | Liability | Merchant card balances |
| 2200 | Sales/Use Tax Payable | Liability | Only where owed (see tax-playbook) |
| 2300 | Deferred Revenue | Liability | Unearned subscription/prepay |
| 2400 | Customer Deposits (liability) | Liability | Money in advance of delivery |
| 2500 | Accrued Expenses | Liability | QBI/est. tax accruals, unpaid bills |
| 2600 | Contractor/1099 Payable | Liability | Due to contractors at cutoff |
| 2700 | Estimated Income Tax Payable | Liability | Quarterly payments (owner/CPA) |
| 3000 | Owner's Capital | Equity | Member contributions |
| 3100 | Owner's Draw | Equity (contra) | Distributions to owner |
| 3200 | Owner's Equity — Prior Year | Equity | Rollforward at year end |
| 4000 | Revenue — Intelligence Subscription | Revenue | Recurring, monthly recognition |
| 4100 | Revenue — Fractional Advisory | Revenue | Recurring retainer |
| 4200 | Revenue — AI Strategy Sprint | Revenue | Project, milestone recognition |
| 4300 | Revenue — Custom Research | Revenue | Project, milestone recognition |
| 4400 | Revenue — Data & Insight Products | Revenue | Recurring + one-time license |
| 4500 | Revenue — Training & Enablement | Revenue | One-time, at delivery |
| 4600 | Revenue — Bundles & Other | Revenue | Starter/Scale/Enterprise Watch |
| 4700 | Revenue — Discounts & Credits | Revenue (contra) | Founding, annual prepay, NP |
| 5000 | COGS — LLM Token Consumption | Expense | Direct variable cost per deliverable |
| 5010 | COGS — Infrastructure (hosting/DB) | Expense | Direct delivery infra |
| 5020 | COGS — Research Data & APIs | Expense | Paid data sources, per project |
| 5030 | COGS — QA & Human-Gate Costs | Expense | Contractors, reviewer fees |
| 5100 | S&M — Marketing Spend | Expense | Ads, content boost, campaigns |
| 5110 | S&M — Sales Tools (CRM/email) | Expense | HubSpot, sequencing, e-sign |
| 5200 | G&A — Tools & SaaS | Expense | n8n, dashboards, storage, misc |
| 5210 | G&A — Legal & Compliance | Expense | Counsel, filings, compliance tools |
| 5220 | G&A — Tax & Accounting | Expense | CPA, software (QBO/Xero), payroll fees |
| 5230 | G&A — Bank & Payment Fees | Expense | Stripe/PayPal fees |
| 5240 | G&A — Insurance | Expense | E&O/general liability if held |
| 5300 | Owner Draw | Equity | Post via 3100, not P&L |

Rules: no revenue account may be posted directly from cash; every entry flows through AR or deferred revenue. Expenses map 1:1 to budget lines in `08-finance/finance-system.md` cost control table.

## Transaction entry rules

1. Every transaction has equal debits and credits; books never balance by fiat.
2. Source every entry to a document: Stripe `balance_transaction` id, PayPal `txn_id`, invoice number, or receipt URL.
3. No entry without a class: `[Service Line] · [Billable|Non-billable]` (e.g. `Intelligence · Billable`).
4. Two-sided reversals for corrections: post a reversing entry, never delete history.
5. Stripe/PayPal processing fees post to 5230 at transaction time (net cash to 1000/1010).
6. Refunds post as contra-revenue to 4700 in the refund period (not a fee adjustment).
7. Owner draws: single-leg via 3100 → 1000, never mixed with payroll (owner is not an employee).
8. Deposits received before delivery post to 2400 (liability); convert to revenue only when recognition criteria are met.
9. Uncategorized items older than 48h auto-flag to Tally (escalation per `13-accounting.md`).

## Revenue recognition rules

Recognition is tied to delivery, not to cash in hand. Rule of thumb: no revenue before QA-passed deliverable.

| Service | Recognition basis | Timing | Account path |
|---|---|---|---|
| Intelligence Subscription | Monthly pro-rata | Each month served (charge at period start) | 4000; unearned → 2300 |
| Fractional Advisory Retainer | Monthly pro-rata | Each month served | 4100 |
| AI Strategy Sprint | Milestone (% complete) | ≥ 30% at kickoff, then per milestone | 4200 via 2400/2300 |
| Custom Research | Milestone (kickoff/mid/delivery) | Billed at ≥ 30% kickoff | 4300 |
| Data & Insight Products | At delivery | License/snapshot issuance | 4400 |
| Training & Enablement | At delivery | Workshop completion | 4500 |
| Bundles | Decompose per component | Sub components monthly, one-time at delivery | 4600/4000 etc. |
| Annual prepay (−10%) | Monthly pro-rata over term | Amortize across 12 months | 2300 → 4000 monthly |

Proration: mid-cycle changes recognize only the served portion; the remainder stays in 2300/2400. Milestone recognition requires a signed-off acceptance record (QA gate, WF-DV-04).

## Reconciliation flow (Stripe exports → ledger → QuickBooks/Xero)

```
Stripe exports ──┐
                 ├──► n8n import (WF-FN-03/WF-FN-05) ──► Ledger (SQLite + journal) ──► QuickBooks/Xero sync ──► Reports
PayPal exports ──┘              │                                                             │
Bank statements ───────────────┴──► match on txn_id / memo / date ──► exceptions queue ──► Tally review
```

| Step | Cadence | Owner | Output |
|---|---|---|---|
| Pull Stripe balance_transactions + invoices + refunds | Daily | Ledger | Raw events table |
| Pull PayPal transactions | Daily | Ledger | Raw events table |
| Auto-match bank statement lines to ledger | Daily | Tally | Matched + unmatched sets |
| Post fees, refunds, payout sweeps | Daily | Tally | Journal entries |
| Classify revenue per recognition rules | Nightly | Ledger | Recognized revenue rows |
| Sync journal to QuickBooks/Xero | Daily | Tally | Mapped GL entries |
| Full reconciliation sweep + exceptions queue | Weekly | Tally | Open items ≤ 2 |
| Close period (WF-FN-05) | Monthly, day 1–5 | Tally + Ledger | Closed ledger, P&L/BS/CF |

Rule: QuickBooks/Xero is the downstream official record; the SQLite ledger is the working layer. Changes are made in the ledger, re-synced, never hand-edited in QBO/Xero.

## Month-end close checklist (WF-FN-05)

Runs on the 1st, must complete by day 5 (KPI: days to close ≤ 5).

1. [ ] Confirm all Stripe/PayPal/bank transactions through month-end are imported and matched (unmatched ≤ 2).
2. [ ] Post accrued expenses and prepaid amortization (1200, 2500).
3. [ ] Verify deferred revenue (2300) balance equals unearned subscription/prepay schedule.
4. [ ] Reconcile AR aging; flag invoices > 30 days past due to Halo.
5. [ ] Post refunds/credits to 4700 in the month issued.
6. [ ] Run revenue-recognition check: every recognized amount has a delivery/QA record.
7. [ ] Reconcile 1010 (Stripe) and 1020 (PayPal) to provider payout/balance reports.
8. [ ] Verify owner draw (3100) matches authorized disbursements.
9. [ ] Compute gross margin per service line; flag below cost + 40% floor (`margin-model.md`).
10. [ ] Close the period in QBO/Xero; freeze prior period; snapshot to `kpi_log`.
11. [ ] Produce P&L, balance sheet, cash flow inputs for Ledger's monthly pack.
12. [ ] Log close exceptions + lessons to `11-knowledge/` and file summary to `08-finance/`.

Human gate: legal filings, entity transactions, and disbursements remain owner-approved; the close itself is autonomous.

## Related

`finance-system.md` · `financial-model.md` · `margin-model.md` · `tax-playbook.md` · `00-company/pricing.md` · `09-payments/` · `WF-FN-03` · `WF-FN-05` · `WF-FN-06` · `17-ops/workflows/runbook-template.md` · `01-departments/12-finance.md` · `01-departments/13-accounting.md`
