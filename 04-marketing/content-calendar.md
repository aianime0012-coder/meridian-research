# Content Calendar — Meridian Research & Advisory

> Version 1.0 · Owned by Astra (Marketing) · 90-day rolling calendar · Output mix below.

## 1. Output targets (per week)

| Asset | Freq | Channel | Owner |
|---|---|---|---|
| Blog / SEO post | 1–2/wk | Website | Astra + Sage (research) |
| LinkedIn insight post | 3–4/wk | LinkedIn | Astra |
| LinkedIn thread / data card | 1–2/wk | LinkedIn | Astra |
| X thread / research highlight | 3–5/wk | X | Astra |
| Newsletter "Meridian Weekly" | 1/wk | Email | Astra |
| Webinar | 1/mo | Zoom/YouTube | Astra + Sage + Vector |
| Lead magnet refresh | 1/quarter | Website | Astra |
| Long-form report / benchmark | 1/quarter | Website + PR | Sage + Astra |
| Short research explainer (video) | 2–4/mo | LinkedIn/YouTube | Astra |

**Mix by intent (90 days):** 40% TOFU (awareness/SEO), 35% MOFU (nurture/magnets),
25% BOFU (proof/offers).

## 2. 90-day rolling skeleton

Themes rotate to keep variety. Day 0 = start of cycle; every quarter re-plan.

| Week | Theme | Blog/SEO | LinkedIn | Magnet/CTA | Webinar slot |
|---|---|---|---|---|---|
| 1 | AI readiness | "AI Readiness Checklist for SaaS" | Scorecard launch posts | AI Readiness Scorecard | — |
| 2 | Build/buy/partner | "Build vs Buy vs Partner AI: 2026" | Thread: 5 build-buy signals | Vendor Evaluation Toolkit | — |
| 3 | Competitive intel | "Competitive Intelligence for SMBs" | Data card: CI gaps in SMBs | CI sample report | — |
| 4 | AI adoption | "AI Adoption Roadmap (12 weeks)" | Case snippet | AI Adoption Benchmark | Webinar #1: benchmark reveal |
| 5 | Budgeting | "AI Budget Benchmarks by Headcount" | Budget data thread | AI Budget Planner | — |
| 6 | Vendor landscape | "AI Vendor Landscape: 10 categories" | Vendor scorecard post | Vendor Toolkit | — |
| 7 | Industry snapshot | "AI in Manufacturing" (or priority vertical) | Industry one-pager | Industry AI Snapshot | — |
| 8 | ROI/evidence | "How Firms Measure AI ROI (data)" | ROI methodology post | ROI checklist | — |
| 9 | Market research | "Market Research for SaaS: 7 steps" | Research-method thread | Custom Research CTA | — |
| 10 | Newsletter deep-dive | repurpose top post | 2 repurposed cards | — | — |
| 11 | Case studies | "How a SaaS firm cut CI time 70%" | Case study teaser | Case study gated page | — |
| 12 | Quarterly report | AI Adoption Benchmark Q-release | Report PR posts | Benchmark + dataset | Webinar #2: Q&A reveal |

Rolling rule: each quarter begins with a new skeleton on this template; move
non-performing pieces, keep winners.

## 3. Production workflow

Every piece follows this pipeline (enforced in `07-automation/`):

```
1. RESEARCH   Sage → gather sources, extract 3+ evidence points, write summary
2. DRAFT      Astra → brief (see seo-strategy.md §4) → first draft (AI-assisted)
3. QA         Quality agent → check claims/sources/disclosure (12-quality/)
4. HUMAN REVIEW  Owner reviews before any externally-facing publish (required)
5. PUBLISH    Astra → schedule, URLs, schema, internal links, alt text
6. PROMOTE    Astra → social posts + newsletter blurb + outreach queue
7. MEASURE    Euclid → add to dashboard, feed 15-dashboards/
```

Time budget per blog post: research 3h · draft 2h · QA+review 1.5h · publish+promote 1.5h ≈ **8h/piece**. Webinar: ~20h/mo. Newsletter: ~4h/wk.

## 4. Roles

| Agent | Role in content |
|---|---|
| Sage (Research) | Evidence, datasets, benchmarks, source curation |
| Astra (Marketing) | Calendar owner, drafting, promotion, SEO |
| Quality agent | Claim/source/QA gate, compliance scan |
| Euclid (Ops/Analytics) | Metrics, dashboards, experiment log |
| Vector (Sales) | Case-study source, webinar co-host, BOFU feedback |
| Owner (human) | Final review/approval gate on all public content |

## 5. Repurposing matrix

| Source | → LinkedIn | → X | → Email | → Webinar | → Magnet |
|---|---|---|---|---|---|
| Blog post | 2 insight posts + 1 thread | 2–3 thread posts | newsletter section | topic seed | CTA embed |
| Benchmark/report | 3 data cards | 4-tweet thread | exclusive figure | featured reveal | full dataset gated |
| Case study | teaser + result post | quote + metric | segment | case spotlight | gated case one-pager |
| Webinar recording | clips (60–90s) | quotes + chart | replay email | — | webinar slides gated |
| Newsletter | 1 top insight | 1 stat | — | — | related magnet |

Rule: one core asset = ≥5 repurposed pieces. Track repurposing in calendar
("from: post#xxx") to avoid orphans.

## 6. Scheduling & tooling

- **Plan:** calendar in repo (`04-marketing/calendar/YYYY-QN.md`) + shared Google Calendar.
- **Schedule:** Buffer/Beehive (or native schedulers) for social; ESP for email; CMS for blog.
- **Time zones:** post LinkedIn 8–9a and 12–1p CT (Tue–Thu best); X 8–10a CT; newsletter Tue 7a CT.
- **Holiday/blackout:** Q4 planning, vacation weeks — pre-schedule 2 weeks of evergreen queue.
- **Batch day:** Mondays = production; Tuesdays = publish+promote; Fridays = metrics + next-week prep.

## 7. Editorial rules

- No piece ships without: one clear claim, ≥1 source link, one CTA, AI disclosure.
- Owned by one owner; every task has a due date in the calendar.
- "Meridian Weekly" gets first pick of the week's best insight.
- Publish-on-Thursday rule for SEO posts (rankings settle before weekend); LinkedIn best Tue–Thu.
- If a piece misses a date, demote to evergreen queue — never publish "rushed."

## 8. Review ritual (every 90 days)

1. Euclid pulls: sessions, rankings, signups, MQLs per theme.
2. Drop bottom 20% themes; double bottom 20% of the strongest.
3. Refresh top 3 blog posts with new YTD data (they still earn sessions).
4. Rebalance mix toward themes that produced MQLs, not just traffic.
5. Save learnings to `13-improvement/experiment-log.md`.

## Related

`seo-strategy.md` · `email-campaigns.md` · `newsletter.md` · `webinars.md` · `measurement.md`
