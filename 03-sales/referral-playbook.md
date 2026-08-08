# Referral Playbook — Meridian Research & Advisory

**Purpose:** Turn happy clients and partners into a predictable source of high-converting, low-cost pipeline. Referral leads convert 3–5x better than cold and typically enter mid-funnel (discovery-ready).

**Target:** ≥20% of closed-won deals carry a referral source within 12 months.

---

## 1. Ask Timing

Ask for referrals when the client is at their **peak satisfaction moment** — never at the start, never on autopilot.

| Moment | Why it's peak | Ask |
| --- | --- | --- |
| First deliverable review (they loved it) | Recency of proof | "Who else is wrestling with this?" |
| A check-in where they praised the work | Positive energy, logged in CRM | "We help teams like yours — who do you know that would value a scan?" |
| After a renew/expansion | Highest trust | Same ask + "happy to intro" |
| After a public win (case study, quote) | Identity/reciprocity | "Is it OK if we mention you as a reference?" |

**Anti-timing (do NOT ask):** right after a complaint, at the end of a tense negotiation, during a slipped deliverable, at invoice time, on the first call.

**Frequency rule:** one active ask per client per quarter max. Track the last ask date in CRM to avoid nagging.

**Ask script (brief, specific, low-friction):**

```
We work best with teams at your scale making AI decisions.
If you know one or two people facing what you were facing six
months ago, I'd love to send them a sample brief — no pitch.
Happy to give you a preview of anything you'd share.

```

**Make it easy:** offer to draft the intro email for them (they forward it), or send a one-click "share this sample brief" link. Reduce effort to one click.

---

## 2. Incentive Structure

| Referral type | Incentive |
| --- | --- |
| Client refers client | **10% of the first invoice** as credit on their account or a gift card of equivalent value |
| Client → credit | Automatically applied to next invoice (maximizes retention, no cash out) |
| Client → gift | Gift card (e.g., premium retailer) — use when client prefers cash-like |
| Partner referral | 10% of first invoice as cash commission, paid on client's first invoice settlement |
| Inbound referral (no code) | Attributed by source; no payout unless contact named the referrer |

**Rules:**
- Incentive is **10% of first invoice**, not recurring. It's a thank-you, not a bribe; keeps economics clean and avoids perverse incentives on renewals.
- Credit (not cash) is the default for clients. Cash is the default for partners (they're in a business relationship).
- Incentive triggered on **first invoice settled** (cash received), not on signature — prevents referral-for-signature gaming.
- No incentive for self-referrals, family, or same-company referrals.
- All incentives logged in CRM and settled monthly.

**Sample messaging for the incentive:**

```
When the engagement kicks off, we'll apply 10% of the first
invoice as credit to your account — our way of saying thanks for
trusting us with your network. No strings.

```

---

## 3. Tracking in CRM

Referral tracking lives in the CRM. Every deal carries a source.

**Required fields per deal:**
- `Source` = Referral (never overwrite with campaign/other)
- `Referrer` = contact record of the person who referred
- `Referral type` = Client / Partner / Inbound
- `Referral date` = when the referral was given
- `Referral status` = Open / Converted / Paid / Declined
- `Incentive due` = 10% calc, auto-computed from first invoice

**Process:**
1. Prospect contact created → link `Referred by` to referrer record.
2. Deal created → source `Referral` + referrer link (mandatory at stage `SQL`).
3. Deal closes won → first invoice issued → `Incentive due` computes.
4. Incentive settled → status `Paid`, date logged.
5. Referrer thanked (Section 5).

**Attribution rule:** when a deal has multiple possible sources (e.g., also touched by outbound), the rule is: **referral wins if the prospect was referred before first outbound touch, or if the referrer's intro is the documented first engagement.** Log the decision in the deal notes.

---

## 4. Referral-Source Attribution

- **Every inbound lead is asked (first reply, scripted):** "How did you hear about Meridian?" — logged, never assumed.
- **Every lead source field** is reviewed in the monthly win/loss review; referral-source quality is measured (conversion, deal size, cycle) against other channels.
- **Referrer dashboard:** monthly count of referrals given, converted, and incentive paid — reviewed with each referrer at their check-in (transparency builds trust).

**Measured per quarter:**
| Metric | Target |
| --- | --- |
| Referral leads (count) | Growing quarter over quarter |
| Referral → SQL conversion | ≥ 50% |
| Referral closed-won | ≥ 25% of referred |
| Referral deal size vs. average | ≥ avg deal |
| Incentive cost % of referred revenue | ≤ 1.5% |

---

## 5. Partner Referrals

Partners = complementary service providers who serve the same ICP (accounting, fractional execs, agencies, MSPs, advisory boutiques — and other AI-adjacent vendors we don't compete with).

| Partner type | Referral flow |
| --- | --- |
| Accounting / CFO services | Client needs market intel for a raise or an AI cost decision |
| Fractional execs | Their client needs strategy they can't provide |
| Agencies | Client needs evidence to back a martech/AI buying decision |
| MSPs / IT | Client asks "is this AI vendor real?" — competitive verification |

**Partner mechanics:**
- Written partner agreement (referral terms, commission 10% of first invoice, NDA, compliance: CAN-SPAM applies to any email partner sends).
- Partner gets a sample brief to share + a named contact + attribution tracking.
- Partner referrals enter the funnel as `Referral (Partner)` with the partner as referrer.
- Reciprocal: we refer clients to partners when it serves the client. Track reciprocity; unbalanced partnerships get reviewed quarterly.
- No exclusive deals without CEO sign-off.

**Partner ask script (for our CS/leadership):**

```
We see a lot of [partner's niche] conversations where the client
needs competitive or AI-market evidence. If you ever need that,
we're a clean add — and we'll gladly point clients your way when
they need your services. Standard terms: 10% of the first invoice.

```

---

## 6. Thank-You Process

Thank the referrer every time, promptly, whether or not the referral closes.

| Milestone | Thank-you |
| --- | --- |
| Referral received | Immediate 2-line note + "we've got them from here" |
| First call booked | Short update + link to sample brief they can forward |
| Deal won + invoice 1 settled | Incentive processed + personal thank-you (message + optionally a gift at higher tiers) |
| Referral lost | Honest note: "didn't work out this time — still grateful, and here's what happened" (protects the relationship) |

**Templates live in `/templates/referral-thank-you.md`. Keep them short, specific, human — no hype.**

**Rule:** incentives are given regardless of whether the referred deal is big or small — proportional generosity keeps the flow alive.

---

## 7. Program Hygiene & Review

- [ ] Every ask logged (date + client) in CRM.
- [ ] Every incentive paid on schedule (monthly settlement).
- [ ] No referral channel ever violates CAN-SPAM (opt-out + physical address in any client/partner email we send or template).
- [ ] Quarterly review: referral volume, conversion, incentive cost, partner health. Escalate declining quality.
- [ ] Referral ask embedded in renewal and expansion playbooks (natural overlap — happy clients are at peak at renewal).
