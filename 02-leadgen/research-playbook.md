# Company Research Playbook — Meridian Research & Advisory

**Purpose:** Standardize the per-company research that turns a raw source record into a verified, scored, outreach-ready prospect record. RESEARCH sits between SOURCES and SCORING in the pipeline.
**Owner:** Lead Gen Dept. **Timebox:** 20–30 min per company; batch via n8n/Azure Logic Apps where data comes from APIs; human review where it requires judgment.

---

## 0. Research principles

- **Every claim needs evidence** — a URL + a date. No evidence, no signal.
- **Confidence levels** per field: `HIGH` (dated primary source), `MED` (secondary, recent), `LOW` (inferred). Outreach personalization may only use HIGH/MED signals.
- **Date discipline:** label each datapoint with `collected_at`; prefer the freshest. A 14-month-old funding round is a *stale* signal for an outreach first line.
- **Output:** one normalized record per company (see Section 9) that feeds SCORING and the CRM.

---

## 1. Basic firmographics

**Steps**
1. Pull website + about page; record value proposition in 1 sentence.
2. Confirm name, legal name, HQ, region, founded year, sector/NAICS.
3. Size band (employee count): cross-check LinkedIn company page vs. Crunchbase vs. website careers page.
4. Contact form / phone / LinkedIn company URL / socials — needed later for outreach compliance and DM identification.

**Field targets:** `company_name`, `legal_name`, `domain`, `hq_city/country`, `founded_year`, `industry`, `company_size_band`, `website`, `linkedin_company_url`.
**Evidence rules:** website and LinkedIn counts agree → HIGH; one source only → MED.

---

## 2. Funding & financials

**Steps**
1. Crunchbase: total funding, last round type/date/amount, investors, valuation if public.
2. Cross-check Crunchbase News / TechCrunch via RSS for the round announcement (fresh quotes + exact figures).
3. Public registries (SAM.gov awards) for gov-adjacent firms; state filings for revenue hints where public.
4. If bootstrapped/private: leave revenue `null`, set `revenue_band = unknown`, rely on headcount + hiring to infer budget.

**Field targets:** `total_funding_usd`, `last_funding_date`, `last_funding_type`, `investors`, `revenue_band`, `revenue_estimate_source`.
**Evidence rules:** round amount must be dated within 90 days of announcement to count as "fresh capital". Investor names are HIGH (Crunchbase). Estimates stay LOW.

---

## 3. Tech stack & AI signals

**Steps**
1. BuiltWith profile → CMS, CRM, marketing automation, analytics, integrations.
2. Website `<script>`/generators crawl → framework, SaaS tooling hints.
3. AI-specific: search site blog + careers for "AI / ML / LLM / automation / Copilot / GPT / Claude / OpenAI" mentions.
4. Check job postings for AI roles (LinkedIn Jobs, remote boards) — a hiring AI/automation role is the single strongest adoption signal.
5. Note tool mentions in public content (case studies, tech talks, vendor pages).

**Field targets:** `tech_stack[]`, `cms`, `crm`, `ai_signal_score`, `ai_role_open`, `llm_api_usage`, `ai_keywords_found[]`.
**Evidence rules:** LLM API usage only if confirmed by a job post or vendor/documented mention (HIGH); "mentions AI in blog" is MED; nothing = LOW.

---

## 4. Hiring signals

**Steps**
1. LinkedIn Jobs / Indeed / remote boards: open roles, titles, seniority, department, salary band if shown.
2. Headcount trend (LinkedIn growth, Crunchbase employee change) over 6 months.
3. Recent-hiring intent: executive roles (CISO, CTO, Head of Data, Head of Marketing) = budget + pain.
4. Capture the exact posting URL + date for every role that informs personalization.

**Field targets:** `open_roles[]`, `hiring_signals[]` (each: role, dept, seniority, url, date), `headcount_trend`.
**Evidence rules:** live posting = HIGH; "hiring announced in blog" = MED; "careers page mentions expansion" = LOW.

---

## 5. Competitor position

**Steps**
1. Who are their 3–5 named competitors? (Crunchbase similar companies, G2/Capterra listings, news comparisons.)
2. Do they compete *on* AI/data or *lag* in it? Search for their AI product pages vs. competitors'.
3. Note any public comparison content, reviews, or analyst mentions.
4. Outcome: a one-line competitive position statement that supports pain-point framing (e.g., "leader in X, but no public AI strategy").

**Field targets:** `competitors[]`, `competitive_position`, `ai_lagging_indicator` (bool).
**Evidence rules:** named competitor with source = HIGH; "leader/laggard" claim needs a dated source or must be flagged LOW/inference.

---

## 6. Pain-point inference with evidence

**Method:** Combine the above into 1–3 ranked pain hypotheses. For each hypothesis require:
- `pain_statement` (1–2 lines, in the prospect's words where possible)
- `evidence` (exact signal + url + date)
- `evidence_confidence` (HIGH/MED/LOW)
- `score_weight` (feeds SCORING)

**Template pain library (map signals → hypotheses):**
- Raised capital + hiring AI roles → *"Building AI capability now, needs strategy/fractional advisory to avoid wasted spend."*
- Legacy tech stack + growth target → *"Stack won't scale; needs a modernization roadmap."*
- Hiring competitive-intelligence / market-research roles → *"Needs an Intelligence Subscription instead of another headcount."*
- Gov contract wins → *"Needs compliance-aware AI and go-to-gov strategy."*
- Competitor ships AI product, they don't → *"Competitive gap; needs AI strategy sprint."*

**Evidence rules:** a pain hypothesis without a HIGH/MED dated signal must not reach the outreach queue.

---

## 7. Budget estimation method

**Formula:** `budget_band = revenue_band × assumed_spend_rate`

**Revenue band (fallback ladder):**
- Public/registered financials → exact (HIGH).
- Crunchbase revenue estimate → use with MED confidence.
- Headcount heuristic: `revenue ≈ headcount × role_value` where role_value defaults to $150k for professional/tech services, $200k for fintech/industrial software; adjust for region. → LOW.
- Funding-spend assumption: Series A/B startups spending 20–40% of runway annually on external services → MED.

**Assumed spend rates on research/consulting/AI advisory (defaults):**
- AI/SaaS, funded: 1–3% of revenue on strategy/consulting.
- Professional services: 0.5–1.5%.
- Industrials/mid-market: 0.3–1%.
- Gov-adjacent: 0.5–1% + compliance spend.

**Output:** `budget_band` ∈ {micro <$10k, small $10–50k, medium $50–150k, large $150–500k, enterprise >$500k} + `budget_confidence`.
**Rule:** always state assumptions in the record; scoring tiers use the *conservative* edge of the band when confidence is LOW.

---

## 8. Decision-maker identification

**Steps**
1. Identify the likely buyer: Head/VP of Strategy, CTO/CIO, Head of Innovation, Chief of Staff, Head of Market Intelligence, founder/CEO (≤50 employees).
2. Verify the person is current (LinkedIn profile, title matches current open roles/org chart).
3. Prefer a person with a *publishable business email* or verified LinkedIn — never guess emails from unverified sources; use Hunter/Clearbit to verify then confirm domain syntax.
4. Capture 1 primary + up to 2 secondary contacts; record their likely pain angle from Section 6.
5. Record the DM's recent public signal (job change, post, speaking) for first-line personalization.

**Field targets:** `decision_makers[]` (name, title, level, function, linkedin_url, email_status {verified/unverified}, primary/secondary flag), `dm_signal` (url + date).
**Evidence rules:** title/tenure from LinkedIn = HIGH; from blog byline = MED; guessed = LOW and ineligible for first-line personalization.

---

## 9. Research record output (normalized JSON)

```json
{
  "company": {
    "name": "", "legal_name": "", "domain": "", "hq": "", "region": "",
    "industry": "", "naics": "", "founded_year": null, "size_band": "",
    "website": "", "linkedin_company_url": "", "cms": "", "crm": "",
    "tech_stack": [], "sophistication_level": ""
  },
  "financials": {
    "total_funding_usd": null, "last_funding_date": null, "last_funding_type": "",
    "investors": [], "revenue_band": "", "revenue_confidence": "",
    "budget_band": "", "budget_confidence": ""
  },
  "signals": {
    "ai_signal_score": 0, "ai_role_open": false, "llm_api_usage": false,
    "open_roles": [], "hiring_signals": [], "headcount_trend": "",
    "intent_flags": [], "gov_flag": false
  },
  "positioning": {
    "competitors": [], "competitive_position": "", "ai_lagging_indicator": false
  },
  "pain": [
    {"hypothesis": "", "evidence": "", "evidence_url": "", "evidence_date": "",
     "confidence": "HIGH", "weight": 0}
  ],
  "decision_makers": [
    {"name": "", "title": "", "level": "", "function": "", "linkedin_url": "",
     "email_status": "", "primary": true, "dm_signal": {"url": "", "date": ""}}
  ],
  "meta": { "source_id": "", "source_type": "", "collected_at": "", "researched_at": "" }
}
```

---

## 10. Single-company research checklist

- [ ] Website + about read; value prop captured (1 line).
- [ ] Size band agreed across ≥2 sources or flagged LOW.
- [ ] Crunchbase funding/financials pulled and dated.
- [ ] BuiltWith + site crawl tech stack captured.
- [ ] AI keywords searched across blog, careers, jobs; `ai_signal_score` assigned.
- [ ] Open roles logged with url + date.
- [ ] Competitors named; position statement written.
- [ ] 1–3 pain hypotheses each with evidence + confidence + weight.
- [ ] Budget band computed with stated assumptions + confidence.
- [ ] 1–3 decision makers identified; email status verified; primary flagged.
- [ ] Meta: source_id, source_type, collected_at, researched_at populated.
- [ ] Record passed SCORING gate or returned to source queue with reason.
