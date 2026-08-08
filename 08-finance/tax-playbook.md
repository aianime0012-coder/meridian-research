# Tax Playbook — Meridian Research & Advisory

> Version 1.0 · Owned by Tally (Accounting) + Solon (Compliance) · Prepares, never files. Filing and legal tax decisions are the human owner's gate. **Not tax advice** — every item here is a prep checklist for the owner and their CPA.

## Legal structure (default)

- **Single-member US LLC** — default federal tax classification is **disregarded entity**: no separate federal return; activity reported on the owner's personal return (Form 1040 + Schedule C, or Schedule E if elected) — pass-through.
- **Confirm the election**: verify the LLC default at formation; if the owner ever adds a member, the default changes and a partnership/elective S-Corp election (Form 8832 / Form 2553) must be considered with a professional. Any change to classification is an owner decision.
- State-level: the LLC must be registered in its home state; check state income tax / franchise tax and registration requirements in every state where the business has economic nexus (see jurisdiction note below).
- Owner = sole shareholder; an **owner-approved filing** is required for every return. Meridian agents prepare inputs; only the owner (or the owner's appointed CPA/EO) transmits.

## Expense categorization for deductions (maps to ledger 5000s/5100s/5200s)

Categorization drives the Schedule C / Schedule E deduction schedule. Keep a clean class on every entry (`ledger.md`).

| Category | Ledger | Deductible treatment (US federal, general) | Notes |
|---|---|---|---|
| LLM tokens / APIs | 5000 | Ordinary business expense | Keep usage invoices per provider |
| Hosting, infrastructure | 5010 | Ordinary business expense | Apportion if any personal use |
| Research data subscriptions | 5020 | Ordinary business expense | Business-purpose support |
| QA / contractor review | 5030 | Contract labor | 1099-NEC if contractor ≥ $600/yr |
| Marketing & ads | 5100–5110 | Advertising expense | Deductible as incurred |
| Tools & SaaS (n8n, CRM, storage) | 5200 | Software subscriptions; prepaid amortized | Annual prepaids amortize over term |
| Legal & compliance | 5210 | Business legal fees | — |
| Tax & accounting (CPA, QBO/Xero) | 5220 | Professional fees | — |
| Payment processing fees | 5230 | Bank charges / merchant fees | Stripe/PayPal statements retained |
| Insurance | 5240 | Insurance premium | If held |
| Home office / internet | 5210 (allocated) | Simplified or actual method | Requires regular+exclusive use; documented |
| Owner draw | 3100 | NOT deductible | Distribution, not wages; no payroll tax |
| Equipment | 1400 | Depreciate (or §179/bonus election) | > $2,500 threshold; election is a professional matter |

Rule: every deduction must trace to a receipt + business purpose. Tally files the receipt URL with the entry; no receipt = flag, no claim.

## Quarterly estimated tax prep (WF-FN-06)

Single-member LLC owners generally pay self-employment tax + income tax via **estimated quarterly payments** (Form 1040-ES). Federal estimates are generally due on the 15th of April, June, September, and January.

| Quarter | Fed estimated due (typical) | Prep timing | Ledger inputs |
|---|---|---|---|
| Q1 (Jan–Mar) | Apr 15 | Mar 25 – Apr 10 | YTD revenue, COGS, expenses |
| Q2 (Apr–May) | Jun 15 | May 25 – Jun 10 | YTD + accruals |
| Q3 (Jun–Aug) | Sep 15 | Aug 25 – Sep 10 | YTD + forecast variance |
| Q4 (Sep–Dec) | Jan 15 (next yr) | Dec 25 – Jan 10 | Full-year projection |

Steps (WF-FN-06, quarterly, Tally + Solon): 1) pull YTD P&L from ledger; 2) project full-year revenue/margin; 3) compute safe-harbor comparison (100%/110% of prior-year liability — owner/CPA decides); 4) assemble 1040-ES prepack with categorization + receipts; 5) **route to owner/CPA for calculation and payment** — agents never remit. State estimates (where required) follow the same prepack pattern with state-specific dates.

## Sales & use tax on digital services

Digital services tax treatment varies widely by state; there is no single federal rule. Confirm per-state rules before charging or remitting anything.

| Scenario | Consideration | Action |
|---|---|---|
| US client in a state that taxes SaaS/digital services | May owe state sales tax | Confirm state rule + nexus; register only where required |
| Client provides a resale/exemption certificate | May be exempt | Collect + file certificate (10-legal/) |
| International client | No US sales tax; client-side VAT/GST may apply | See international note below |
| No economic nexus / no tax on service | Nothing to collect | Keep a documented position note per state |

Rule: Meridian does not self-assess sales tax positions. Tally flags any client state with taxable-digital-services rules; the owner/CPA confirms whether to register and collect. Never charge tax unless confirmed.

## 1099 / contractor handling

- Pay contractors ≥ $600 in a calendar year → **Form 1099-NEC** is generally required (owner/CPA files by the applicable deadline).
- Collect **W-9** before first payment (meridian standard, `10-legal/`).
- Contractors are independent; Meridian issues no W-2 (no employees in Y1). If owner ever pays themselves wages, they become an employee for payroll purposes — an owner decision.
- Maintain a contractor register: name, TIN via W-9, amounts, invoices, 1099 status.

## International clients — VAT/GST note

- No US sales tax on exports, but the client's country may impose **reverse charge / self-assessment** or require the client to withhold tax on payments to US providers.
- Some jurisdictions require **local VAT/GST registration** for digital B2B services (e.g. certain EU/B2C digital rules) — scope depends on jurisdiction and client type.
- Withholding taxes on service payments are a treaty-by-treaty matter.

> **Not tax advice.** Meridian agents prepare documentation; the owner consults a qualified tax professional for any international, VAT/GST, withholding, or registration question.

## Deadlines calendar (US federal, typical)

| Date | Item | Owner of action |
|---|---|---|
| Monthly 1–5 | Close prior month (WF-FN-05) | Tally |
| Quarterly (Apr/Jun/Sep/Jan 15) | Fed estimated payment (1040-ES) | Owner/CPA |
| Jan 31 | W-2/1099-NEC (if applicable) | Owner/CPA |
| Mar 15 | S-Corp/partnership returns (if ever applicable) | Owner/CPA |
| Apr 15 | Personal return (1040/Schedule C) + Q1 estimate | Owner/CPA |
| Jun 15 / Sep 15 / Jan 15 | Q2/Q3/Q4 estimates | Owner/CPA |
| Rolling | State registration/franchise deadlines (varies) | Owner/CPA |

Agents maintain a living calendar in `17-ops/schedules/`; every item routes to the owner/CPA gate before any payment or filing.

## Records retention

| Record | Retention | Storage |
|---|---|---|
| Bank/provider statements | 7 years | Vault + QBO/Xero attachment |
| Invoices, contracts, SOWs | 7 years after close | `10-legal/` + ledger link |
| Receipts (all expense entries) | 7 years | Ledger attachment |
| Tax returns + support | 7+ years (recommend lifetime) | Owner's secure storage |
| W-9s / 1099 data | 4 years after filing | Vault |
| LLM/API usage invoices | 7 years | Ledger attachment |

Backups: daily (`WF-OP-02`); QBO/Xero is the durable official record.

## Hard rule: human gate on filing

1. Meridian agents **prepare** (ledger, categorization, prepack, deadline alerts).
2. The **owner** (or owner-appointed CPA/EO) computes, reviews, and **files/pays** — always.
3. No agent transmits a return, remits a payment, registers with a tax authority, or signs a tax document. Period.
4. Any agent-proposed tax position is presented with evidence and routed to the owner for decision (`00-company/decision-log.md`).

## Related

`ledger.md` · `finance-system.md` · `margin-model.md` · `WF-FN-05` · `WF-FN-06` · `17-ops/schedules/cron-schedule.md` · `01-departments/13-accounting.md` · `01-departments/15-compliance.md` · `10-legal/` · `09-payments/`
