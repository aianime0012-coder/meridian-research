# Lead Magnets — Meridian Research & Advisory

> Version 1.0 · Owned by Astra (Marketing) · Gate assets convert SEO/newsletter traffic into MQLs.

## 1. Magnet library overview

| Magnet | Format | Gate | Primary intent | Fits service |
|---|---|---|---|---|
| AI Readiness Scorecard | Interactive quiz + PDF report | Email (double opt-in) | TOFU/MOFU | AI Strategy & Readiness Sprint |
| Industry AI Snapshot | 8–12 page PDF per vertical | Email | MOFU | Custom Research / Subscription |
| AI Adoption Benchmark | Open dataset + summary PDF | Ungated dataset + gated deep-dive | TOFU (SEO/backlinks) | Subscription / Data Products |
| AI Budget Planner | Spreadsheet + guide PDF | Email | MOFU/BOFU | AI Strategy Sprint / Advisory |
| Vendor Evaluation Toolkit | Scorecard template + rubric | Email | BOFU | Custom Research / Advisory |

**Rule:** the same form data feeds the CRM; every download is a tracked contact
with source, magnet, and timestamp (see `email-campaigns.md` §5 compliance).

## 2. Per-magnet spec

### 2.1 AI Readiness Scorecard
- **Hook:** "How ready is your company for AI? Score it in 10 minutes."
- **Format:** 12-question quiz (ops, data, skills, governance, budget) → instant score 0–100 + 5-page personalized PDF with category breakdown and next steps.
- **Gating:** email after quiz completion (interstitial). Offer score explanation page to non-gaters.
- **Follow-up (days 1/3/6):** explain score → peer comparison → offer paid readiness sprint (`email-campaigns.md` §2B).
- **KPI:** downloads ≥150/mo · form→MQL ≥25% · leads with score ≥60 = priority.
- **Refresh:** questions annually; benchmark bands updated quarterly with new data.

### 2.2 Industry AI Snapshot (per vertical)
- **Hook:** "AI in [Industry]: adoption, budgets, and what's actually working — 2026 snapshot."
- **Format:** 8–12 page PDF: 10 data points (adoption, budget, tools, barriers), 3 charts, vendor notes, 3 recommendations.
- **Gating:** email; industry selected on form (powers segmentation + personalization).
- **Follow-up:** 3 charts → compare vs segment → tailored snapshot offer.
- **KPI:** ≥30 downloads/mo/vertical · ≥30% engage with follow-up email 2.
- **Cadence:** refresh quarterly; publish 1 vertical per quarter (rotating per `content-calendar.md`).

### 2.3 AI Adoption Benchmark
- **Hook:** "Open dataset: how 400+ SMBs are adopting AI (methodology included)."
- **Format:** CSV/Parquet on GitHub + Zenodo (DOI) with methodology note; **gated** 20-page deep-dive PDF + chart pack for marketers.
- **Gating:** dataset ungated (SEO + backlinks); deep-dive PDF gated.
- **Follow-up:** 5 findings with sources → how to use dataset → custom benchmark offer.
- **KPI:** dataset downloads (backlink asset) ≥50/mo · deep-dive gated ≥80/mo · referring domains ≥3/mo.
- **Refresh:** quarterly; publish the press-release version to earn links (see `seo-strategy.md` §5).

### 2.4 AI Budget Planner
- **Hook:** "Plan next year's AI budget in 30 minutes — template + benchmarks included."
- **Format:** Google Sheets/Excel: cost lines (tools, models, data, people, risk), benchmark bands by headcount, build/buy/partner calculators; plus 10-page guide.
- **Gating:** email.
- **Follow-up:** template walkthrough → benchmarks by headcount → budget-planning session offer.
- **KPI:** ≥40 downloads/mo · spreadsheet reuse (returns visits) ≥10% · consult bookings ≥8/mo.
- **Refresh:** benchmarks yearly; template when pricing data shifts (quarterly check).

### 2.5 Vendor Evaluation Toolkit
- **Hook:** "Score any AI vendor in 90 minutes — criteria, weights, and scoring template."
- **Format:** Excel/Sheets scorecard: 20 criteria across 5 categories (capability, cost, data, integration, risk), weighted-scoring rubric, vendor comparison sheet, 8-page guide.
- **Gating:** email.
- **Follow-up:** scoring criteria explained → shortlist tips → vendor evaluation sprint offer.
- **KPI:** ≥30 downloads/mo · →MQL ≥30% (highest commercial intent magnet) · SQL bookings ≥6/mo.
- **Refresh:** criteria yearly + when market shifts.

## 3. Gating rules

- Email-only gate (never require phone); double opt-in with consent checkbox.
- Pre-show what you get (2–3 sample pages/thumbnail) to lift conversion.
- Offer "no email? get the summary" alternative — protects SEO equity.
- Forms: max 3 fields (email, company, industry). Ask more only at later stages.
- Every gated page has: value promise, format, time-to-read, privacy link, AI-disclosure line.

## 4. Landing page template

```
H1:  Hook with outcome + timeframe
Sub: What's inside (bullets, 4–6 items)
Body: Sample preview / 3 reasons
Form: Email + optional company/industry + consent box
Proof: Signup count + logo/source line
CTA:  "Get [asset]" (single primary button)
Trust: Privacy link · AI-assisted + human-reviewed disclosure
```

## 5. Placement (where magnets live)

- Blog cluster posts: inline CTA after 2nd block + end-of-post card.
- Newsletter: 1 featured magnet per issue (`newsletter.md` §template).
- Webinar: mid-roll and post-event follow-up (`webinars.md`).
- LinkedIn/X: pinned comment + CTA in caption, not in every post.
- Homepage/service pages: contextual banner per service.

## 6. Measurement

| Metric | Target |
|---|---|
| Downloads/mo (all magnets) | ≥350 |
| Form conversion (landing page) | ≥15% |
| Magnet→MQL | ≥25% |
| Magnet→newsletter cross-convert | ≥30% |
| Downloads by source | SEO ≥40%, social ≥20%, email ≥25%, other 15% |

Monthly review: kill/rework any magnet under 15 downloads/mo or form conversion
<8% for two consecutive months. Feed learnings to `13-improvement/experiment-log.md`.

## 7. Refresh cadence

| Magnet | Data refresh | Full redesign |
|---|---|---|
| Scorecard | Quarterly (bands) | Yearly |
| Industry Snapshot | Quarterly | Yearly |
| Adoption Benchmark | Quarterly | Yearly |
| Budget Planner | Yearly + pricing checks | Yearly |
| Vendor Toolkit | Yearly | Yearly |

## Related

`seo-strategy.md` · `content-calendar.md` · `email-campaigns.md` · `newsletter.md` · `measurement.md` · `02-leadgen/`
