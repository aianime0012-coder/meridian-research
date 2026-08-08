# Payments System — Meridian Research & Advisory

> Version 1.0 · Owned by Tally (Accounting) + Ledger (Finance) · Legitimate client payments → owner's connected business accounts, fully compliant.

## Objective

Collect payments for all services via licensed processors (Stripe primary,
PayPal secondary), with invoices, payment links, subscriptions, receipts,
refunds, and reconciliation — while honoring KYC, AML, OFAC, tax, and platform rules.

**Non-negotiable:** Meridian never bypasses compliance, never creates accounts
without the owner's authorization, and never touches money outside a licensed,
registered, owner-connected processor.

## Architecture

| Function | System | Status |
|---|---|---|
| Checkout (one-time) | Stripe Checkout / Payment Links | PENDING owner connect |
| Subscriptions | Stripe Billing | PENDING owner connect |
| Invoices | Stripe Invoicing (+ templates) | PENDING owner connect |
| Receipts | Stripe receipts / email | PENDING owner connect |
| Refunds | Stripe dashboard / API (policy below) | PENDING owner connect |
| Customer portal | Stripe Customer Portal | PENDING owner connect |
| Secondary payments | PayPal | PENDING owner connect |
| Accounting sync | Stripe exports → ledger → QuickBooks/Xero | Design |

## Payment flows

### One-time (projects/products)
1. Contract signed → Tally creates Stripe invoice (or payment link).
2. Payment due: 50% at kickoff / 50% at delivery (project default); 100% on delivery for products.
3. Stripe collects + emails receipt. Webhook → deal marked paid → Dispatch starts/continues delivery.

### Subscriptions
1. Client accepts proposal → Stripe subscription created (monthly or annual prepay −10%).
2. Auto-charge each period; webhooks update MRR, renewals, and dashboards.
3. Dunning: Stripe retry logic (3 retries over 7 days) + customer notice email.

### Invoices
- Auto-generated per `09-payments/templates/invoice-template.md` (branding, payment terms, tax fields).
- Net-15 for one-time; subscriptions at period start. Late: 1.5%/mo per MSA.

## Refund policy (documented in MSA + ToS)

| Case | Policy |
|---|---|
| Not-yet-started project | Full refund minus card fees |
| In-progress project | Prorated to delivered milestones |
| Subscription cancellation | Pro-rate to end of current period; no retro |
| Error/duplicate charge | Immediate full refund |
| Disputed/chargeback | Respond with evidence via Stripe; owner notified |

Refunds over $2,500 or any refund requested by a litigating client → COO + Legal review. Owner approves refunds to connected accounts' policies only per this policy.

## Reconciliation (WF-FN-05)

1. Daily: Stripe payouts vs. ledger expected.
2. Monthly: bank statement ↔ Stripe ↔ books reconcile to zero variance.
3. Exceptions > 48h → Tally → Ledger escalation.

## Compliance checklist (Solon reviews quarterly)

- [ ] Processor accounts belong to the registered owner entity (KYC complete).
- [ ] Beneficial-owner / OFAC screening aligned with processor requirements.
- [ ] AML: processor-native monitoring in place; no cash, no third-party payment rerouting.
- [ ] Tax: invoices carry required fields; sales/use tax handled per jurisdiction (consult professional).
- [ ] Data: PCI scope minimized (Stripe-hosted fields; no card data stored).
- [ ] Platform rules: no evasive practices, no incentivized fake activity.
- [ ] Records: 7-year retention of financial records.

## Owner actions (required to go live)

1. Register entity + EIN + business bank account.
2. Create Stripe account for the entity; complete KYC; verify bank; enable Customer Portal.
3. Create PayPal Business account; link.
4. Approve refund policy and discount floors.
5. Provide billing email + legal address for invoices.

## Related

`09-payments/templates/` · `08-finance/` · `10-legal/msa.md` · `10-legal/terms-of-service.md` · `14-integrations/integration-matrix.md`
