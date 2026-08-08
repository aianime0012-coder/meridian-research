# Monitoring Sources Matrix

> Version 1.0 · Owned by Sage (Research) · Canonical list of signal sources per monitoring domain. Every domain must have ≥ 3 active sources; every source has an owner pull method, cadence, and priority.

## Pull methods (P1–P5)

| Method | Tool | Used for | Failure mode |
|---|---|---|---|
| P1 RSS | n8n RSS Feed trigger | News sites, blogs, feeds | Feed URL rot → weekly health check |
| P2 API | n8n HTTP Request → JSON parse | GitHub, Crunchbase, regulatory APIs | Rate limits → token + backoff |
| P3 Browser automation | n8n + Playwright | Sites w/o API/RSS (pricing pages, portals) | Selector drift → monthly review |
| P4 Email digest | n8n IMAP trigger | Newsletters, investor roundups | Spam filters → allowlist sender |
| P5 Manual ingest | Sage queue (human or agent) | Community threads, deal leaks | Low volume → flag when silent 2 weeks |

**Ingestion pipeline:** all pulls land in the Research inbox → `normalize-signals` job dedupes + stamps `{type, subject, evidence_url, date, confidence, action_recommended}` → Sage triages → verified signals → knowledge base + vector store.

---

## 1. AI

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| OpenAI / Anthropic / Google DeepMind changelogs & blogs | News | P1 | Daily | High |
| Hacker News (hackernews RSS, "Show HN") | Community | P1 | Hourly | High |
| Hugging Face Trending Models (huggingface.co/api/trending) | API | P2 | Daily | High |
| r/MachineLearning, r/LocalLLaMA | Community | P1 (subreddit RSS) | Daily | Med |
| The Rundown / TLDR AI newsletters | Email | P4 | Daily | Med |
| Papers with Code + arXiv (cs.AI, cs.LG) | API | P2 | Daily | Med |
| Artificial Analysis / Vellum LLM price & latency trackers | Tracker | P2 | Weekly | High |
| Salesforce Agentforce / Microsoft Copilot Studio release notes | Vendor | P2 | Weekly | Med |

## 2. Technology

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| GitHub Trending (api.github.com) filtered to topics we use | API | P2 | Daily | High |
| TechCrunch, The Verge, Ars Technica RSS | News | P1 | Hourly | Med |
| CNCF / major foundation release notes | Vendor | P2 | Weekly | Med |
| Hacker News front page (meta/tech threads) | Community | P1 | Hourly | Med |
| Product Hunt (API) | API | P2 | Daily | Low |
| Phoronix / InfoQ for infra & platform shifts | News | P1 | Daily | Low |

## 3. Government policy

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| EU AI Act tracker (eu-ai-act.net / European Parliament RSS) | Regulatory portal | P1 | Weekly | High |
| ICO (UK) news, EDPS GDPR guidance | Regulatory portal | P1 | Weekly | High |
| EU Open Data Portal / EUR-Lex legislative feed | Regulatory portal | P1 | Weekly | High |
| US FTC / NIST AI Risk Mgmt Framework updates | Regulatory portal | P1 | Weekly | High |
| state-level AI bills (MultiState / NCSL tracker) | Tracker | P2 | Weekly | Med |
| Federal Register (US) API, procurement notices | API | P2 | Weekly | Med |
| EU Digital Markets/Procurement tender portal (TED) | Database | P2 | Weekly | Med |

## 4. Funding

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| Crunchbase API (companies by vertical/region, round type) | API | P2 | Daily | High |
| TechCrunch Funding / Finextra / 16z (a16z) deal posts | News | P1 | Daily | High |
| Sifted, EU-Startups, Dealroom tracker | News/Database | P1 | Weekly | Med |
| Seedrs/Crowdcube or local registries for private rounds | Database | P1 | Weekly | Low |
| AI Grant / accelerators (Y Combinator launches) | Tracker | P2 | Batch on batch | Med |
| M&A feeds (S&P CapIQ free feeds, PR Newswire M&A RSS) | News | P1 | Daily | Med |

## 5. Markets

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| Gartner/Forrester public blogs (paid pieces → abstracts) | News | P1 | Weekly | Med |
| Statista / IBISWorld topic pages (public excerpts) | Database | P2 | Monthly | Low |
| Google Trends API for vertical keywords | API | P2 | Weekly | Med |
| Job postings tracker (LinkedIn/BuiltIn volume per vertical) | API | P2 | Weekly | Med |
| Trade publications per vertical (Finextra, HealthcareIT, Manufacturing Dive) | News | P1 | Daily | High |
| Public company earnings calls (Motley Fool / Yahoo transcripts) | News | P2 | Quarterly | Med |

## 6. Competition

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| Competitor pricing pages | Browser automation | P3 | Weekly | High |
| Competitor changelog/release blogs | News | P1 | Daily | High |
| G2 / Capterra reviews & rankings for competitor products | Tracker | P3 | Weekly | High |
| Crunchbase competitor funding/alumni moves | API | P2 | Weekly | High |
| LinkedIn company page activity, job posts (headcount signal) | Browser automation | P3 | Weekly | Med |
| Competitor webinars/landing pages (positioning shifts) | Browser automation | P3 | Monthly | Med |

## 7. Industry trends

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| Vertical trade feeds (fintech, health, industrials, retail) | News | P1 | Daily | High |
| CB Insights industry briefs (free tier) | News | P1 | Weekly | Med |
| McKinsey/Deloitte/BCG public insights pages | News | P1 | Weekly | Med |
| r/fintech, r/healthcare, vertical Discords | Community | P1 | Daily | Med |
| Conference agendas (Web Summit, Money20/20, RSNA, Hannover Messe) | Tracker | P3 | Event cycle | Med |
| Economic stats (ONS, Eurostat, BLS APIs) | API | P2 | Monthly | Low |

## 8. Open-source tools

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| GitHub Search API (new repos by topic, stars delta) | API | P2 | Daily | High |
| GitHub trending + awesome-* curated lists | API | P2 | Daily | High |
| Hacker News "Show HN" tooling posts | Community | P1 | Hourly | High |
| r/selfhosted, r/automation, r/Python | Community | P1 | Daily | Med |
| LibreOffice of AI: Ollama / LangChain / n8n release feeds | Vendor | P1 | Weekly | High |
| Sourcegraph/OSSInsight ecosystem stats | Tracker | P2 | Monthly | Low |

## 9. Automation tools

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| n8n, Zapier, Make, Activepieces changelogs | Vendor | P1 | Weekly | High |
| r/n8n, r/automate, r/AI_Agents | Community | P1 | Daily | High |
| GPT-4o/Claude API deprecation & pricing announcements | Vendor | P1 | Immediate | High |
| Agent framework GitHub repos (LangGraph, CrewAI, PydanticAI) | API | P2 | Daily | High |
| Tool directories: Toolify, Futurepedia top-agent lists | Tracker | P2 | Monthly | Med |

## 10. Customer problems

| Source | Type | Pull | Cadence | Priority |
|---|---|---|---|---|
| Sales call/CRM notes (HubSpot activities sync) | Internal DB | P2 | Daily | High |
| Support tickets & CSAT comments | Internal DB | P2 | Daily | High |
| App/software review sites (G2, Capterra) for vertical software | Tracker | P3 | Weekly | High |
| Community pain threads (r/SmallBusiness, r/sales, r/marketing) | Community | P1 | Daily | Med |
| LinkedIn posts from SMB owners/consultants in target verticals | Browser automation | P3 | Weekly | Med |
| Reddit/Trustpilot review mining for named verticals | Tracker | P2 | Weekly | Med |

---

## Consolidated source table

| Domain | Active sources | Primary pull | Cadence | Weekly volume (est.) | Owner |
|---|---|---|---|---|---|
| AI | 8 | P1/P2 | Daily | 40 | Sage |
| Technology | 6 | P1/P2 | Daily | 25 | Sage |
| Government policy | 7 | P1/P2 | Weekly | 15 | Sage + Compliance |
| Funding | 6 | P2/P1 | Daily | 25 | Sage + Sales |
| Markets | 6 | P1/P2 | Weekly | 12 | Sage |
| Competition | 6 | P3/P1 | Weekly | 20 | Sage + Sales |
| Industry trends | 6 | P1/P3 | Daily | 18 | Sage + Marketing |
| Open-source tools | 6 | P2/P1 | Daily | 22 | Sage + Engineering |
| Automation tools | 6 | P1/P2 | Daily | 20 | Sage + Engineering |
| Customer problems | 6 | P2/P3 | Daily | 15 | Sage + COO |
| **Total** | **63** | — | — | **~212** | — |

**Coverage rule:** if a domain drops below 3 healthy sources for 2 consecutive weeks, raise a `sources_gap` action to COO with replacement candidates before the next Weekly Signals Brief.

**Source health checks:** weekly n8n job pings every P1/P2 source; failed RSS → auto-swap from backup feed list; failed P3 selector → log + manual fix ticket to Engineering.
