# Report Types & Specs

> Version 1.0 · Owned by Sage (Research) · Canonical specs for every research deliverable. Each spec defines audience, cadence, structure, data inputs, QA requirements, distribution, and CTA. Outline templates are intentionally fillable by agents.

## Report quick reference

| Report | Cadence | Audience | QA gate | Primary CTA |
|---|---|---|---|---|
| Weekly Signals Brief | Weekly (Mon) | Internal: COO/CEO | Internal only | Decide actions |
| Client Intelligence Brief | Per subscription | Client | Client-grade (strict) | Book review call |
| Vertical Snapshot | Quarterly | Public (lead magnet) | Public-grade | Download / subscribe |
| Deep-Dive Research Report | Per engagement | Client | Client-grade (strict) | Launch project |
| Internal Tool Radar | Monthly | Engineering/Automation | Internal only | Adopt/pilot tools |
| Competitive Watch | Monthly | Internal + Sales | Internal only | Win/sales plays |
| Policy Watch | Monthly | Internal + Compliance | Internal only | Compliance response |

---

## 1. Weekly Signals Brief

- **Audience:** COO, CEO (internal). Purpose: weekly intelligence pulse.
- **Cadence:** Monday 09:00; freeze data Sunday 22:00.
- **Data inputs:** all `verified` signals (≥ 0.5) from the week; per-domain counts; top 10 by impact score (confidence × relevance).
- **QA requirements:** internal gate only — every signal has evidence_url + date; no hallucinated synthesis; sources readable on click.
- **Distribution:** Notion/SharePoint page + Slack `#weekly-brief`; summary DM to COO.
- **CTA:** each section ends with `Action recommended:` lines routed via recommendation-loop.md.

**Outline template:**
```
1. TL;DR — 5 bullets, biggest shifts this week
2. Domain scoreboard — table: domain | signals | verified | top subject
3. Top 10 signals — each: type, subject, evidence_url, date, confidence, action_recommended
4. What we must do this week — 3–5 actions w/ owners + due dates
5. Watch list — trends not yet verified, recheck next week
6. Source health — failures, gaps, swaps
```

## 2. Client Intelligence Brief

- **Audience:** subscribed client (procured intelligence product).
- **Cadence:** per subscription (typically weekly or monthly; fixed slot per client).
- **Data inputs:** verified signals filtered to client's vertical, competitors, and priority themes; client-relevant evidence ≤ 90 days old (freshness KPI).
- **QA requirements (client-grade, strict):** every claim ≥ 0.7 confidence; every claim source-linked with date; Quality agent sign-off before send; no speculative language; "source-linked, evidence-first" watermark.
- **Distribution:** branded PDF + email; stored in client workspace; sent by Client Success.
- **CTA:** 2 meetings booked from each brief (goal); "Discuss this brief" link; upsell hook to Deep-Dive.

**Outline template:**
```
1. Executive summary — what changed for YOU this period (3 bullets)
2. Market & competitive movements relevant to your vertical
3. Funding & M&A activity in your space
4. Policy/regulatory items that may affect you
5. Signals for your competitors (evidence-linked)
6. Opportunities we recommend you evaluate (build/buy/partner)
7. Sources & methodology note (confidence scoring summary)
8. CTA: book a 30-min review / request a deep-dive
```

## 3. Vertical Snapshot

- **Audience:** public prospects/leads (lead magnet, gated download).
- **Cadence:** quarterly per chosen vertical (fintech, health, industrials, retail, etc.).
- **Data inputs:** verified vertical_shift + funding + market signals for the vertical; 1 high-confidence claim per slide minimum.
- **QA requirements (public-grade):** ≥ 0.8 confidence on all published claims; legal/compliance review for forward-looking statements; no competitor mudslinging.
- **Distribution:** landing page + email nurture; promoted via LinkedIn/Marketing; CTA to subscribe to Client Intelligence Brief.
- **CTA:** download → subscribe → free intelligence session → qualify for paid brief/deep-dive.

**Outline template:**
```
1. The state of {vertical} in {quarter}
2. Where AI is landing first (adoption heatmap)
3. Funding & deal activity map
4. Competitive landscape at a glance
5. Policy tailwinds/headwinds
6. 3 questions your org should be asking
7. Methodology + sources appendix
8. CTA: get your custom intelligence brief
```

## 4. Deep-Dive Research Report

- **Audience:** paying client; scope defined per engagement.
- **Cadence:** per engagement (multi-week; milestone gates).
- **Data inputs:** client brief + custom monitoring (their competitors, suppliers, regulators); enriched from knowledge base (reuse ≥ 1 prior piece — flywheel KPI); expert interviews if budgeted.
- **QA requirements (client-grade, strict):** dual QA — Sage + independent Quality agent; every claim cited (URL + date); confidence listed per major claim; accuracy target ≥ 95%; change log kept.
- **Distribution:** full PDF + slide deck + working session; delivered by Research lead with Client Success.
- **CTA:** next engagement (implementation, tool radar for client, or standing brief subscription).

**Outline template:**
```
1. Brief & objectives (restated, scoped)
2. Methodology (sources, dates, confidence approach, limitations)
3. Findings — organized by client questions
4. Competitive deep dive (positions, pricing, moves)
5. Market sizing & trajectory
6. Technology & tooling landscape
7. Recommendations: options matrix (build/buy/partner), go/no-go
8. Appendix: evidence index (every claim → URL + date)
9. CTA: implementation workshop / standing engagement
```

## 5. Internal Tool Radar

- **Audience:** Engineering, Automation, COO (internal).
- **Cadence:** monthly (1st Tuesday).
- **Data inputs:** os_project + automation_release + api_deprecation + tool_opportunity signals; engineering fit scores.
- **QA requirements:** internal gate; security check on any OSS before adoption (license + vulnerability scan); no production impact claims unverified.
- **Distribution:** Slack `#engineering` + Automation kanban; owner assignments.
- **CTA:** each tool gets a verdict — **Adopt / Pilot / Watch / Decline** with owner + deadline.

**Outline template:**
```
1. Verdicts summary — table: tool | category | verdict | owner | due
2. New releases & upgrades worth attention
3. Deprecations & migration deadlines (risk list)
4. Security/advisory watch (CVE signals)
5. Efficiency opportunities (time saved estimate)
6. CTA: adopt/pilot decisions with owners
```

## 6. Competitive Watch

- **Audience:** Internal + Sales (enabled for calls).
- **Cadence:** monthly (1st Thursday).
- **Data inputs:** competitor_launch, competitor_pricing, competitor_positioning, competitor_funding signals; pricing-page snapshots (P3).
- **QA requirements:** internal gate; pricing claims must have archived screenshot evidence; neutral tone (no defamation).
- **Distribution:** Sales enablement doc + battle card snippets; Slack `#sales`.
- **CTA:** sales plays — objection handling, win themes, pricing counter-moves.

**Outline template:**
```
1. Who moved — competitor | change | evidence | impact
2. Pricing & packaging tracker (with snapshot dates)
3. Positioning & messaging shifts
4. Funding/runway implications
5. Win themes & objection counter-scripts
6. Actions: sales plays assigned to Sales + COO
```

## 7. Policy Watch

- **Audience:** Internal + Compliance (and clients at subscription).
- **Cadence:** monthly (1st Friday).
- **Data inputs:** regulation_issued, policy_draft, procurement_rule signals; regulator portals; effective-date tracker.
- **QA requirements:** internal gate + Compliance sign-off; legal review for client-facing interpretation.
- **Distribution:** Compliance channel + regulatory calendar; client add-on option.
- **CTA:** compliance action items with owners; client advisory call when directly affected.

**Outline template:**
```
1. Effective/upcoming — instrument | jurisdiction | date | our exposure
2. Drafts & consultations with deadlines (opportunity to comment)
3. Procurement & tender implications
4. Impact assessment per domain (AI, data, verticals we serve)
5. Client advisory list (who to notify, why)
6. Actions: Compliance + COO sign-off on response plan
```

---

## QA gates summary

| Gate | Applies to | Checks |
|---|---|---|
| Internal | Weekly Brief, Tool Radar, Competitive Watch, Policy Watch | evidence_url + date, confidence ≥ 0.5, no hallucination |
| Client-grade (strict) | Client Intelligence Brief, Deep-Dive | confidence ≥ 0.7, dual QA, source index, freshness ≤ 90d, accuracy ≥ 95% |
| Public-grade | Vertical Snapshot | confidence ≥ 0.8, legal review, no forward-looking risk |

## Related

`signal-catalog.md` · `monitoring-sources.md` · `recommendation-loop.md` · `04-marketing/` · `05-sales/` · `15-compliance/` · `12-quality/`
