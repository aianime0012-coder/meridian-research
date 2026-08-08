# Lead Generation Engine — Meridian Research & Advisory

> Version 1.0 · Owned by Ranger (Lead Generation) · Feeds Vector (Sales). This is the automated system that finds, researches, scores, and handsoff qualified opportunities.

## Objective

Continuously discover organizations that fit Meridian's ICP, research them,
estimate budget and pain, identify decision-makers, rank opportunity, and
create CRM records with outreach sequences — all without human touch.

## Ideal Customer Profile (ICP)

- **Size:** 10–500 employees (mid-market focus; select 5–1000 for niches).
- **Industries (priority):** AI & SaaS, professional services, industrials, fintech, health-tech, education, gov-adjacent/non-profit.
- **Signals we hunt:**
  - Hiring for AI/data/automation roles (job postings)
  - Technology adoption (AI tools, data platforms, CRMs)
  - Recent funding rounds, new exec hires, product launches
  - Competitive moves in their space
  - Public statements about digital transformation
- **Acquisition trigger:** leadership announcing AI adoption without a strategy, or hiring "AI lead" roles, or launching AI features → needs research + strategy.

## System flow

```
  SOURCES (11+ channels)
        │  Ranger scrapes/imports candidate companies
        ▼
  RESEARCH PLAYBOOK  →  enrich every company (fields spec)
        │
        ▼
  OPPORTUNITY SCORING  →  Fit × Budget × Timing → Priority (A/B/C)
        │
        ▼
  CRM RECORD CREATION  →  companies + contacts + deal rows
        │
        ▼
  OUTREACH SEQUENCE GENERATION  →  6-touch email/LinkedIn cadence
        │
        ▼
  FOLLOW-UP SCHEDULING + RESPONSE TRACKING  →  handoff to Sales
```

## Volume targets (per month, Year 1)

| Metric | Target |
|---|---|
| Raw companies discovered | ≥ 3,000 |
| Enriched records | ≥ 750 |
| A-tier opportunities (score ≥ 75) | ≥ 60 |
| Outreach sequences started | ≥ 200 |
| Qualified leads (SQL) handed to Sales | ≥ 40 |

## Enrichment fields (per company)

Full spec: `crm-record-spec.md`. Core fields: name, website, industry, size, HQ, revenue band, funding, key signals (AI adoption, hires, launches), pain points (inferred), budget estimate, decision-makers (name/role/LinkedIn), source, fit score, tier, timestamp.

## Pain-point identification (heuristics)

- AI feature shipped without strategy → needs AI Strategy Sprint.
- Aggressive hiring in data/AI → needs advisory + competitive intelligence.
- Competing in fast-moving market (SaaS, fintech) → needs Intelligence Subscription.
- Public statements about cost/compliance pressure → needs research + training.
- No AI presence but industry peers adopting → needs Readiness assessment.

## Decision-maker identification

- Role ladder: CEO/Founder → CTO/CIO → COO/Head of Ops → Marketing/Sales exec.
- Source: LinkedIn, company site leadership pages, Crunchbase, funding press.
- Priority contact: the exec whose pain maps to our service.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| Enrichment rate | Enriched ÷ discovered | ≥ 25% |
| A-tier share | A-tier ÷ enriched | ≥ 8% |
| Sequence start rate | Sequences ÷ A+B tier | ≥ 60% |
| SQL handoff | Deals created from sequences | ≥ 40/mo |
| Lead quality | SQL→opportunity conversion in Sales | ≥ 35% |

## Automation

- Source pulls: n8n/Azure Logic Apps cron jobs (Crunchbase, funding feeds, job boards, Clutch, Google Maps, RSS).
- Enrichment: agent + enrichment APIs (Clearbit/Hunter/PredictLeads).
- Scoring: deterministic model (`opportunity-scoring.md`) run on every record.
- Record creation: API push to HubSpot/Airtable + SQLite (`16-crm/schema.sql`).
- Sequence generation: templated + AI-personalized first line.
- Tracking: open/click/reply webhooks update deal stage.

## Related

`sources.md` · `research-playbook.md` · `opportunity-scoring.md` · `crm-record-spec.md` · `outreach-sequence-spec.md` · `follow-up-scheduling.md` · `03-sales/` · `14-integrations/integration-matrix.md`
