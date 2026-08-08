# SOP — Master Delivery Lifecycle

> Version 1.0 · Owner: Dispatch (Delivery Ops) + Kepler (PM) · Applies to: All services (governs `sop-sprint.md`, `sop-intelligence-subscription.md`, `sop-custom-research.md`, `sop-fractional-advisory.md`, `sop-data-products.md`, `sop-training.md`)

## Purpose

Define the operational detail behind the 8-phase engagement lifecycle — SIGN → SETUP → KICKOFF → DELIVERY → QA → DELIVER → FEEDBACK → ARCHIVE — so every engagement runs identically, measurably, and predictably. This SOP is the master; each service SOP specifies phase variants. Targets: on-time ≥ 95%, QA pass ≥ 90%, CSAT ≥ 4.5, time-to-first-value ≤ 14 days.

## Trigger

- Fired by the relevant service SOP at each lifecycle phase (this master SOP is read as the common spine).
- Always active: any engagement in flight follows these gates, cadences, and checklists.

## Prerequisites

- Signed SOW/MSA (per service); Legal Gate closed by Amicus; payment terms executed by Tally.
- Owner roster known: Dispatch (delivery ops), Kepler (PM), Norm (QA), Halo (client success), Mnemos (knowledge), Sage (research), Cog (automation), Forge (engineering), Sentinel (security), Amicus (legal), Ledger (finance), Vector (sales).
- Workspace naming standard: `MRA-<client>-<service>-<YYYYMMDD>`.
- Automation layer healthy (n8n / Azure Logic Apps workflows for workspace creation, status reports, alerts, archive).

---

## Phase 1 — SIGN (owner: Vector, gate: Amicus legal review + owner execution)

1. Vector + Quill finalize the SOW/MSA; pricing per `00-company/pricing.md`; attach offer included.
2. Amicus runs the Legal Gate on the contract; Solon checks compliance.
3. Owner executes the contract (legally binding act — only step requiring the owner).
4. Ledger confirms fee schedule; Tally sets up invoicing in the billing system.
5. Dispatch logs the signed contract in the CRM engagement record; lifecycle clock starts (time-to-first-value timer armed).

**Checklist:** contract signed; legal review complete; payment setup confirmed; engagement record created; attach offer logged.

## Phase 2 — SETUP (owner: Dispatch, gate: workspace checklist complete ≤ 24h)

1. Dispatch creates the workspace: `MRA-<client>-<service>-<YYYYMMDD>` with the service folder set (`00-intake/`, `10-drafts/`, `20-qa/`, `30-delivery/` + service-specific folders).
2. Dispatch provisions tooling (portal, dashboard hosting, calendar, shared drives) and sets access for Meridian agents and client stakeholders (Sentinel validates).
3. Dispatch registers automations: kickoff reminders, status-report schedule, input-deadline watchers, SLA timers.
4. Kepler loads the delivery plan from the service SOP: milestones, owners, due dates.
5. Halo creates the account health record, success plan, and stakeholder map.

**Checklist:** workspace ready; access correct; automations armed; delivery plan loaded; health record created. **Gate:** setup checklist complete before kickoff scheduling.

## Phase 3 — KICKOFF (owner: Kepler + Halo, gate: client confirms scope)

1. Halo schedules the kickoff within 5 business days of signature; sends pre-read (service overview + intake questionnaire).
2. Kepler runs the kickoff call: objectives, success metrics, constraints, data access, timeline, decision-maker map.
3. Requirements captured to the requirements brief; scope frozen; change control documented.
4. Kepler publishes the milestone schedule + status-report cadence to the client.
5. Dispatch posts the workspace portal link and shared docs; client acknowledges scope in the portal.

**Kickoff brief template outline:** (1) engagement objectives, (2) success metrics, (3) in-scope deliverables, (4) exclusions, (5) client inputs + deadlines, (6) milestone schedule, (7) SLAs + escalation contacts, (8) communication cadence, (9) roles & stakeholders, (10) acceptance criteria.

**Checklist:** requirements logged; scope confirmed; milestones published; inputs scheduled; client acknowledgment recorded.

## Phase 4 — DELIVERY (owner: Dispatch routes specialist agents, gate: milestone checklist)

1. Dispatch routes each milestone to the owning agent (Sage/Forge/etc.) per the service SOP; Kepler maintains the milestone tracker daily.
2. Producing agents execute per service SOP steps; drafts staged in `10-drafts/`.
3. Kepler monitors progress; chases client inputs at 48h/24h marks; flags risk > 20% slip to COO.
4. Weekly status report produced and sent for engagements > 2 weeks (format below).
5. Milestone completeness verified against the service SOP deliverable checklist before QA submission.

**Milestone checklist:** deliverable complete vs. SOW scope; evidence ledger updated; assumptions documented; versioned and dated; QA submission metadata correct.

## Phase 5 — QA (owner: Norm, gate: QA pass ≥ threshold, blocks client-facing send)

1. Dispatch routes the deliverable to the QA intake queue with deliverable-type metadata.
2. Norm runs the service-specific QA checklist (source verification, accuracy, math re-check, scope completeness, brand voice, formatting, disclosure).
3. Automated source-check helper cross-references citations against the ledger; flags unverifiable claims.
4. Norm returns Pass or Fix-list; failures routed to the producing agent with a deadline; re-entry loops until pass.
5. Amicus/Solon verify the legal & compliance gate for contract-adjacent deliverables.
6. Norm logs the result to the scorecard; release lock lifts only on "approve".

**QA release checklist:** QA = approve; legal gate satisfied; compliance checklist complete; disclosures present; version finalized.

## Phase 6 — DELIVER (owner: Dispatch, gate: client acknowledges)

1. Dispatch ships final deliverables via the portal on the contracted date/time.
2. Scheduled comms (delivery notice, walkthrough invite) sent via the comms scheduler.
3. Halo coordinates any walkthrough/briefing call per the service SOP.
4. Dispatch logs the send, receipt, and any acknowledgment; updates the pipeline board.
5. Deliverable marked delivered in CRM; invoice milestone reconciled with Ledger/Tally.

**Checklist:** deliverables sent on time; send logged; receipt/acknowledgment tracked; billing reconciled.

## Phase 7 — FEEDBACK (owner: Halo, gate: feedback recorded)

1. Halo triggers CSAT 24h after delivery (automated); NPS per quarterly cadence.
2. Halo captures qualitative feedback and adoption blockers; updates account health score.
3. Triage client issues to owning departments with SLA responses; track to resolution.
4. Halo logs lessons to Mnemos; hands upsell triggers to Vector.
5. Feedback data feeds the Improvement engine (Norm) and the KPI dashboard (Euclid).

**Checklist:** CSAT captured; qualitative feedback logged; issues resolved or in SLA; lessons captured; health score updated.

## Phase 8 — ARCHIVE (owner: Mnemos + Dispatch, gate: archive checklist)

1. Dispatch moves final deliverables, contracts, correspondence, and send receipts to the archive with versioning.
2. Mnemos ingests deliverables, evidence ledgers, and lessons into the knowledge base (linked, no orphans); updates the case-study queue for Marketing.
3. Sentinel revokes stale access; data retained/deleted per retention policy.
4. Tally finalizes invoices; Ledger closes the engagement cost record.
5. Dispatch verifies archive completeness; engagement marked closed.

**Archive checklist:** all deliverables archived; contracts + correspondence filed; access revoked; billing reconciled; lessons linked; archive completeness 100%.

---

## Status report format (weekly, engagements > 2 weeks)

1. **Engagement overview:** client, service, phase, % complete, health (green/yellow/red).
2. **Milestone status:** planned vs. actual dates per milestone; completed / in-flight / at-risk.
3. **Delivered this week:** list of deliverables shipped.
4. **Client inputs:** items due, items received, overdue flags.
5. **Risks & mitigations:** open risk flags and owner.
6. **Next steps:** upcoming milestones and what the client should expect.

## Knowledge capture (end of every engagement)

- Mnemos captures: methodology used, evidence ledger highlights, what worked, what didn't, reusable templates, and reusable data.
- Norm captures: QA findings, gate failures, and checklist updates needed.
- Halo captures: client-voice lessons and upsell triggers.
- All captured items are linked into the knowledge base (no orphans) within 24h of close and indexed for retrieval.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| On-time delivery | Milestones met on date | ≥ 95% |
| QA pass rate | Deliverables passing first QA gate | ≥ 90% |
| CSAT | Post-deliverable satisfaction (1–5) | ≥ 4.5 |
| Time-to-first-value | Sign → first deliverable | ≤ 14 days |
| Churn (subs) | Cancelled subscription revenue ÷ total | ≤ 5%/mo |
| Delivery margin | (Revenue − delivery cost) ÷ revenue | ≥ 80% |
| Kickoff time | Sign → workspace ready | ≤ 24h |
| Archive completeness | Closed engagements fully archived | 100% |

## Escalation

- Scope change / missed input SLA → Kepler → Dispatch → COO (Cadence).
- Client risk (satisfaction, scope, payment) → Halo → COO within 24h.
- QA conflict on a failing deliverable → Norm → COO; release override requires COO+CEO.
- Legal/liability question → Amicus (Legal); compliance → Solon; security → Sentinel.
- Contract/SOW amendment or any legally binding act → Owner (via COO/CEO chain).
- SLA breach with client impact → Dispatch → COO; client notified per comms policy.

## Related

`05-delivery/delivery-system.md` · `05-delivery/sop-sprint.md` · `05-delivery/sop-intelligence-subscription.md` · `05-delivery/sop-custom-research.md` · `05-delivery/sop-fractional-advisory.md` · `05-delivery/sop-data-products.md` · `05-delivery/sop-training.md` · `01-departments/10-project-mgmt.md` · `01-departments/11-delivery-ops.md` · `01-departments/19-quality.md` · `01-departments/09-client-success.md` · `01-departments/18-knowledge.md`
