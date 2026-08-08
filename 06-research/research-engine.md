# Research Engine — Meridian Research & Advisory

> Version 1.0 · Owned by Sage (Research) · The intelligence core that powers marketing, sales, and delivery.

## Objective

Continuously monitor the domains that matter, produce verified knowledge,
recommend actions, and store everything in the knowledge base so the company
compounds in quality.

## Monitoring domains

| Domain | Examples of signals |
|---|---|
| **AI** | model releases, agentic AI adoption, LLM pricing, tooling shifts |
| **Technology** | platform changes, open-source projects, API ecosystems |
| **Government policy** | AI Act, data/privacy regs, procurement rules, tariffs |
| **Funding** | VC rounds, grants, M&A in target verticals |
| **Markets** | segment growth, pricing benchmarks, demand signals |
| **Competition** | competitor moves, pricing, positioning, launches |
| **Industry trends** | vertical-specific shifts (fintech, health, industrials) |
| **Open-source tools** | new research/automation tools we can use internally |
| **Automation tools** | workflow/agent tooling for Meridian OS |
| **Customer problems** | pain themes from sales, support, forums, reviews |

## Signal catalog

Every signal is a structured record: `{type, subject, evidence_url, date, confidence, action_recommended}`.
Full catalog: `06-research/signal-catalog.md`.

## Sources & ingestion

- RSS/news feeds, funding feeds, job boards, regulatory trackers, community forums, GitHub, competitor sites.
- Pulls automated via n8n/Azure Logic Apps cron jobs → Research inbox → Sage triages.
- Sources matrix: `06-research/monitoring-sources.md`.

## Report types

| Report | Cadence | Audience |
|---|---|---|
| Weekly Signals Brief | Weekly | Internal (COO/CEO) |
| Client Intelligence Brief | Per subscription | Client |
| Vertical Snapshot | Quarterly | Public (lead magnet) |
| Deep-Dive Research Report | Per engagement | Client |
| Internal Tool Radar | Monthly | Engineering/Automation |
| Competitive Watch | Monthly | Internal + sales |
| Policy Watch | Monthly | Internal + compliance |

Specs in `06-research/report-types.md`.

## Recommendation loop

Every report ends with **recommended actions** (build/buy/partner, go/no-go,
content topics, sales plays). Actions route to owners via `06-research/recommendation-loop.md`.

## Knowledge storage

- Every finding → knowledge base (`11-knowledge/`) with wikilinks, no orphans.
- Vector store for retrieval; QA-reviewed before client-facing use.
- Research memory makes each engagement faster and better (flywheel).

## Research KPIs

| KPI | Definition | Target |
|---|---|---|
| Signals ingested | Verified signals / week | ≥ 50 |
| Signal accuracy | Signals surviving QA verification | ≥ 95% |
| Briefs delivered | Weekly briefs on time | 100% |
| Actions generated | Recommendations routed / month | ≥ 20 |
| Reused knowledge | Content pulled from KB per deliverable | ≥ 1 |
| Freshness | % of claims in client reports sourced ≤ 90 days | ≥ 80% |

## Related

`monitoring-sources.md` · `signal-catalog.md` · `report-types.md` · `recommendation-loop.md` · `01-departments/03-research.md` · `11-knowledge/`
