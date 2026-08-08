# Refund SOP — Meridian Research & Advisory, LLC

> Ref: PAY-REF-01 · Version: 1.0 · Owner: `[Owner / COO]` · Effective: `[YYYY-MM-DD]`

**Purpose:** Define how refund requests are received, evaluated, approved, processed, and documented. Applies to all engagements, products, and subscriptions billed through Stripe (primary) and PayPal (secondary).

**Guiding principle:** Evidence-first, fair, and consistent. Refunds follow the published refund policy and are never decided ad hoc.

---

## 1. Refund Policy Summary (published)

- **Not-started work:** Full refund of the amount paid, no questions asked, upon written request.
- **In-progress project / milestone:** Prorated refund for uncompleted, unbilled portions of the engagement as documented in the proposal.
- **Subscriptions:** Pro-rated refund for the unused portion of the current billing period; cancellation takes effect at the end of the current period unless a partial refund is approved.
- **Duplicates / overpayments:** Full immediate refund of the duplicated amount.
- **Disputes / chargebacks:** Processed through the card network's formal dispute flow; the chargeback fee `[amount]` is not refundable unless the dispute is won.
- **Time limits:** Requests must be made within `[30]` days of the relevant payment unless a written exception is approved.
- **Exclusions:** Completed deliverables delivered and accepted are not refundable; goodwill refunds are discretionary per Section 3.

---

## 2. Request Intake

1. Client submits request via `[billing@meridianra.com / Client Portal / Support]` referencing the invoice or charge ID.
2. **Intake log:** Record request in the payment ledger: date, client, invoice #, amount paid, amount requested, reason, supporting evidence.
3. Acknowledge receipt within **1 business day** with a ticket/reference number.
4. No refund requests are taken verbally; all requests must be in writing (email or portal) for auditability.

---

## 3. Eligibility Check (vs. Policy)

| Scenario | Determination | Outcome |
|---|---|---|
| Not-started | Request before kickoff/delivery | Full refund |
| In-progress project | Partial delivery | Prorated per proposal terms |
| Subscription | Mid-cycle cancellation | Pro-rate unused period |
| Duplicate charge | Same invoice paid twice | Immediate full refund |
| Dispute / chargeback | Cardholder filed with bank | Route to evidence flow (Section 5) |
| Completed & accepted | Deliverable delivered | Denied (per policy), document response |
| Goodwill | None of the above | Discretionary (Section 4) |

Confirm against the **documented refund policy** before proceeding. If policy is ambiguous, escalate to `[Owner / COO]` rather than deciding.

---

## 4. Approval Thresholds

| Amount | Approval Authority |
|---|---|
| **< $2,500** | Auto-approve if the claim maps 1:1 to the policy (Section 3) |
| **$2,500 – $10,000** | COO review + sign-off |
| **> $10,000** | COO **and** Legal / Owner review + sign-off |
| **Goodwill (any amount)** | Owner (sole shareholder) approval required |

- Auto-approval is only valid when the policy check is unambiguous; anything with an exception flag escalates.
- All approvals are recorded with the approver's name, date, and rationale in the payment ledger.

---

## 5. Dispute / Chargeback Evidence Flow

1. On dispute/chargeback notice from Stripe/PayPal, freeze the related invoice as `disputed` in the ledger.
2. Within `[3]` business days, gather evidence pack:
   - Signed proposal / agreement
   - Invoice and proof of delivery
   - Email thread showing delivery/acceptance
   - Any refund already issued (to refute double-credit claims)
3. Submit evidence through the processor's dispute portal (Stripe Dashboard → Disputes; PayPal Resolution Center).
4. Track the dispute to resolution; update ledger and notify client of the outcome.
5. **Do not** refund directly outside the dispute flow while a chargeback is pending — this risks double payout.

---

## 6. Processing (Stripe / PayPal)

- **Refund the original charge** — never issue a "new payment" to simulate a refund.
- **Stripe:** Dashboard → Payments → open charge → *Refund*. Use full or partial amounts; reason codes where available. Record the refund ID.
- **PayPal:** Transaction → *Issue a refund*, full or partial; record the transaction ID.
- Partial refunds: state the remaining balance and confirm with the client.
- Refunds may be issued to the **original payment method only**. If the original method is closed, issue via the processor's recommended flow — never cash, check, or wire without Owner approval.

---

## 7. Client Notification

Send the client a confirmation (using the receipt template as reference) within 1 business day of processing:

- Refund reference number
- Amount and method of refund
- Expected arrival window: `[5–10]` business days for card, `[3–5]` for PayPal, per processor
- Status of the related invoice (closed / partially paid / reopened)
- Support contact for follow-up

---

## 8. Ledger Update & Documentation

1. Update the payment ledger: mark invoice status `refunded` / `partially-refunded`; attach refund ID, amount, date, approver.
2. Attach refund record to the client's account file (Stripe customer + internal record).
3. Save intake request, eligibility check, approval, and notification in the audit trail (WF-FN-05 compatible).
4. Flag any recurring refund patterns (same client, same service) to `[Owner / COO]` for review — repeated refunds may indicate a pricing or delivery issue.

---

## 9. Controls & Compliance

- Meridian **never stores card data**; refunds run entirely through the processor (PCI-compliant).
- Refunds are not a substitute for policy changes — policy deviations require Owner approval.
- Quarterly review of refund rates against revenue; report to Owner.
- This SOP is reviewed annually or on any processor or policy change.

---

**Approved by:** `[Owner / COO name]` — `[date]`
**Next review:** `[YYYY-MM-DD]`
