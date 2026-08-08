# Meridian Research & Advisory, LLC — Payment Receipt

> *"Decisions beyond the horizon."*

---

## 1. Receipt Header

| Field | Value |
|---|---|
| **Receipt #** | `[RCT-YYYY-NNNN]` |
| **Receipt Date** | `[YYYY-MM-DD]` |
| **Invoice Reference** | `[INV-YYYY-NNNN]` |
| **Client / Payer Name** | `[Client Legal Name]` |
| **Billed To** | `[Client Email / Account]` |

---

## 2. Amount Paid

| Field | Value |
|---|---|
| **Amount Paid** | `[USD]` |
| **Currency** | USD |
| **Payment Method** | `[Card (Visa/MC/Amex) · PayPal · ACH]` |
| **Payment Reference / Last 4** | `[Stripe charge ID / PayPal txn ID / Last 4 digits]` |
| **Applied To** | `[Invoice INV-YYYY-NNNN — full or partial]` |
| **Balance Remaining** | `[USD]` *(if partial payment)* |

> **Security note:** This receipt references a processor transaction ID only. Meridian does not retain, display, or store your full card number.

---

## 3. Subscription Details *(only if payment is subscription-related)*

| Field | Value |
|---|---|
| **Subscription Plan** | `[Plan name, e.g. Horizon Pro — Monthly]` |
| **Billing Period Covered** | `[YYYY-MM-DD] to [YYYY-MM-DD]` |
| **Next Renewal Date** | `[YYYY-MM-DD]` |
| **Manage / Cancel** | `[Client Portal link]` or reply to `billing@meridianra.com` |

*If this is a one-time or milestone payment, this section may be omitted.*

---

## 4. What This Payment Covers

- `[Deliverable, service, or billing period]`
- `[Reference to engagement, proposal #, or purchase]`
- `[Any applicable tax amounts included]`

---

## 5. Support & Billing Contact

- **Email:** `billing@meridianra.com`
- **Phone / Hours:** `[Phone]` — `[Mon–Fri, 9:00–18:00 ET]`
- **Portal:** `[Client portal URL]`
- **General:** `[Support email / Slack / Discord]`
- **Refund policy:** Refunds are processed per our documented refund policy, available at `[URL to refund policy]` or on request.

---

## 6. Footer

Meridian Research & Advisory, LLC · `[Registered Address]` · `billing@meridianra.com` · meridianra.com
Tax ID (EIN): `[EIN]` · This is an automated confirmation of payment. No card data is stored by Meridian.

---

*Decisions beyond the horizon. Questions about this receipt? Reply to `billing@meridianra.com` referencing Receipt `[RCT-YYYY-NNNN]`.*
