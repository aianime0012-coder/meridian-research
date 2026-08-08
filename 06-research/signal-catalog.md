# Signal Catalog

> Version 1.0 · Owned by Sage (Research) · Canonical definitions, schemas, verification protocol, and triage rules for every signal type. A signal is only "verified" once it survives the verification protocol below.

## 1. Core record

Every signal is normalized to a single record before entering the Research inbox:

| Field | Type | Required | Notes |
|---|---|---|---|
| `id` | UUID | yes | Assigned by `normalize-signals` job |
| `type` | enum | yes | From catalog §2 |
| `subject` | string | yes | Entity + short title, e.g. "Anthropic Claude 5 release" |
| `evidence_url` | URL | yes | Primary source, first seen |
| `date` | ISO 8601 | yes | Date of event/claim, not ingestion date |
| `confidence` | 0.0–1.0 | yes | From scoring rubric §4 |
| `action_recommended` | string \| null | yes | Pre-filled candidate, may be null |
| `source_name` | string | yes | Feed/portal/manual, e.g. "GitHub Trending" |
| `domains` | list | yes | 1+ monitoring domains |
| `status` | enum | yes | `raw → triaged → verified | rejected | escalated` |
| `verified_by` | string | yes | Agent/human who passed QA |
| `tags` | list | no | Vertical, product area, client relevance |
| `related_reports` | list | no | Report IDs that consumed this signal |

---

## 2. Signal types by domain

### AI
| Type | Schema | Example |
|---|---|---|
| `model_release` | `{vendor, model, capability_delta, open_weights, params}` | `{vendor:"OpenAI", model:"o5", open_weights:false}` |
| `agentic_adoption` | `{company, use_case, agent_count, proof_url}` | `{company:"Shopify", use_case:"support triage", agent_count:300}` |
| `llm_pricing` | `{vendor, model, input_ppm, output_ppm, change_pct}` | `{vendor:"Anthropic", change_pct:-50}` |
| `tooling_shift` | `{tool, category, migration_from, signal}` | `{tool:"n8n 5", category:"workflow", migration_from:"Zapier"}` |

### Technology
| Type | Schema | Example |
|---|---|---|
| `platform_change` | `{platform, feature, deprecation, impact}` | `{platform:"Salesforce", deprecation:"legacy API v48"}` |
| `api_ecosystem` | `{api, status, breaking, adoption}` | `{api:"OpenAI Responses API", breaking:true}` |
| `os_project` | `{repo, stars_delta_7d, license, maturity}` | `{repo:"pydantic/pydantic", stars_delta_7d:1200}` |

### Government policy
| Type | Schema | Example |
|---|---|---|
| `regulation_issued` | `{jurisdiction, body, instrument, effective_date}` | `{jurisdiction:"EU", instrument:"AI Act GPAI obligations", effective_date:"2025-08"}` |
| `policy_draft` | `{jurisdiction, body, status, consultation_deadline}` | `{jurisdiction:"UK", body:"DCMS", status:"consultation"}` |
| `procurement_rule` | `{agency, rule, effect_on_ai, tender_window}` | `{agency:"EU TED", effect_on_ai:"AI clause mandates"}` |

### Funding
| Type | Schema | Example |
|---|---|---|
| `funding_signal` | `{company, amount, currency, round, investors, vertical}` | `{company:"Synthesia", amount:180M, round:"Series D", vertical:"content AI"}` |
| `grant_available` | `{program, agency, amount_max, deadline, eligibility}` | `{program:"Innovate UK AI Grant", deadline:"2026-03-31"}` |
| `mna` | `{acquirer, target, deal_value, rationale}` | `{acquirer:"Databricks", target:"MosaicML", deal_value:1300M}` |
| `ipo_private` | `{company, stage, valuation, timing}` | `{company:"Scale AI", stage:"IPO filing", valuation:14B}` |

### Markets
| Type | Schema | Example |
|---|---|---|
| `segment_growth` | `{segment, metric, value, source}` | `{segment:"agentic AI", metric:"CAGR", value:0.42}` |
| `pricing_benchmark` | `{category, price, basis, delta}` | `{category:"AI chatbot", price:0.02, basis:"per msg"}` |
| `demand_signal` | `{keyword, region, trend_7d, volume_index}` | `{keyword:"AI due diligence", trend_7d:+18%}` |
| `hiring_signal` | `{company, role_growth, vertical}` | `{company:"[competitor]", role_growth:"+30% eng"}` |

### Competition
| Type | Schema | Example |
|---|---|---|
| `competitor_launch` | `{competitor, product, category, pricing, positioning}` | `{competitor:"X", product:"AI analyst", pricing:"$99/mo"}` |
| `competitor_pricing` | `{competitor, product, old_price, new_price, delta}` | `{competitor:"X", new_price:79, delta:-20%}` |
| `competitor_positioning` | `{competitor, message, target_segment, url}` | `{competitor:"X", message:"for SMB CFOs"}` |
| `competitor_funding` | `{competitor, amount, round, runway_implication}` | `{competitor:"X", amount:40M, round:"Series B"}` |

### Industry trends
| Type | Schema | Example |
|---|---|---|
| `vertical_shift` | `{vertical, trend, evidence_url, velocity}` | `{vertical:"fintech", trend:"embedded AI ops"}` |
| `conference_signal` | `{event, theme, notable_announcements}` | `{event:"Money20/20", theme:"agentic payments"}` |
| `economic_indicator` | `{metric, value, period, region}` | `{metric:"SMB AI spend", value:"+22% YoY"}` |

### Open-source tools
| Type | Schema | Example |
|---|---|---|
| `tool_maturity` | `{repo, stars, license, last_release, maintainers}` | `{repo:"langgraph", stars:12k, license:"MIT"}` |
| `tool_risk` | `{repo, vulnerability, severity, affected_versions}` | `{repo:"n8n", vulnerability:"CVE-2026-xxxx", severity:"High"}` |
| `tool_opportunity` | `{repo, capability, fit_for_meridian, effort}` | `{repo:"mcp-proxy", capability:"MCP routing", effort:"1 day"}` |

### Automation tools
| Type | Schema | Example |
|---|---|---|
| `automation_release` | `{tool, version, headline_feature, fits_meridian}` | `{tool:"n8n", version:"v5", headline_feature:"workflow agent node"}` |
| `api_deprecation` | `{provider, api, sunset_date, migration_path}` | `{provider:"OpenAI", api:"assistants v1", sunset_date:"2026-06"}` |
| `pricing_change` | `{provider, model, input, output, effective}` | `{provider:"Google", model:"gemini-2.5-pro", input:0.6}` |

### Customer problems
| Type | Schema | Example |
|---|---|---|
| `pain_theme` | `{theme, quoted_need, frequency, segment}` | `{theme:"AI agents make stuff up", frequency:"3x this week"}` |
| `review_signal` | `{product, source, sentiment, extracted_quote}` | `{product:"[client category] software", sentiment:"negative"}` |
| `support_theme` | `{theme, ticket_count, csat_impact}` | `{theme:"integration setup", ticket_count:12}` |

---

## 3. Verification protocol

A signal is **verified** only when ALL of the following pass:

1. **Multi-source** — claim confirmed by ≥ 2 independent sources, OR 1 primary source (vendor/regulator/official registry) + 1 independent secondary. Exceptions logged.
2. **Dated evidence** — evidence_url points to content with a readable date ≤ 30 days from `date`; screenshots archived for browser-automation captures.
3. **Source credibility** — primary (official) > secondary (reputable trade) > tertiary (aggregator/community). Aggregator-only claims are flagged `low` confidence.
4. **Contradiction check** — query knowledge base for counter-evidence; if found, resolve or mark `escalated`.
5. **QA review** — verified by Sage or designated reviewer, stamped `verified_by`. Client-facing use requires Quality gate (see report-types.md QA requirements).

**Rejection criteria:** unverifiable claim, no date, spam/SEO-farm source, superseded by newer signal, or accuracy impact > 0 for client deliverables.

---

## 4. Confidence scoring

| Score | Meaning | Conditions |
|---|---|---|
| 0.9–1.0 | Near-certain | Primary source + 1 secondary; regulator/vendor official |
| 0.7–0.89 | High | 2 independent secondary sources; consistent |
| 0.5–0.69 | Medium | Single reputable source; or 2 sources with minor conflict |
| 0.3–0.49 | Low | Community/aggregator single source; no corroboration |
| < 0.3 | Unverified | Not ready for triage; re-check in next sweep |

Confidence gates: ≥ 0.7 required for client-facing claims; ≥ 0.5 for internal briefs; < 0.5 → `triaged` but excluded from reports unless escalated by an owner.

---

## 5. Triage rules

Decision tree applied by Sage on every `raw` signal (order matters):

1. **Blocked/harm** → escalate to Compliance + COO within 24h (security, legal exposure, reputational risk).
2. **Direct client impact** → route to client owner + Sales same day; candidate for Client Intelligence Brief.
3. **Strategic (build/buy/partner, go/no-go)** → route to COO; input to recommendation loop.
4. **Content-worthy (≥ 0.7 confidence)** → route to Marketing; candidate for Vertical Snapshot / content calendar.
5. **Competitive movement** → route to Sales + COO; candidate for Competitive Watch.
6. **Policy change** → route to Compliance + COO; candidate for Policy Watch.
7. **Tooling/automation** → route to Engineering; candidate for Tool Radar.
8. **Fodder only** → archive to knowledge base with wikilinks; no action.

**SLA:** raw → triaged ≤ 24h for P1 sources; ≤ 72h otherwise. Weekly Signals Brief collects all verified signals ≥ 0.5 from the week.

**Outcome stamps:** every triaged signal ends as `verified`, `rejected`, or `escalated`, and records the `action_recommended` that either fired or was consciously declined (decision-logged).

---

## 6. Related

`monitoring-sources.md` · `report-types.md` · `recommendation-loop.md` · `11-knowledge/` · `12-quality/` · `15-dashboards/`
