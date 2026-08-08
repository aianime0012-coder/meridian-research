# Outreach Playbook — Meridian Research & Advisory

**Purpose:** Generate and qualify pipeline through cold + warm outreach (email + LinkedIn) that reflects the Meridian brand: clear, evidence-first, no hype.

**Compliance gate:** Every email must include a physical mailing address and an opt-out mechanism (CAN-SPAM). No guaranteed-ROI claims. All client-facing messages pass the QA gate before sending.

---

## 1. Outreach Stack & Source Rules

| Channel | Tool | Volume limit (safe) |
| --- | --- | --- |
| Cold email | Google Workspace + outreach tool | ≤ 40/day per mailbox; ramp 10→20→30→40 over week 1 |
| LinkedIn | LinkedIn Sales Navigator | ≤ 30 connection invites/day, ≤ 15 InMails/day |
| Warm email | same mailbox, no cold cap | — |
| Follow-ups | sequence tool | max 3 touchpoints per channel per target |

**Cold mailbox hygiene:** separate sending domain/subdomain, 1 sender, SPF/DKIM/DMARC verified, plain-text-heavy, no images/links in touch 1. Warm list volume does not count toward cold caps, but never mix cold and warm sends in the same batch window.

**Working list (ICP):** companies 10–500 employees; decision makers: CEO/Founder, COO, Head of Product/Strategy, sometimes CFO. Target titles: Founder, CEO, VP Strategy, Head of Marketing (for competitive intelligence), Head of Ops.

---

## 2. Multi-Touch Cadence

Default cadence is **11 touches over 16 business days** across email + LinkedIn. One human, one cadence, then a pause.

| Day | Channel | Touch | Content |
| --- | --- | --- | --- |
| 1 | Email | 1 | Cold intro (see framework below) |
| 3 | LinkedIn | 1 | Connection request (no note) or comment on recent post |
| 6 | Email | 2 | Value reframe + 1 evidence point |
| 9 | LinkedIn | 2 | InMail or follow-up to accepted invite |
| 12 | Email | 3 | Drop 1 insight from their industry |
| 16 | Email | 4 | Breakup / "closing the loop" email |

**Pause rule:** after the 11-touch cycle, no further outreach for 90 days unless the prospect replies or shows a fresh signal (job change, funding, product launch).

**Reply handling:** any reply (even "not interested") exits the cadence immediately and moves to `Reply` pipeline stage within 2 hours. Track in CRM with the exact sequence step where the reply came in — this feeds win/loss and A/B data.

---

## 3. Subject Lines (A/B tested)

Rule: **under 6 words, specific, no clickbait.** Promise the topic, not the outcome.

| Variant | Why it works |
| --- | --- |
| `Signal for [Company]` | Curiosity + personalization |
| `Competitive intel on [Competitor]` | Specific, their world |
| `[Company] AI strategy — 30 min` | Plain + low commitment |
| `Not a pitch: one data point for [Company]` | Reframes spam reflex |
| `Your Q3 AI decisions` | Time-boxed relevance |

Never use: "guaranteed", "amazing", "revolutionary", ALL CAPS, or ROI numbers (compliance + brand).

---

## 4. Message Frameworks

### 4.1 Cold email — structure (first-line personalization)

```
Subject: [specific, short]

First line: ONE verified signal about THEM (not flattery).
  Examples:
  - "Saw you expanded into the Midwest." (from LinkedIn/website)
  - "Noted you posted about vendor consolidation last week."
  - "Your team grew from 80 to 120 in 6 months."

Paragraph 2: state the gap or question in their domain, neutrally.
  "Teams at your size usually struggle to separate AI hype from
   what actually moves margin. We map that for you."

Paragraph 3: the ask + proof of method, NOT proof of result.
  "Happy to share one AI competitive scan for your market —
   no pitch, 20 minutes."

Sign-off: name, role, one link max (calendar), physical address,
opt-out line.
```

**First-line personalization rules:**
- Use only signals you can verify in the CRM or from primary sources (website, news, LinkedIn posts, funding announcements).
- One signal only. Two feels creepy.
- Never reference: personal life, appearance, family, race, politics.
- If no verified signal exists, do NOT send cold email — move to LinkedIn or abandon the record.

### 4.2 LinkedIn connection request

```
Hi [First], we both work around applied AI — I help teams at your
scale make defensible AI decisions. Would be good to connect.
```

InMail (after accept, if no email response):

```
Hi [First] — thanks for connecting. Quick question for you:
in the last 90 days, have you had a vendor claim AI capability
you couldn't independently verify? That's the gap we close.
Happy to share a real example from your industry if useful.
```

### 4.3 Follow-up frameworks

- **Touch 2 (value reframe):** change the angle, not the volume. E.g., pivot from "strategy" to "competitive risk."
- **Touch 3 (evidence drop):** attach one anonymized market insight or an excerpt of a published report relevant to their vertical. This is your proof of method.
- **Touch 4 (breakup):** explicit, low-pressure close:

```
I'll close the loop here — if AI strategy or competitive intel
comes up in the next quarter, this is a one-line ask. Wishing you
a strong Q[x]. (Opt-out anytime.)
```

---

## 5. CTAs (call to action)

| Stage | CTA | Button/link |
| --- | --- | --- |
| Touch 1 | "20-min fit call" | calendar link only |
| Touch 2 | "I'll send one competitive scan of [market] — reply YES" | reply trigger |
| Touch 3 | "Want the PDF of the [industry] brief?" | resource link |
| Touch 4 | "Keep me in the loop" | reply trigger |

**Rules:** one CTA per message. Calendar links only in touch 1. Never attach paid proposals or pricing decks in outreach — pricing belongs in the proposal stage.

---

## 6. Spam-Safety & Compliance

Checklist before EVERY send:
- [ ] Physical mailing address included (footer).
- [ ] Opt-out / unsubscribe mechanism present and working.
- [ ] No ROI guarantees, no "guaranteed" language, no result claims.
- [ ] Recipient is B2B contact at a company (CAN-SPAM context).
- [ ] Message has no misleading subject line.
- [ ] Sender identity and reply-to are real.
- [ ] Passed the QA gate (spell-check, tone = evidence-first).
- [ ] Volume within daily cap; list deduped in CRM.

**Bounce/report rules:** hard bounce → remove record + verify. Spam complaint → suppress immediately, flag sender, review template. Complaint rate >0.1% → pause list, rewrite.

---

## 7. A/B Testing

Test one variable at a time. Minimum cells: **50 opens (or 100 sends) per variant** before judging.

| Variable | Test | Measure |
| --- | --- | --- |
| Subject line | 2 variants | open rate |
| First line | signal style (data vs. post vs. growth) | reply rate |
| CTA | calendar vs. reply trigger | reply rate |
| Length | 3-sentence vs. 6-sentence | reply rate |
| Channel | email-first vs. LinkedIn-first | meeting booked |

**Cadence A/B:** compare 11-touch vs. 8-touch cycle on reply rate and meetings booked per 100 records. Review monthly in the win/loss review.

**Decision rule:** a variant wins at ≥15% relative improvement in the target metric; otherwise keep current champion. Log every test in the CRM `Outreach A/B` field.

---

## 8. Hand-off Rules

- Meeting booked → record moves to `SQL` with source, signal, sequence step, and last touch text in the activity log.
- Any reply → stage `Reply`; owner responds within 2 business hours.
- No response after full cycle → `Paused` with re-enable date; revisit at 90 days.
- Unsubscribe/opt-out → `Suppressed`; permanent, non-negotiable.

**Daily hygiene:** dedupe list, purge bounces, sync LinkedIn accepts, log all touches. Zero touches today = unapproved.
