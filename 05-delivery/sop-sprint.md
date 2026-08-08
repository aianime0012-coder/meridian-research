# SOP — AI Strategy & Readiness Sprint

> Version 1.0 · Owner: Kepler (PM) + Dispatch (Delivery Ops) · Applies to: AI Strategy Sprint ($5–15k, 2–4 weeks)

## Purpose

Deliver a bounded AI strategy engagement that converts "we should use AI" into a prioritized, budgeted, 90-day roadmap with quantified business cases. Output is decision-ready: the client leaves with a Readiness Scorecard, an Opportunity Map, a Roadmap, and an Executive Brief they can act on immediately. This engagement is the primary land-and-expand path into the Fractional Advisory retainer (`sop-fractional-advisory.md`) and the Intelligence Subscription (`sop-intelligence-subscription.md`).

## Trigger

- Signed SOW (`MRA-<client>-sprint-<date>`); deposit invoice issued by Tally and paid or on Net-15.
- Attach offer (intelligence or advisory) quoted per `00-company/pricing.md` expansion logic.
- Client has confirmed kickoff slot (synchronous 60–90 min video call within 5 business days of signature).

## Prerequisites

- Signed SOW + executed payment terms; Legal Gate closed by Amicus; Compliance checklist opened by Solon.
- Workspace created by Dispatch: `MRA-<client>-sprint-<YYYYMMDD>` with folders (`00-intake/`, `01-analysis/`, `10-drafts/`, `20-qa/`, `30-delivery/`), shared client portal link, and invoice record.
- Client data access confirmed: org chart, headcount, tech stack list, key processes, budget signals, stated pain points.
- Requirements brief captured by Kepler from the kickoff; scope frozen (change control for anything new).
- Kickoff deck and intake questionnaire drafted by Dispatch, reviewed by Norm before send.
- Time-to-first-value budgeted: first deliverable (Readiness Scorecard draft) shipped ≤ 14 days from sign.
- Readiness Rubric, Opportunity Matrix, ROI model, and Roadmap templates loaded by Dispatch; prior comparable engagements retrieved from the vector store by Mnemos.

## Steps

1. **Kickoff call** — Kepler + Halo. Run intake: confirm objectives, success metrics, constraints, data access, decision-maker map, and timeline. Log all answers to the requirements brief; post to the client portal. Tool: calendar + video, CRM engagement record, requirements template. *Outcome: scope confirmation signed off by client contact.*
   - Agenda fixed: intro, objectives, success metrics, data access, stakeholder map, timeline, scope freeze.
   - Follow-up within 24h: send the kickoff summary and portal login to all attendees.
2. **Client data collection** — Dispatch + client admin. Collect org chart, headcount by function, tech stack inventory, process maps for 3–5 core workflows, current AI usage (tools, licenses), data assets, and budget signals. Tool: intake questionnaire (portal form), CRM, workspace `00-intake/`. *Gate: intake completeness checklist ≥ 90% before analysis starts; missing items chased at 48h and 24h marks.*
   - Dispatch sets a per-item deadline in the tracker; Kepler chases overdue inputs.
   - Any unavailable data is logged as a readiness gap, not silently omitted.
3. **Readiness assessment** — Sage. Score the client across 5 dimensions (data readiness, process readiness, skills readiness, infrastructure readiness, governance readiness) using the Meridian Readiness Rubric. Each dimension scored 1–5 with source-linked evidence and a gap narrative; benchmarks drawn from comparable engagements and the AI Adoption Benchmark. Tool: rubric template, evidence log, vector-store retrieval. *Output: Readiness Scorecard draft.*
   - Each score must cite specific evidence (observed process, stated tooling, data samples).
   - Confidence noted per dimension (high/medium/low) based on data completeness.
4. **Opportunity scan** — Sage. Map AI opportunities across the client's functions (revenue, operations, customer, product, support) against their scored readiness. Rank each opportunity by impact (revenue/cost/risk) and feasibility (data + process readiness required). Target 8–12 opportunities scanned, top 3 elevated. Tool: opportunity matrix template, market benchmark data, ROI model. *Output: Opportunity Map draft.*
   - Every opportunity gets: function, description, impact score, feasibility score, and evidence note.
   - Top-3 selection documented with rationale (why chosen, why others deferred).
5. **ROI estimates** — Ledger + Sage. For the top 3 priority use-cases, build bottom-up ROI: hours saved, revenue captured, cost avoided, license/implementation cost, 12-month net value, payback period. State assumptions explicitly; flag unverified inputs as low-confidence. Tool: ROI model spreadsheet in workspace, finance benchmark library. *Gate: every estimate carries a stated assumption and confidence level (high/medium/low).*
   - ROI model shows base case, conservative, and stretch scenarios.
   - Ledger signs off the model; assumptions listed in the appendix.
6. **Roadmap build** — Kepler. Sequence the top 3 use-cases into a 90-day roadmap: phase gates (assess → pilot → scale), owners, dependency on client resources, and a 6–12 month horizon view. Each roadmap item maps to a scored opportunity and an ROI line; resourcing and budget callouts per phase. Tool: roadmap template, milestone tracker. *Output: Roadmap draft.*
   - Dependencies flagged (data readiness, vendor contracts, hiring) with owner and deadline.
   - Stop/skip criteria defined per phase so the client can gate spending.
   - Milestones carry go/no-go checkpoints tied to readiness score improvements.
7. **Executive Brief synthesis** — Sage + Kepler. Compile the 4–6 page brief: situation, readiness headline, top opportunities with ROI, roadmap, risks, and recommended next actions (including the attach offer path). Keep it evidence-first; every claim source-linked. Tool: brief template, brand style guide. *Output: Executive Brief draft.*
   - Draft goes to Halo for client-voice check before QA.
8. **QA gate** — Norm. Run the sprint QA checklist: logic and coherence, factual accuracy, source verification of every claim, ROI math re-calc, completeness against SOW scope, brand voice, and formatting. Source-check helper cross-references citations against the evidence log. *Gate: all checklist items pass; failures returned to owning agent with fix list and a 24h fix deadline; no client-facing send before approval.*
   - Failures logged to the scorecard; re-entry loops until pass.
9. **Client delivery** — Dispatch + Halo. Send all four deliverables through the client portal on the agreed date; schedule a 60-min walkthrough call (Kepler presents, Halo moderates, client contact + sponsor attend). Log send receipt and attendance. *Gate: client acknowledges receipt in portal.*
   - Walkthrough covers: scorecard headline, top-3 opportunities, roadmap, next-step offer.
10. **Feedback capture** — Halo. Send CSAT survey 24h after walkthrough; capture qualitative feedback and any adoption blockers. Update account health score; log lessons to Mnemos; feed findings to Norm's improvement engine. Tool: CSAT automation, CRM. *Gate: feedback recorded before milestone closes.*
    - Any blocker raised routes to Dispatch for a same-week follow-up.
11. **Handoff to next engagement** — Halo + Vector. If attach offer was accepted, trigger onboarding to the retainer/subscription; otherwise log the "so what do we do?" signal and set a 30-day follow-up. *Gate: next-step owner assigned in CRM.*
    - Follow-up scheduled at day 30 with a tailored re-engagement angle.
12. **Archive** — Mnemos. Package final deliverables, evidence log, assumptions, and lessons into the knowledge base; link the case study potential to Marketing. Dispatch archives the workspace per `project-lifecycle.md`; Tally reconciles the invoice. *Gate: archive checklist complete.*

## Deliverables

1. **Readiness Scorecard** — 5 dimensions, 1–5 scores, evidence-linked gaps, dimension-level recommendations.
2. **Opportunity Map** — ranked opportunities by impact × feasibility, 8–12 candidates scanned, top 3 elevated.
3. **Roadmap** — 90-day phased plan with owners, dependencies, budget callouts, and 6–12 mo horizon; every item tied to an ROI line.
4. **Executive Brief** — 4–6 pages, decision-ready narrative with source links and recommended next actions.

**QA checklist** (Norm): scope completeness vs. SOW; every claim source-verified; ROI arithmetic re-computed; assumptions stated with confidence levels; brand voice + formatting; no unqualified guarantees; documents reference the QA version and date; AI-assisted + human-reviewed disclosure present.

**Intake evidence minimums** (Dispatch): org chart and headcount confirmed; tech stack inventory current; ≥ 3 process maps submitted; current AI tooling list and license counts; budget signals documented; each item source-tagged in `00-intake/`.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| Time-to-first-value | Sign → Readiness Scorecard draft sent | ≤ 14 days |
| On-time delivery | Final milestone met on contracted date | ≥ 95% |
| QA first-pass rate | Deliverables passing QA gate first try | ≥ 90% |
| CSAT | Post-delivery satisfaction (1–5) | ≥ 4.5 |
| Attach rate | Sprint → subscription/retainer conversion | ≥ 60% |
| ROI confidence | Use-cases with stated assumptions + confidence level | 100% |
| Evidence coverage | Scorecard dimensions with cited evidence | 100% |

## Escalation

- Client inputs missing > 48h past deadline → Kepler reminds, then Dispatch, then COO (Cadence) if the contracted date is at risk.
- Scope change requested after freeze → Kepler logs change control; goes to COO; contract/SOW amendment requires Amicus + Owner signature.
- QA failure on a client-facing deliverable → Norm blocks release; fix cycles owned by the producing agent; release override requires COO+CEO.
- Client satisfaction risk (low CSAT, sponsor churn, payment issue) → Halo escalates to COO within 24h.
- Data confidentiality or IP question → Sentinel + Amicus before any external send.

## Related

`00-company/services.md` · `00-company/pricing.md` · `05-delivery/delivery-system.md` · `05-delivery/project-lifecycle.md` · `05-delivery/sop-fractional-advisory.md` · `05-delivery/sop-intelligence-subscription.md` · `03-sales/onboarding-playbook.md` · `03-sales/upsell-playbook.md` · `01-departments/10-project-mgmt.md` · `01-departments/11-delivery-ops.md` · `01-departments/19-quality.md`
