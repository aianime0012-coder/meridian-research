# Lead Sources Playbook — Meridian Research & Advisory

**Purpose:** Catalog every lead source feeding the Meridian OS lead-gen pipeline, with the data each source yields, the exact pull mechanism (API vs. assisted browser automation), cadence, and the field mapping into the normalized CRM record.
**Owner:** Lead Gen Dept. **Pipeline position:** SOURCES → RESEARCH (enrichment) → SCORING → CRM RECORD → OUTREACH.

---

## 0. Source governance rules

- **ToS compliance is non-negotiable.** No scraping of LinkedIn, Google Maps, or any site whose ToS prohibits automated harvesting. Where an official API or a licensed partner exists, use it. Otherwise use manual-assisted browser automation (half-automated, human-reviewed) with volume limits.
- **Privacy/GDPR:** Only collect data a prospect has published in a business context or legally made available. No inference of personal/sensitive attributes. Log data provenance (source + date) per field.
- **Every record carries `source_id`, `source_type`, `collected_at`** so downstream scoring and compliance audits can trace origin.
- **De-dup key:** `company_domain` + `contact_email` are canonical. Merge before scoring; never double-outreach.
- **Pull-and-hold:** Sources are refreshed on cadence into a staging lake; only records that pass the ICP filter and scoring gates enter the active CRM.

---

## 1. LinkedIn Sales Navigator (official — primary channel)

- **What you get:** Company name, industry, size, HQ, headcount, hiring trends, company page followers; decision-maker profiles (title, seniority, function, tenure), "Accounts" and "Leads" list views, saved-search alerts, intent signals (job changes, content engagement).
- **How to pull it (compliant):** Use the **Sales Navigator REST API** (partner/official access) or its **CSV export** for saved leads/accounts lists. Never automate a headless browser against the site — that violates LinkedIn terms and risks account bans. For teams without API access, a human-in-the-loop workflow: analyst runs saved searches, exports CSVs, reviews.
- **Cadence:** Saved-search alerts pushed daily; full account/lead list export weekly.
- **Field mapping:**
  - `company_name`, `company_domain`, `industry`, `company_size_band`, `headquarters`, `headcount`, `linkedin_company_url` → **firmographics**
  - `contact_name`, `contact_title`, `contact_level`, `contact_function`, `contact_url`, `contact_email` (if present) → **decision_maker**
  - `recent_hiring`, `company_post_engagement` → **intent_flags**
  - `saved_search_id`, `list_name` → **campaign_tags**

---

## 2. Crunchbase

- **What you get:** Funding rounds (amount, date, investors, series), valuation, total funding, revenue/financial estimates, employee counts, leadership roster, acquisition activity, news mentions, industry tags, growth signals.
- **How to pull it:** Official **Crunchbase API v4** (OAuth, paginated). Fallback: licensed CSV exports; never scrape the web UI.
- **Cadence:** Daily incremental API pull keyed on `updated_at`; full refresh monthly.
- **Field mapping:**
  - `total_funding_usd`, `last_funding_date`, `last_funding_type`, `valuation_usd` → **financials**
  - `investors`, `lead_investor` → **relationships** (also a warm-intro lead signal)
  - `revenue_estimate`, `growth_rate_estimate` → **budget_band**
  - `num_employees` → cross-check vs. `company_size_band`

---

## 3. Google Maps / Google Business Profile

- **What you get:** Local/mid-market businesses not prominent on LinkedIn: name, address, phone, category, hours, website, review count/rating, photos, place ID.
- **How to pull it (compliant):** Official **Google Places API** (paid, ToS-compliant) with place-type + radius queries for industries like industrials, professional services, fintech. The Maps scraping tools route may breach Google ToS — do not use headless scrapers; use Places API or a licensed partner. Where API is unavailable, run assisted manual searches in the Maps UI.
- **Cadence:** Monthly; refresh if a region/vertical campaign is active.
- **Field mapping:**
  - `place_id` → `source_id`
  - `name`, `formatted_address`, `phone`, `website`, `business_type`, `rating`, `review_count` → **firmographics + local/regional tag**
  - `website` → triggers website crawl (Section 8)

---

## 4. Clutch

- **What you get:** Service-provider directory (agencies, consultancies, dev shops): services offered, industries served, client size, project budgets, reviews, verified contact data, badges.
- **How to pull it:** No public API — use licensed data export or an approved partner API. Otherwise manual-assisted collection (browse category filters, copy records) for targets ≤ 50/day. Do not scrape.
- **Cadence:** Monthly batch for services/industries matching our ICP (AI/tech agencies, marketing services, IT services).
- **Field mapping:**
  - `provider_name`, `website`, `location`, `employees_band` → **firmographics**
  - `services`, `industries`, `min_budget`, `avg_project_size` → **fit_score + budget_band** (they already buy external services)
  - `contact_person` (if published) → **decision_maker**

---

## 5. Upwork

- **What you get:** Companies actively posting jobs/contracts — direct demand signal: post title, description, budget, duration, skills requested, hiring company (when public).
- **How to pull it:** Official **Upwork Public API** (GraphQL, requires partner approval) or manual-assisted review of public job posts for contract postings matching AI strategy/consulting keywords. No scraping.
- **Cadence:** Daily keyword searches; alert on new posts.
- **Field mapping:**
  - `job_title`, `description_text`, `skills`, `budget`, `duration` → **pain_signal** (they need help now)
  - `client_company` (when disclosed) → `company_name` for enrichment
  - `post_url` → `evidence_url`, `collected_at` → `evidence_date`

---

## 6. Wellfound (formerly AngelList Talent)

- **What you get:** Startups: mission, stage, funding, headcount, open roles, tech stack, founder/exec team, culture info.
- **How to pull it:** Manual-assisted browsing (no public API) — export is not offered; capture structured fields by hand/with a half-automated form filler for qualifying startups only. Volume cap ~30/day to stay safe.
- **Cadence:** Weekly.
- **Field mapping:**
  - `startup_name`, `website`, `stage`, `location` → **firmographics**
  - `open_roles`, `tech_stack` → **tech_signal + pain_signal**
  - `founder_name`, `ceo_name` → **decision_maker**
  - `total_raised`, `recent_raise` → **financials**

---

## 7. Startup directories (YC, Product Hunt, AngelList)

- **What you get:** YC companies (batch, sector, growth); Product Hunt launches (recent product momentum, maker, upvotes, reviews); AngelList startup profiles (aggregated).
- **How to pull it:**
  - **YC:** Public directory pages; manual-assisted pull for companies in our ICP sectors; no public API. Capture company name, website, YC batch.
  - **Product Hunt:** Official **Product Hunt GraphQL API** (OAuth) for posts/makers; recent-launch flags are a strong engagement signal.
  - **AngelList:** see Wellfound above.
- **Cadence:** YC — monthly after each batch release; Product Hunt — daily (new launches).
- **Field mapping:**
  - `yc_batch`, `sector` → `campaign_tags`
  - `ph_launch_date`, `ph_upvotes`, `maker_name` → `intent_flags` (momentum) + `decision_maker`
  - `website` → triggers enrichment crawl

---

## 8. Company websites

- **What you get:** About, solutions/pricing pages, leadership team, blog, case studies, careers page, contact/legal pages, CMS/CMS provider, tech hints, localization.
- **How to pull it:** Use a licensed website-crawl tool or our own respectful crawler: **robots.txt-aware**, rate-limited (≤1 req/sec), user-agent identified, no PII harvesting, no bypassing auth. Parse with Playwright + a boilerplate extractor. Store only business pages. This is *your own site collection*, not a third party — still keep GDPR hygiene (no scraping of individual personal data).
- **Cadence:** On first capture of a new source record; re-crawl quarterly or when an outreach fails on stale data.
- **Field mapping:**
  - `cms`, `stack_hints` (in `<script>`, generators) → **tech_signal**
  - `team_names`, `leadership_titles` → **decision_maker candidates**
  - `pricing_text`, `solution_text`, `industries_served` → **product_profile + pain_signal evidence**
  - `blog_topics`, `recent_posts` → **content signals** (may feed outreach personalization)

---

## 9. Job postings (LinkedIn Jobs, Indeed, remote job boards)

- **What you get:** Hiring demand: open roles, keywords, seniority, department, salary bands (Indeed), remote eligibility — direct signals that a company is investing in an area (e.g., hiring an AI/Automation Manager = they're building AI capability we can advise on).
- **How to pull it:** Official **LinkedIn Jobs API** (partner access only) or manual-assisted Saved Searches with email alerts. Indeed offers no safe API — use manual-assisted keyword alerts or licensed aggregators. Remote boards (Remote OK, We Work Remotely) — RSS feeds where offered.
- **Cadence:** Daily digest of new matching postings.
- **Field mapping:**
  - `job_title`, `department`, `seniority`, `keywords`, `salary_band` → **hiring_signal** + `pain_signal`
  - `posting_company`, `posting_url`, `posted_at` → **evidence**
  - Match rules: "AI", "Machine Learning", "Automation", "Data Platform", "Competitive Intelligence" → **ai_signal = high**

---

## 10. Technology-adoption signals (BuiltWith, job posts, tool mentions)

- **What you get:** Installed tech (BuiltWith technology profile), marketing stacks, integration patterns, e-commerce/customer-facing tooling, and inferred sophistication level.
- **How to pull it:** **BuiltWith API** (paid, compliant) for domain lookups; cross-check job posts (Section 9) and support/docs pages for tool mentions; review public engineering blogs.
- **Cadence:** On-demand at research time (per company); not a mass feed.
- **Field mapping:**
  - `technologies`, `cms`, `analytics`, `marketing_automation`, `crm` → **tech_stack** (drives pain-point inference: e.g., legacy stack + AI hiring = readiness)
  - `integration_count` → **sophistication_level** (feeds scoring)

---

## 11. Funding announcements (Crunchbase News, TechCrunch, RSS feeds)

- **What you get:** New rounds, Series/amount/date, the news story, founder quotes, growth plans — the highest-intent signal for a startup: fresh money = budget for outside help.
- **How to pull it:** **RSS feeds** (TechCrunch, Crunchbase News, targeted vertical newsletters) ingested into n8n/Azure Logic Apps → parse with feeds → normalize. Also monitor GitHub release/news feeds for open-source ecosystem companies.
- **Cadence:** Continuous (15-min polling); dedupe by company_domain.
- **Field mapping:**
  - `headline`, `round_amount`, `series`, `investors`, `published_at`, `source_url` → **financials + intent_flags + evidence**
  - `founder_quote` → **pain_language** (exact wording to reuse in outreach)

---

## 12. AI-adoption signals (AI roles, LLM API usage, blog posts, product launches)

- **What you get:** Proof a company is adopting AI: AI job titles (Section 9), LLM API usage (OpenAI/Anthropic/Claude/Bedrock in jobs or tooling), AI blog posts/newsletters, AI product launches (Section 7), prompt/AI tooling vendors in tech stack, "We're hiring an AI engineer" posts.
- **How to pull it:** Aggregate from existing sources (job boards, BuiltWith, Product Hunt, website blog crawl, LinkedIn company post alerts) into one **AI-signal module** in the data lake. Optionally monitor company blog RSS feeds for AI keyword hits.
- **Cadence:** Continuous via the underlying sources; consolidated scoring nightly.
- **Field mapping:**
  - `ai_role_open` (bool), `ai_keywords_in_posts`, `llm_api_usage`, `ai_launch_count`, `ai_blog_count` → **ai_signal_score** (feeds SCORING)
  - Each signal carries `evidence_url` + `evidence_date` for outreach personalization (first-line references must use a verified, dated signal).

---

## 13. Government databases (Grants.gov, SAM.gov, public registries)

- **What you get:** Organizations pursuing public contracts/grants: entity registrations, UEI, funding awards, NAICS codes, contract values, doing-business-with-government signals. Strong for gov-adjacent ICP.
- **How to pull it:** Official **SAM.gov REST API** (public, free, keyed) for entity registration & award data; **Grants.gov API** for grant opportunities and funded grantees. Public registries (state business filings, FBO) via their official data portals — all ToS-compliant, public-sector data.
- **Cadence:** SAM.gov weekly delta; Grants.gov monthly.
- **Field mapping:**
  - `entity_name`, `uei`, `naics`, `address`, `website` → **firmographics**
  - `award_amount`, `award_date`, `agency` → **financials (public spend)** + `gov_flag`
  - `registration_status` → `compliance_fit` (they need compliance/AI-for-gov advisory)

---

## 14. Source summary table

| Source | Data delivered | Pull method | Cadence | Priority |
|---|---|---|---|---|
| LinkedIn Sales Navigator | Company + DM profiles, intent | Official API / CSV export (no scraping) | Daily alerts, weekly export | ★★★ P0 |
| Crunchbase | Funding, financials, leadership | Crunchbase API v4 | Daily delta, monthly full | ★★★ P0 |
| Google Maps / Places | Local/mid-market firms | Places API (paid) | Monthly | ★★ P1 |
| Clutch | Services firms, budgets, reviews | Licensed export / manual-assisted | Monthly | ★★ P1 |
| Upwork | Live contract demand | Upwork API / manual-assisted | Daily | ★★★ P0 |
| Wellfound | Startups, roles, team | Manual-assisted (capped) | Weekly | ★★ P1 |
| YC / Product Hunt / AngelList | Startup momentum, launches | PH API; YC manual; AH per Wellfound | Daily/PH, monthly/YC | ★★ P1 |
| Company websites | Profile, team, tech, blog | Own compliant crawler | On capture, quarterly | ★★ P1 |
| LinkedIn Jobs / Indeed / remote boards | Hiring signals | Jobs API / alerts / RSS | Daily | ★★ P1 |
| BuiltWith | Tech stack | BuiltWith API | On-demand | ★★ P1 |
| Funding news (TC, Crunchbase News) | Rounds + quotes | RSS → n8n/Logic Apps | 15-min polling | ★★★ P0 |
| AI-adoption module | AI roles, LLM usage, AI posts | Aggregate from sources above | Continuous | ★★★ P0 |
| SAM.gov / Grants.gov | Gov entities, awards, grants | Official public REST APIs | Weekly / monthly | ★ P2 |

**Priority rules:** P0 = feeds the active outreach queue daily. P1 = batch enrichment at research time. P2 = vertical campaign fuel. Every record must carry source + date; no source, no record.

---

## 15. Operational checklist (monthly)

- [ ] Review API keys/quota health (Crunchbase, BuiltWith, Places, PH, Upwork, SAM.gov).
- [ ] Re-validate ToS posture for any manual-assisted channel; retire any workflow that drifted toward scraping.
- [ ] Verify de-dup coverage: new sources mapped to `company_domain` key.
- [ ] Confirm evidence fields (url + date) present on ≥95% of records entering RESEARCH.
- [ ] Spot-check AI-signal module accuracy vs. manual review of 20 random records.
- [ ] Archive stale records (no signal in 180 days) to cold storage; flag for recycle list.
