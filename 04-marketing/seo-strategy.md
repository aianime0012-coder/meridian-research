# SEO Strategy — Meridian Research & Advisory

> Version 1.0 · Owned by Astra (Marketing) · Goal: ≥5,000 organic sessions/mo by Y3, organic MQLs ≥12/mo.

## 1. Model: Pillar → Cluster → Magnet

Every topic is a **pillar page** (broad, authoritative, links to clusters) with
**cluster posts** (specific queries) linking back up. Gate the highest-intent
cluster posts with a lead magnet to convert search traffic into contacts.

```
PILLAR: "AI strategy for SMBs"
  ├─ Cluster: "AI adoption roadmap"          → magnet: AI Readiness Scorecard
  ├─ Cluster: "build vs buy vs partner AI"
  ├─ Cluster: "AI readiness assessment"
  └─ Cluster: "AI strategy framework"
PILLAR: "Competitive intelligence"
  ├─ Cluster: "competitive intelligence tools"
  ├─ Cluster: "competitive analysis for SaaS"
  └─ Cluster: "market intelligence reports"
```

### Pillar topics (Year 1, priority order)

| Pillar | Intent | Primary service | Target keyword |
|---|---|---|---|
| AI strategy for SMBs | Info→commercial | AI Strategy Sprint | "ai strategy consulting for smbs" |
| Competitive intelligence | Commercial | Intelligence Subscription | "competitive intelligence service" |
| Market research for SaaS | Commercial | Custom Research | "market research for saas" |
| AI adoption | Info→commercial | Fractional Advisory | "ai adoption roadmap" |
| Build vs buy vs partner | Commercial | AI Strategy Sprint | "build buy partner ai" |
| AI vendor evaluation | Commercial | Custom Research | "ai vendor evaluation" |
| AI ROI / AI readiness | Info | Readiness Sprint | "ai readiness assessment" |

## 2. Keyword workflow

1. **Seed list** — from pillars above + client intel in `06-research/`.
2. **Expand** — use Google Keyword Planner, Ahrefs/SEMrush (or free: Google Trends,
   AnswerThePublic, `related:` on Google).
3. **Classify** — table per keyword: query, intent (I/C/T), volume, difficulty,
   stage (top/MOFU/BOFU), mapped pillar, mapped magnet.
4. **Prioritize** — score = `0.4 × (1 − difficulty/100) + 0.4 × intent_fit + 0.2 × volume_band`.
   Book of 40 keywords minimum; 15 "hero" keywords targeted first.
5. **Record** — every target keyword lives in `04-marketing/keywords.md` with a
   content brief link. Refresh quarterly.

### Keyword table example

| Keyword | Intent | Vol/mo | Diff | Stage | Pillar | Magnet |
|---|---|---|---|---|---|---|
| ai strategy for small business | C | 900 | 30 | BOFU | AI strategy | Scorecard |
| competitive intelligence service | C | 500 | 45 | BOFU | CI | Vendor Toolkit |
| ai adoption in manufacturing | I | 800 | 25 | MOFU | AI adoption | Industry Snapshot |
| build vs buy ai | C | 1.2k | 40 | BOFU | Build/buy | Budget Planner |
| what is ai readiness assessment | I | 200 | 10 | TOFU | AI readiness | Scorecard |

## 3. Technical SEO

Checklist (run at launch + monthly audit):

- [ ] XML sitemap + HTML sitemap; submit in Search Console.
- [ ] robots.txt allowing `/blog/*`, `/research/*`, `/reports/*`; blocking admin.
- [ ] HTTPS enforced, `www` → apex redirect (301), one canonical per URL.
- [ ] Fast load: target LCP <2.5s, INP <200ms. Compress images (WebP), lazy-load.
- [ ] Mobile-first: no horizontal scroll, tap targets ≥48px.
- [ ] Schema: `Organization`, `ProfessionalService`, `Article`, `FAQPage`,
  `BreadcrumbList`, `Dataset` on benchmark pages.
- [ ] Every page: unique title (≤60 chars), meta description (≤155), one H1,
  logical H2/H3, descriptive image alt text.
- [ ] Internal links: every cluster post → pillar + 2–3 siblings; pillar → services + magnets.
- [ ] 404 page with search + top-pillar links; fix broken links quarterly (crawl with Screaming Frog or free tools).
- [ ] No orphan pages: every post in ≥1 internal link tree.

## 4. Content brief template (per piece)

```
TITLE:               [target keyword, promise]          # e.g., "AI Readiness Checklist for SaaS in 2026"
INTENT:              [I / C / T] · [what the reader wants]
PILLAR/CLUSTER:      [which pillar this clusters under]
SERP CHECK:          [top 3 current results + why they rank]
PRIMARY KW:          [exact phrase in H1 + first 100 words + title]
SECONDARY KWs:       [3–5 related, used naturally in H2s]
STRUCTURE:           [H2 skeleton 4–6 blocks]
EVIDENCE REQUIRED:   [≥3 source-linked claims, named + dated]
MAGNET CTA:          [which gated asset + placement]
AI DISCLOSURE:       [footer disclosure, human review line]
QA GATE:             [link 12-quality/ checklist]
```

Rule: **no post publishes without ≥3 linked, dated sources.** This is Meridian's
differentiator — Google rewards pages that cite primary data.

## 5. Backlink strategy via published research

Research is our link magnet (same model as "data journalism" SEO).

1. **Publish one open benchmark per quarter** — e.g., AI Adoption Benchmark,
   AI Budget Benchmarks. Make the raw dataset downloadable (`Dataset` schema,
   GitHub + Zenodo) so journalists/analysts cite us.
2. **Make it quotable** — each report ships with: executive summary page,
   per-chart "share this" cards, a one-page PDF, a press-ready quote.
3. **Outreach** (Astra, ~10 hrs/quarter, no purchased links):
   - Target: industry newsletters (e.g., SaaS/HR/Fintech digests), niche journalists
     covering AI, aggregator sites, complementary consultants.
   - Pitch = the finding, not the company: "Data: 62% of SMBs report no AI budget line (n=418)."
   - Ask for a link, offer an interview or chart embed.
4. **Digital PR** — submit to: Hacker News (Show/Ask or blog post), Reddit
   (r/SaaS, r/smallbusiness — follow subreddit rules), LinkedIn posts from the
   owner, HARO-style requests (free tiers exist).
5. **Guest contributions** — quarterly byline on a reputable industry blog (cite
   back to Meridian research). 2–3 per year is enough.
6. **Link profile hygiene** — disavow spam in Search Console quarterly; monitor
   with free `backlink checker` tools monthly.

Target: +3 to +8 quality backlinks/mo from research + outreach; domain rating
growth is a Y2 goal, not Y1.

## 6. Local / global targeting

- **Global by default** for English-language AI/SaaS content (the niche is global).
- **US weighting** in copy: US dollars, US legal framing (GDPR+CCPA disclosures).
- **Local/geo pages only if they earn it** — e.g., "AI market research UK/US/Canada"
  only after core content ranks and we have proof of regional demand.
- International SEO basics: hreflang only if we publish localized versions;
  otherwise single canonical English (US) page.

## 7. Measurement & cadence

| Metric | Target | Tool |
|---|---|---|
| Organic sessions/mo | ≥5,000 by Y3 (ramp: 300→1,200→2,500) | GA4 |
| Keyword ranking (top-10) | ≥25 hero keywords | GSC + tracker |
| Backlinks/mo | ≥3 quality | GSC + backlink checker |
| Organic→magnet conversion | ≥2% | GA4 + forms |
| Organic MQLs/mo | ≥12 | CRM |

Rituals:

- **Weekly:** GSC query report → harvest new long-tail keywords → feed calendar.
- **Monthly:** technical audit (checklist §3), top-page CTR check, rank tracker
  review, backlink report.
- **Quarterly:** full keyword refresh, pillar page updates (add YTD data),
  benchmark publication, competitor SEO teardown (compare against 3 rivals).

## 8. What NOT to do

- No AI-spun bulk content (Google flags it; brand is "human-reviewed").
- No exact-match anchor stuffing; write natural anchors ("our AI adoption data").
- No buying links or PBNs.
- No doorway pages per keyword; one strong page per query.

## Related

`content-calendar.md` · `measurement.md` · `lead-magnets.md` · `06-research/` · `11-knowledge/`
