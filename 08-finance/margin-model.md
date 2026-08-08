# Margin Model & Unit Economics — Meridian Research & Advisory

> Version 1.0 · Owned by Ledger (Finance) · Enforces the cost + 40% gross-margin floor. Read by Sales (Vector), Proposals (Quill), and Client Success (Halo) before any quote ships.

## Purpose

Compute per-service gross margin and unit economics so every engagement is priced above the floor and contributes to the ≥ 85% blended GM target. Define what makes a service profitable, what kills margin, and the discount floors the sales team may offer without escalation.

## Cost structure per service

Direct costs are delivery-only (COGS 5000–5030). S&M and G&A are deducted at the contribution level, not from GM. All costs scale with usage; there is zero fixed human payroll (agents only).

| Cost component | Category | Behavior | Example / basis |
|---|---|---|---|
| LLM tokens | 5000 COGS | Variable, per deliverable | ~$2–$40 per report draft depending on depth + retries |
| Infrastructure (hosting, DB, dashboards) | 5010 COGS | Mostly fixed, allocated per engagement | ~$200/mo total infra, spread across active engagements |
| Research data & APIs | 5020 COGS | Variable, per project | Paid feeds, databases, broker APIs |
| QA & human-gate costs | 5030 COGS | Variable, per deliverable | Reviewer/contractor fees, legal review on high-stakes reports |
| Tools & SaaS | 5200 G&A | Fixed monthly | n8n, CRM, e-sign, storage |
| S&M | 5100–5110 | Variable, ROI-gated | Content, ads, outreach tools |

### Cost table by service (representative standard price, monthly equivalent)

| Service | Std price | LLM cost | Infra alloc | Data/API | QA/human | Total COGS | GM | GM% |
|---|---|---|---|---|---|---|---|---|
| Intelligence Subscription | $2,500/mo | $80 | $30 | $60 | $40 | $210 | $2,290 | 91.6% |
| Fractional Advisory | $8,000/mo | $150 | $40 | $80 | $120 | $390 | $7,610 | 95.1% |
| AI Strategy Sprint | $9,000 | $180 | $60 | $150 | $200 | $590 | $8,410 | 93.4% |
| Custom Research (Std) | $8,000 | $250 | $80 | $400 | $300 | $1,030 | $6,970 | 87.1% |
| Data Products | $800/mo | $40 | $20 | $50 | $10 | $120 | $680 | 85.0% |
| Training | $4,000 | $30 | $20 | $30 | $120 | $200 | $3,800 | 95.0% |
| **Blended (weighted)** | — | — | — | — | — | — | — | **≈ 91%** |

Blended GM is above the 85% target because recurring lines dominate the mix. If a Deep-Dive Custom Research ($30k, heavy data + human review) is the dominant month, blended GM still holds above 85% at volume. Verify each month against actuals; the table is the model, actuals are the truth.

## Contribution analysis

| Level | Formula | Uses |
|---|---|---|
| Gross margin | (Revenue − COGS) ÷ Revenue | Service pricing floors, delivery efficiency |
| Contribution margin | (Revenue − COGS − S&M allocated) ÷ Revenue | Which services pay for G&A; go-to-market steering |
| Net margin | (Revenue − all costs) ÷ Revenue | Company target: positive by month 5 |

Allocation rule for S&M: attribute marketing spend to service lines by closed-deal attribution (CRM source). First-touch source wins; un-attributable spend is split by revenue share.

## Pricing floor rule

> **Never price below cost + 40% gross margin.** Floor = COGS ÷ (1 − 0.40) = COGS × 1.667.

| Service | Estimated COGS (worst case) | Price floor (40% GM) | List price | Headroom |
|---|---|---|---|---|
| Intelligence Subscription | $300/mo | $500/mo | $1,500–5,000/mo | 3–10× |
| Fractional Advisory | $400/mo | $667/mo | $5,000–15,000/mo | 7–22× |
| AI Strategy Sprint | $800 | $1,334 | $5,000–15,000 | 3.7–11× |
| Custom Research | $1,500 | $2,500 | $3,000–30,000 | 1.2–12× |
| Data Products | $150/mo | $250/mo | $200–2,000/mo | 0.8–8× |
| Training | $300 | $500 | $2,000–8,000 | 4–16× |

Headroom is the discount budget. The floor, not the list price, is the deal-breaker line. Note: entry Data Products ($200/mo) sits **below** the floor at worst-case COGS — if it ships, it must carry near-zero marginal COGS or be positioned as a loss-leader funded by subscription attach (explicit approval only).

## What makes a service profitable / unprofitable

| Profitable signal | Unprofitable signal |
|---|---|
| Recurring, predictable delivery (subs, retainers) | One-off, unscoped research with unbounded data pulls |
| Fixed scope, milestone-billed, ≥ 30% up front | Scope creep with no change order |
| Low human-gate cost (no legal review needed) | Heavy human review / contractor hours |
| Costs tracked per engagement (classes set) | Costs buried in G&A, never attributed |
| Renewal/expansion revenue counted at contribution | Single-digit-headroom deals discounting to floor |
| Data Products at scale (marginal cost → $0) | Data Products at $200/mo with fresh paid data each period |

Levers to fix a sub-floor service: raise price, narrow scope, cap data pulls, pre-sell multiple months, move human gate to periodic review, or attach it to a subscription.

## Decision rules for the sales team (discount floor per service)

Applied in `03-sales/proposal-generation` (Quill) and reviewed by Vector; anything below the floor auto-blocks the proposal.

| Service | Standard discount ceiling | Floor | Requires escalation (> 10% off list) |
|---|---|---|---|
| Intelligence Subscription | −10% (annual prepay) | −10% list, or −20% founding (first 10) | Any deal below cost + 40% GM → CEO + Ledger |
| Fractional Advisory | −10% annual | −20% founding first 3 mo | Below floor → block |
| AI Strategy Sprint | −10% | −20% founding | Below floor → block |
| Custom Research | −10% | −20% founding; −25% NP/Edu | Below floor → block |
| Data Products | −10% annual | −25% NP/Edu on subs | Entry tier only w/ attach; below floor → block |
| Training | −10% | — | Below floor → block |

Escalation path: Quill flags → Ledger verifies COGS → CEO approves > 10% exceptions → Owner only for legally binding price commitments outside policy. Founding-club terms expire for client #11+ (`00-company/pricing.md`).

## Monthly margin review (Ledger)

1. Pull actual COGS by class vs. model; recompute GM per service.
2. Flag services below floor for 2 consecutive months.
3. Refresh COGS estimates from actuals (rolling 3-month average).
4. Confirm blended GM ≥ 85% and net margin positive by M5.
5. Feed variance > 10% to CEO per `12-finance.md`; log to decision log.

## Related

`financial-model.md` · `ledger.md` · `finance-system.md` · `00-company/pricing.md` · `00-company/services.md` · `03-sales/` · `01-departments/12-finance.md` · `01-departments/13-accounting.md`
