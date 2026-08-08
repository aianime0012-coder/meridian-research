# SOP — Custom Research

> Version 1.0 · Owner: Sage (Research) + Kepler (PM) · Applies to: Custom Research (Sprint $3k · Standard $8k · Deep $15–30k, 2–8 weeks)

## Purpose

Deliver a bounded research engagement on a defined question (market entry, vendor selection, technology assessment, total cost of ownership, competitive deep-dive) with rigorous, evidence-first methodology. Every claim source-linked and QA-gated. Depth tiers (Sprint / Standard / Deep) scale method, evidence volume, and deliverable richness — not rigor.

## Tier definitions

- **Sprint** ($3k, 2 weeks): 8–15 pp report, secondary research only, ≤ 3 interviews if in scope, ≤ 20 sources.
- **Standard** ($8k, 3–5 weeks): 20–35 pp report, primary + secondary, ≤ 6 interviews, ≤ 50 sources.
- **Deep-Dive** ($15–30k, 6–8 weeks): 40–60 pp report, primary + secondary, ≥ 10 interviews + survey, 100+ sources, bespoke analysis (sizing, TCO, vendor scoring).
- Scope and tier locked at kickoff; any change runs change control via Kepler.

## Trigger

- Signed SOW (`MRA-<client>-research-<date>`) + deposit invoice; scope defines the research question, depth tier, and the decision the research must inform.
- Client confirmed kickoff; time-to-first-value (methodology note) ≤ 14 days.
- Attach offer (intelligence subscription) quoted per pricing policy.

## Prerequisites

- Signed SOW; Legal Gate closed by Amicus; payment terms executed by Tally; Compliance checklist opened by Solon (esp. for primary research).
- Workspace created by Dispatch: `MRA-<client>-research-<YYYYMMDD>` with folders (`00-intake/`, `01-methodology/`, `10-sources/`, `20-analysis/`, `30-qa/`, `40-delivery/`), shared portal, and evidence ledger.
- Research question locked by Kepler: objective, decision context, success criteria, exclusions, and depth tier.
- Data access confirmed: client documents, interview availability (if primary research included), purchased data feeds (budget approved by Ledger).
- Methodology template + QA rubric selected by tier; evidence rules and source tiers loaded by Sage.

## Steps

1. **Kickoff call** — Kepler + Sage. Confirm the research question, the decision it serves, tier scope, exclusions, timeline, and client data/access. Log to the requirements brief; post to portal. *Outcome: scope confirmation from client contact.*
   - Kickoff agenda: question restatement, decision context, tier boundaries, exclusions, data access, timeline.
   - Rejection criteria agreed: what evidence gaps would make the question unanswerable.
2. **Methodology note** — Sage. Write the methodology note: research question, hypotheses, source strategy (primary/secondary mix), inclusion/exclusion criteria, evidence rules (source quality tiers, recency windows, confidence ratings), and QA protocol. Send to client for acknowledgment. *Gate: methodology approved by client before research begins; scope frozen after.*
   - Evidence rules: Tier-1 sources (filings, primary data, official stats) weighted above Tier-2 (industry press, analyst) and Tier-3 (blogs, aggregated); recency windows per topic.
3. **Evidence collection (secondary)** — Sage. Gather sources per methodology: market data, competitor filings, press, analyst/industry reports, government data, and provider feeds. Log every source to the evidence ledger (URL, date, type, tier, access note). Tool: evidence ledger template, signals scanner, vector store. *Gate: coverage check — every research sub-question has ≥ 2 independent sources.*
   - Ledger entries include capture date, retrieval URL, publication date, and confidence.
4. **Primary research (if in scope)** — Sage + Kepler. Conduct interviews/surveys per methodology (Sprint: ≤ 3 interviews; Standard: ≤ 6; Deep: ≥ 10 + survey). Record consent, redact per privacy policy (Sentinel), log verbatim quotes with attribution rules. *Gate: interview transcripts logged and consent stored before use.*
   - Consent form per Solon; recordings stored in Sentinel-controlled storage; redaction before any reuse.
5. **Analysis** — Sage. Analyze per hypotheses: market sizing (bottom-up + cross-checked), competitive comparison matrices, TCO/vendor scoring, technology assessment. Document every analytical decision and assumption in the analysis log. Tool: analysis workbook, benchmark library. *Output: analysis log with confidence levels per finding.*
   - Every headline number cross-checked against ≥ 2 sources or methods.
6. **Draft report** — Sage. Write the report (Sprint: 8–15 pp; Standard: 20–35 pp; Deep: 40–60 pp): executive summary with recommendations, findings with source-linked evidence, limitations, and appendix cross-references. Every recommendation tied to evidence and confidence. *Output: report draft.*
   - Recommendations follow "so-what, now-what" structure with owner-agnostic actions.
7. **Data appendix** — Sage + Dispatch. Assemble the data appendix: full source ledger, data tables, interview method notes, and the evidence-to-claim mapping. Machine-readable export where applicable. *Output: appendix draft.*
8. **Findings briefing deck** — Kepler + Sage. Build the briefing (15–20 slides): decision framing, key findings, recommendations, next steps. Align to the decision the research serves. *Output: briefing draft.*
9. **QA gate** — Norm. Run the research QA checklist: factual accuracy, source verification of 100% of claims, citation integrity (no hallucinated references), methodology adherence, math re-check (sizing/TCO), scope completeness vs. SOW, brand voice, and disclosure completeness. Source-check helper cross-references the ledger. *Gate: no client-facing send before Norm approval; failures returned with fix list.*
   - Failures logged to the scorecard; re-entry loops until pass.
10. **Legal & compliance gate** — Amicus + Solon. Verify recommendations are advisory (no legal/financial/investment advice), data/privacy compliance for primary research, and no confidential-source exposure. *Gate: compliance checklist complete before delivery.*
11. **Delivery** — Dispatch + Halo. Send report + appendix through the portal on the contracted date; schedule the findings briefing call (Sage presents, Halo moderates). Log receipt. *Gate: client acknowledges in portal.*
12. **Feedback capture** — Halo. CSAT 24h post-briefing; qualitative capture of decision impact and follow-on needs. Log to CRM; route lessons to Mnemos; hand upsell triggers to Vector (intelligence subscription attach). *Gate: feedback recorded before milestone closes.*
13. **Archive** — Mnemos. Store report, methodology, evidence ledger, and lessons in the knowledge base; flag reusable frameworks; link potential case study to Marketing. Dispatch archives per `project-lifecycle.md`; Tally reconciles the invoice. *Gate: archive checklist complete.*

## Deliverables

1. **Methodology note** — approved research protocol with evidence rules.
2. **Report with recommendations** — tier-scaled depth, source-linked, decision-oriented.
3. **Data appendix** — full source ledger, tables, and evidence-to-claim mapping.
4. **Findings briefing** — 15–20 slide decision deck + recorded walkthrough.

**Evidence ledger format** (Sage): each entry records source name, URL, publication date, retrieval date, source tier, topic tag, confidence, and the claim(s) it supports. The ledger is QA-audited per report.

**Recommendation rules** (Norm): each recommendation states evidence base, confidence level, expected impact, effort/risk, and priority order; recommendations never present opinion as fact and never promise returns.

**QA checklist** (Norm): 100% of claims source-verified; no hallucinated references; methodology followed as approved; arithmetic re-calculated; scope completeness vs. SOW; limitations stated; recommendations advisory-only wording; brand voice + formatting; disclosure of AI-assisted + human-reviewed status.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| On-time delivery | Final report on contracted date | ≥ 95% |
| QA first-pass rate | Reports passing QA gate first try | ≥ 90% |
| Source verification | Claims source-verified ÷ claims | 100% |
| CSAT | Post-delivery satisfaction (1–5) | ≥ 4.5 |
| Time-to-first-value | Sign → methodology note approved | ≤ 14 days |
| Evidence coverage | Sub-questions with ≥ 2 independent sources | 100% |
| Attach rate | Research → intelligence subscription | ≥ 60% |

## Escalation

- Scope change or methodology deviation → Kepler change control; price/date impact → COO + Vector; contract amendment → Amicus + Owner.
- Source quality failure (key evidence unavailable, provider unreliable) → Sage reports to COO; client notified of coverage limitation per methodology.
- QA failure blocking delivery → Norm blocks; fix cycles owned by Sage; release override requires COO+CEO.
- Client risk (unresponsive sponsor, low CSAT, payment issue) → Halo escalates to COO within 24h.
- Data confidentiality or IP in primary research → Sentinel + Amicus before any external send.
- Coverage gap discovered late (sub-question without ≥ 2 sources) → Sage + Kepler re-scope within 48h; client informed with revised coverage statement before delivery.

## Related

`00-company/services.md` · `00-company/pricing.md` · `05-delivery/delivery-system.md` · `05-delivery/project-lifecycle.md` · `05-delivery/sop-intelligence-subscription.md` · `01-departments/03-research.md` · `01-departments/19-quality.md` · `01-departments/14-legal.md` · `01-departments/15-compliance.md`
