# WF-DV-04 — QA Gate

> Version 1.0 · Owner: Norm (Quality) · Schedule/Trigger: Event — on deliverable draft · Priority: rev-relevant

## Objective

Be the mandatory final gate on every client-facing deliverable before it ships. The workflow receives a draft plus its metadata, runs the six-point QA checklist (logic/coherence, factual accuracy, source verification, formatting/grammar, completeness vs SOW, brand voice), applies type-specific checklists, returns an approve / return-for-fix verdict with a score, and logs everything to `kpi_log` and quality scorecards. Nothing client-facing transmits without an `approve` verdict (release lock). Guards: 100% source verification, first-pass rate ≥ 90%, time-to-gate ≤ 8h, gate leakage ≤ 2% (`01-departments/19-quality.md`).

## Trigger

| Field | Value |
|---|---|
| Trigger type | Event (webhook) |
| Cadence / time | On deliverable draft submission (real-time, 8h SLA) |
| Source node | n8n Webhook node (called by WF-SL-03, WF-MK-02, WF-RS-02, Delivery workflows) |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Deliverable draft (markdown/PDF/HTML) + artifact ID | Owning workflow / client workspace | Dispatch / Kepler |
| Deliverable type + SOW scope (for completeness check) | CRM deal + `05-delivery/` engagement record | Kepler |
| Type-specific QA checklist | `12-quality/` (proposal-qa, report-types) | Norm |
| Compliance checklist (engagement completeness) | `01-departments/15-compliance.md` | Solon |
| Legal gate result (contract-adjacent docs) | `01-departments/14-legal.md` | Amicus |
| Retrieval index (for source cross-check) | Vector store / knowledge base | Mnemos |

## Steps

1. **Receive draft** — Tool: n8n Webhook node (payload: artifact, type, SOW scope, owner) · Owner: Norm → Output: QA job context
2. **Select checklist** — Tool: Code/Switch node mapping deliverable type (Sprint, Intelligence Subscription, Custom Research, Advisory, Data Products, Training, Proposal, Newsletter) to its checklist · Owner: Norm → Output: checklist definition
3. **Logic & coherence check** — Tool: Norm agent (LLM) verifying internal consistency, argument flow, no contradictions · Owner: Norm → Output: logic score + findings
4. **Factual accuracy + source verification** — Tool: Code node cross-checking every claim against cited sources and the retrieval index; flag unverifiable or suspect (hallucinated) references · Owner: Norm → Output: `source_verification` 100% pass/fail list
5. **Completeness vs SOW** — Tool: Code node diffing draft against SOW scope + compliance checklist (all deliverables named, dated, in scope) · Owner: Norm → Output: completeness pass/fail
6. **Formatting, grammar, brand voice** — Tool: Norm agent (LLM) lint (tone, hype-words like "guaranteed"/"best-in-class", structure) · Owner: Norm → Output: style pass/fail
7. **Legal gate check** — Tool: Switch node: IF contract-adjacent THEN require Legal gate result attached; IF missing THEN hold — owner: Amicus
8. **Score + verdict** — Tool: Code node computing per-criterion score and overall verdict (pass / return-for-fix) · Owner: Norm → Output: `qa_verdict`, `qa_score` 0–100
9. **Release lock / return** — Tool: Switch node: IF `pass` THEN notify owning workflow (release lock → allow send) and mark artifact `qa_approved`; IF `return-for-fix` THEN open task on owner with findings · Owner: Norm → Output: release signal or fix task
10. **Fix minor vs major** — Tool: IF minor (typos, formatting) THEN Norm fixes in place; IF major (logic, accuracy, scope) THEN return to producing agent — owner: Norm
11. **Log score + findings** — Tool: Execute Query (`kpi_log`, quality scorecards table: verdict, score, criterion breakdown, run_id, owner) · Owner: Norm → Output: scorecard data for weekly/monthly quality reports
12. **Feed improvement engine** — Tool: findings → `13-improvement/` queue (recurring causes → checklist updates) · Owner: Norm → Output: improvement items with SLA

## Decision points / branching

1. IF verdict = `pass` THEN release lock, notify sender, proceed to send — owner: Norm
2. IF verdict = `return-for-fix` AND minor THEN Norm fixes in place and re-scores — owner: Norm
3. IF verdict = `return-for-fix` AND major THEN return to producing agent with findings, re-submit to gate — owner: Norm
4. IF contract-adjacent document lacks Legal gate result THEN hold regardless of other scores — owner: Amicus
5. IF same deliverable fails 3× THEN escalate to COO (release bypass requires COO+CEO sign-off) — owner: Norm
6. IF sampling audit flags shipped work that would fail NOW THEN open leakage ticket, expand sample — owner: Norm

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Draft malformed / unreadable | Route to `errors`, notify Dispatch | Yes — no artifact to review |
| Retrieval index unavailable | Retry 3× backoff; else flag sources "pending verification" — never auto-approve | No (verdict held) |
| SOW scope missing | Hold at completeness step, request scope from Kepler | Yes |
| Duplicate submission | Upsert on `artifact_id` (idempotent, no double review) | No |
| QA agent timeout | Retry once with smaller checklist scope; escalate if persists | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Time-to-gate > 8h SLA | Email via Resend + dashboard | Norm + Dispatch | next business day → COO |
| 3× failure on same deliverable | Email via Resend | COO + producing agent | systemic → CEO |
| Release bypass attempt (un-QA'd send) | Security alert → Sentinel + COO | immediate | immediate |
| Source verification fail on client claim | Findings to owner + COO | producing agent | if repeated → COO |
| Leakage detected in sampling audit | Email via Resend | COO + owner dept | sample expansion → COO |

## Success criteria

- [ ] 100% of client-facing claims source-verified; zero unverifiable references shipped
- [ ] First-pass gate rate ≥ 90%; time-to-gate ≤ 8 business hours
- [ ] Every verdict + score + criterion breakdown logged to `kpi_log` and scorecards
- [ ] Release lock enforced: no outbound send without `approve`; bypass requires COO+CEO sign-off
- [ ] Gate leakage ≤ 2% on sampling audits; recurring findings feed the improvement engine

## Related

`07-automation/workflow-catalog.md` · `01-departments/19-quality.md` · `WF-SL-03` · `WF-MK-02` · `WF-RS-02` · `WF-DV-05` · `03-sales/proposal-playbook.md` §5 · `06-research/report-types.md` · `13-improvement/`
