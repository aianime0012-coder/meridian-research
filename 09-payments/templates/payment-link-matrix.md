# Payment Link Matrix — Meridian Research & Advisory, LLC

> Ref: PAY-LNK-01 · Version: 1.0 · Owner: `[Owner / COO]` · Updated: `[YYYY-MM-DD]`

**Purpose:** Single source of truth for standard Stripe payment links and checkout configurations. Every link is created in Stripe (primary) or PayPal (secondary), is re-usable or one-time per spec below, and captures metadata for reconciliation.

**Naming convention:** `MRA-<SERVICE>-<VARIANT>` · All links are USD unless noted.

---

## 1. Sprint Milestone Engagements (50/50)

| Link ID | Name | Amount | Type | Variant |
|---|---|---|---|---|
| MRA-SPRINT-50 | Sprint Milestone — 50% | Variable | Fixed → set per deal | Milestone 1 |
| MRA-SPRINT-50 | Sprint Milestone — 50% | Variable | Fixed → set per deal | Milestone 2 |

- **Structure:** 50% upfront, 50% on delivery acceptance (per proposal).
- **Amount type:** Variable (owner sets amount at link creation per deal).
- **Metadata:** `deal_id`, `sprint_id`, `milestone` (1 or 2) captured as custom fields.
- **Used in:** Proposal signature stage, email invoice follow-up, portal payment page.
- **Note:** Do not reuse the same link for both milestones — create one link per milestone so reconciliation maps 1:1 to invoices.

---

## 2. Custom Research Tiers

| Link ID | Name | Amount | Type | Variant |
|---|---|---|---|---|
| MRA-RSRCH-T1 | Custom Research — Tier 1 | `[set per tier]` | Fixed per tier | Tier 1 |
| MRA-RSRCH-T2 | Custom Research — Tier 2 | `[set per tier]` | Fixed per tier | Tier 2 |
| MRA-RSRCH-T3 | Custom Research — Tier 3 | `[set per tier]` | Fixed per tier | Tier 3 |
| MRA-RSRCH-QUOTE | Custom Research — Quote | Variable | Variable | Custom scoped quote |

- **Fixed tiers** (T1–T3) are pre-priced, scoped deliverables.
- **Quote variant** is variable-amount; owner sets amount from the approved proposal.
- **Metadata:** `deal_id`, `tier`, `quote_ref`.
- **Used in:** Proposal, follow-up email, portal.

---

## 3. Product — One-Time

| Link ID | Name | Amount | Type | Variant |
|---|---|---|---|---|
| MRA-PROD-OT1 | `[Product name]` — One-Time | `[price]` | Fixed | One-time |
| MRA-PROD-OT2 | `[Product name]` — One-Time | `[price]` | Fixed | One-time |

- Fixed amount, non-subscription, single charge.
- **Metadata:** `product_id`, `sku`, `deal_id` (if applicable).
- **Used in:** Product landing page, post-sale confirmation email, portal.

---

## 4. Subscription Plans (Stripe Billing)

| Link ID | Name | Amount | Type | Variant |
|---|---|---|---|---|
| MRA-SUB-MO | `[Plan]` — Monthly | `[price/mo]` | Recurring monthly | Monthly |
| MRA-SUB-YR | `[Plan]` — Annual | `[price/yr]` | Recurring annual | Annual |
| MRA-SUB-TRIAL | `[Plan]` — Trial | `[trial period]` | Recurring + trial | Trial → paid |

- Built on **Stripe Billing** for dunning, proration, and automatic renewal.
- Annual = discounted; conversion messaging shown on checkout.
- **Metadata:** `plan_id`, `billing_period`, `source` (link/email/portal), `deal_id`.
- **Used in:** Proposal, welcome email, portal self-serve signup.
- **Note:** Never create subscription links with PayPal unless the plan is also mirrored there; keep Stripe as the single source of truth for subscriptions.

---

## 5. One-Time Add-Ons & Miscellaneous

| Link ID | Name | Amount | Type | Variant |
|---|---|---|---|---|
| MRA-ADD-01 | `[Add-on / rush fee]` | Variable | Variable | Set per need |
| MRA-ADD-02 | `[License / data product]` | `[price]` | Fixed | One-time |

- Variable add-on: owner sets amount at creation; must carry `deal_id` and reason.
- **Used in:** Email upsell, invoice note, portal.

---

## 6. Link Creation Checklist (all links)

- [ ] Amount type chosen deliberately (fixed vs variable) — variable only when owner sets it per deal.
- [ ] Custom metadata fields set: `deal_id`, service code, source.
- [ ] Tax behavior configured (collect sales/VAT where applicable).
- [ ] Confirmation email enabled with receipt template.
- [ ] Link mapped in this matrix under its service; unused/expired links archived.
- [ ] Test payment run on a live-key link before first client use (refunded immediately).
- [ ] Named per `MRA-<SERVICE>-<VARIANT>` convention.

---

## 7. Where Links Are Used

| Channel | Link Used | Notes |
|---|---|---|
| Proposal | Milestone 50%, research tier, subscription link | Embedded in proposal doc + signature step |
| Email | Milestone link, invoice payment link, add-on | Invoicing + follow-ups |
| Portal | All | Self-serve payment page, subscriptions, receipts |
| Landing page | Product one-time links | Direct checkout |

---

## 8. Governance

- All links created/edited only by `[Owner / COO]`; no agent (AI) creates links without approval.
- Quarterly audit: every live link checked against this matrix; stale links archived.
- Any link not listed here is non-standard and requires Owner approval before use.

---

**Approved by:** `[Owner / COO name]` — `[date]`
