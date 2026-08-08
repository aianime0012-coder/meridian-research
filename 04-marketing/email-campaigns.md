# Email Campaigns — Meridian Research & Advisory

> Version 1.0 · Owned by Astra (Marketing) · Goal: MQL→SQL ≥30%, open ≥45%, list growth ≥20%/mo.

## 1. Lifecycle map

```
Visitor → [WELCOME] → [NURTURE] → [MAGNET FOLLOW-UP] → [SALES HANDOFF] → client
  │                                                          │
  └────────────────── [RE-ENGAGEMENT] ←──────────────────────┘
```

| Stage | Trigger | List | Primary goal |
|---|---|---|---|
| Welcome | Signup (any form) | New subscribers | Confirm + deliver magnet + set expectations |
| Magnet follow-up | Magnet download | Segment by magnet | Educate → next magnet/CTA |
| Nurture | 7+ days post-signup, engaged | Engaged | Position authority → demo/consult |
| Sales handoff | MQL → SQL | Hot | Schedule intro call (Vector) |
| Re-engagement | 60–90 days inactive | Dormant | Win back or suppress |

## 2. Drip sequences

### A. Welcome sequence (5 emails, ~8 days)

| # | Day | Subject style | Content | CTA |
|---|---|---|---|---|
| 1 | 0 | Deliver + confirm | Immediate delivery of magnet; value recap; reply expectations | Download/read |
| 2 | 1 | Educate | One insight from the magnet + 1 source | Read related post |
| 3 | 3 | Social proof | One client result (anonymized) + methodology note | Book consult |
| 4 | 5 | Authority | Sample of "Meridian Weekly" content (see `newsletter.md`) | Subscribe |
| 5 | 8 | Offer | "Next step" — free 30-min research brief | Book call |

### B. Magnet follow-up (3 emails, days 1/3/6 after download)

Tailored per magnet (`lead-magnets.md` §sequence):

| Magnet | Email 1 | Email 2 | Email 3 |
|---|---|---|---|
| Readiness Scorecard | "Your score explained" | "Where peers score" | "Run the paid readiness sprint" |
| Industry Snapshot | "3 charts from your industry" | "Compare vs your segment" | "Get a tailored snapshot" |
| AI Adoption Benchmark | "5 findings with sources" | "How to use the dataset" | "Custom benchmark for your firm" |
| Budget Planner | "Budget template walkthrough" | "Benchmarks by headcount" | "Budget planning session" |
| Vendor Toolkit | "Scoring criteria explained" | "Top-3 vendor shortlist tips" | "Vendor evaluation sprint" |

### C. Nurture (weekly, merges into newsletter)

- Every subscriber gets "Meridian Weekly" (`newsletter.md`) as the nurture vehicle.
- Add a monthly "case + offer" email to engaged non-MQLs only.

### D. Sales handoff (MQL→SQL)

1. **Alert:** Vector gets a CRM notification with score, source, and intent data within 5 min.
2. **Intro email** (1): confirm the consult, set agenda, attach relevant magnet.
3. **Reminder** (2): day before the call + calendar block.
4. **No-show** (3): reschedule link + "we'll send a recording" offer.
5. **Post-call** (4): recap + next-step proposal within 24h.

### E. Re-engagement (60 days inactive)

1. "Did we lose you?" — 1 email with best content + one-click re-opt-in.
2. If no click: **suppress** at 75 days (GDPR hygiene, protects deliverability).
3. If engaged: move back to nurture with a fresh magnet offer.

## 3. Subject line rules

- Under 50 characters; first word carries the value: "Your score:", "Benchmark inside:", "5 sources:".
- No ALL CAPS, no "Free!!", no emojis in subject line (>1 flag spam filters).
- Personalize with magnet name or industry: "Your [Industry] AI snapshot".
- A/B test: one variable at a time (subject OR CTA, never both).
- Open-rate floor: test new subject style if open <45% for 3 straight sends.

## 4. Personalization

- **Allowed:** first name, company, industry, magnet downloaded, page visited, content topics clicked.
- **Not allowed:** anything from a purchased list, inferred sensitive data, cross-tool leakage without consent.
- Practical personalization: dynamic subject `[First name]`, body swap per industry segment, dynamic CTA per magnet.
- Keep 2/3 of copy static (brand voice) and 1/3 dynamic (relevance).

## 5. Compliance (CAN-SPAM + GDPR/CCPA)

- [ ] Double opt-in on all forms (GDPR-lean); record consent timestamp + source in CRM.
- [ ] Unsubscribe link in every email (plain-text fallback), honored within 10 business days (CAN-SPAM).
- [ ] Physical postal address in footer (CAN-SPAM requirement for US).
- [ ] Privacy policy linked on every form; CCPA "Do Not Sell" honored + visible.
- [ ] No purchased/scraped lists. Ever. Period.
- [ ] Preference center: choose topics/cadence.
- [ ] Data subject request (DSAR) handling in `10-legal/`; respond ≤30 days.
- [ ] AI disclosure line in every email footer.

## 6. Deliverability practices

1. **Warm-up:** new domain/IP: send to ≤50 engaged contacts first, ramp 20%/day over 2–3 weeks.
2. **Authentication:** SPF, DKIM, DMARC (p=quarantine), BIMI (if brand mark ready).
3. **List hygiene:** hard bounces removed ≤7 days; suppress >1 complaint; purge inactive at 75 days.
4. **Engagement-first sending:** only send to people who opted in; re-opt-in flow for older lists.
5. **One click per email** — avoid "spammy" verbs ("guarantee", "win", "act now", "$").
6. **Text-to-image ratio** ≥60:40; no image-only emails.
7. **Test across clients:** send 200-sample to Gmail/Outlook before full send.
8. **Monitor:** spam rate <0.1%, bounce <2%, unsub <0.5% per send; alert Euclid if breached.

## 7. KPIs & measurement

| Metric | Target | Where |
|---|---|---|
| List growth/mo | ≥20% | ESP |
| Open rate | ≥45% | ESP |
| Click rate | ≥3% | ESP |
| Click-to-open | ≥15% | ESP |
| Magnet→MQL | ≥25% | CRM |
| MQL→SQL | ≥30% | CRM |
| Unsubscribe rate | <0.5% | ESP |

Weekly: open/click/forward by sequence; monthly: MQL contribution by sequence,
list growth vs target, spam-rate check.

## 8. Rules of engagement

- Max 2 marketing emails/week per subscriber (newsletter + 1 offer).
- Never email on same magnet twice within 14 days without new content.
- Always include a human reply-to; replies answered within 24h.
- Every email has exactly one primary CTA.

## Related

`lead-magnets.md` · `newsletter.md` · `measurement.md` · `02-leadgen/` · `10-legal/`
