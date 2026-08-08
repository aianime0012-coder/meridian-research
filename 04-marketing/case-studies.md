# Case Studies — Meridian Research & Advisory

> Version 1.0 · Owned by Astra (Marketing) with Vector (Sales) · Proof layer feeding sales + SEO.

## 1. When to create a case study

Create one when ALL hold:

- The engagement delivered a **measurable result** (e.g., time saved, decision
  made faster, budget approved, vendor choice validated).
- The client consents to publishing (see §2 anonymization rules).
- The result maps to a **target service and persona** (so it converts).
- You can publish **within 90 days** of the outcome (freshness matters).

Do NOT create for: finished engagements with no numbers, clients who won't
consent, or results that can't be described without revealing confidential data.

## 2. Anonymization rules (non-negotiable)

- **Identifiable case (named) requires written consent** from the client. Use the
  consent form in `10-legal/`; record it in the CRM; never publish without it.
- **Anonymous case** (default): no company name, no identifiable founder/exec
  name, no city/team-size combos that can be reverse-engineered. Use generic
  descriptors: "a 120-person SaaS company."
- Mask: revenue, headcount ranges (not exact), tooling stack if unusual,
  specific named vendors in sensitive contexts, dates beyond the quarter.
- Get consent for **each channel** published (website, LinkedIn, webinar deck).
- Every published case passes the QA gate (`12-quality/`) + owner review.

## 3. Structure (Challenge → Method → Evidence → Result → Quote)

```
TITLE:  [Result metric] + [client descriptor]     # "How a SaaS firm cut CI time 70%"
CHALLENGE (2–4 lines)  — the decision/problem before Meridian
METHOD (3–6 lines)     — what we did, methodology named, sources used
EVIDENCE (bullets)     — ≥2 source-linked facts behind the approach
RESULT (numbers first) — before/after, timebox, money where possible
QUOTE (1–2 lines)      — client voice (only with consent) + attribution level
CTA                    — "Want the same? Book a research brief."
DISCLOSURE             — footer: AI-assisted + human-reviewed
```

Rule: **every result is expressed with a method and a date.** "Cut CI time 70%
in 6 weeks, measured via time tracking" beats "huge efficiency gains."

## 4. Publishing channels

| Channel | Format | When |
|---|---|---|
| Website `/case-studies/` | Full page + PDF | Always (SEO + sales proof) |
| Service pages | 2-line quote + metric banner | Always |
| LinkedIn | 3-part teaser: hook → method → result | Launch + 1 follow-up |
| X | 1 stat + thread | Launch week |
| Newsletter | "Case of the month" section | Monthly rotation |
| Webinar | 5-min spotlight + deck slide | When relevant theme |
| Sales deck | Result slide per service (`03-sales/templates/`) | Always (Vector) |
| Email nurture | Case in step-3 email | In sequence |

Each case study = 1 URL + ≥5 repurposed pieces (track in `content-calendar.md` §5).

## 5. How case studies feed sales

- **Sales enablement:** every case tagged by service + industry + result-type in
  a case index (`03-sales/case-index.md`) so Vector picks the right proof per deal.
- **MQL acceleration:** nurture step-3 email includes a case (see §4); engaged
  readers score higher in lead scoring.
- **Objection handling:** 3 standard objections each map to a case:
  - "We can't afford it" → budget/ROI case.
  - "We already tried AI" → readiness/recovery case.
  - "Why not build in-house?" → build/buy case.
- **Demo-close assist:** webinar case spotlights tee up the consult agenda.

## 6. How case studies feed SEO

- Target keyword per case: `[service] + [industry] + [outcome]`, e.g.,
  "competitive intelligence for saas case study".
- Internal links: case page ↔ service page ↔ pillar post ↔ magnet.
- Add `Article`/`FAQPage` schema; include a "Results by the numbers" block (list
  items rank in featured snippets).
- Publish as **content pages, not PDFs** (PDF secondary). PDF only as a download.
- Update results annually if the client still consents (fresh content signal).

## 7. Production workflow

```
1  Vector  → flag engagement for case study (with consent check)
2  Astra   → draft using structure (§3), pull metrics from 05-delivery/
3  Client  → (if identifiable) review + sign consent form
4  QA      → sources, numbers, disclosure, anonymization check
5  Owner   → final approval
6  Astra   → publish + repurpose queue + SEO wiring
7  Euclid  → track metrics (§8)
```

Time budget: ~6h per case (draft 2h, consent+review 2h, publish+promote 2h).

## 8. Metrics

| Metric | Target |
|---|---|
| Case studies published | 1–2/quarter (ramp; quality over volume) |
| Case page → consult click | ≥3% |
| Case-in-nurture → MQL lift | ≥+15% vs no-case send |
| Case used in closed deals | ≥1 in 3 SQLs reference a case |
| Case page organic sessions | ≥200/mo per strong case |
| Backlinks earned per case | ≥1/mo (outreach to industry pubs) |

Monthly: review which cases were used by Vector and which influenced closed-won
deals; retire cases >18 months old with no update.

## 9. Case study index format

```
## [Result] — [Descriptor]
Service: [x] · Industry: [x] · Persona: [x]
Result: [metric + timeframe + method]
Consent level: named / anonymous · Consent date: [x]
URL: [link] · Repurposed: [posts/wk/email/webinar]
Used in: [deal ids]
```

## Related

`content-calendar.md` · `webinars.md` · `email-campaigns.md` · `measurement.md` · `03-sales/` · `10-legal/` · `12-quality/`
