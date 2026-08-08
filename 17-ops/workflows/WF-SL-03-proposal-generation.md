# WF-SL-03 — Proposal Generation

> Version 1.0 · Owner: Quill (Proposal Writing) · Schedule/Trigger: Event — on discovery done (won-discovery deal) · Priority: rev-relevant

## Objective

Convert a deal that has completed discovery into a QA-cleared, client-ready SOW/proposal and deliver it — email sent, follow-up cadence scheduled — without manual assembly. Every proposal follows the canonical 8-section template, passes Norm's QA gate (WF-DV-04), stays above the cost + 40% margin floor, and attaches a recurring offer (≥ 60% attach target). Outcome is a sent, traceable proposal feeding `proposal → negotiation → won` in `03-sales/sales-system.md`.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Event (webhook) |
| Cadence / time | On deal stage change `discovery → proposal` (real-time) |
| Source node | HubSpot workflow trigger → n8n Webhook node, or manual n8n run for existing deals |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Deal record (stage, amount, source, owner) | HubSpot API | Owner account |
| Discovery notes + verbatim problem quote + success criteria | Vector (CRM `notes` field) | Vector |
| Decision maker(s), budget signal, timeline driver | CRM record + discovery transcript | Vector |
| ≥ 1 verified evidence point (industry/market/competitor) | Research desk (Sage) evidence pack | Sage |
| Pricing config + margin floor (cost + 40%) | `00-company/pricing.md` + finance margin model | Ledger |
| Canonical proposal template + legal attachments (MSA, terms) | `10-legal/` templates | Amicus |
| QA checklist | `12-quality/proposal-qa.md` | Norm |

## Steps

1. **Receive deal event** — Tool: n8n Webhook node (payload: `deal_id`, stage, owner) · Owner: Quill → Output: proposal job context
2. **Validate inputs** — Tool: Code node checking all discovery inputs present (problem quote, DM, budget signal, timeline, success criteria, ≥ 1 evidence point). Missing any → DO NOT draft — owner: Quill → Output: `ready` / `incomplete` verdict
3. **Fetch pricing + margin** — Tool: HTTP Request → pricing config / Execute Query (margin model) · Owner: Ledger → Output: priced option table A/B/C with visible bundled discount
4. **Draft 8-section proposal** — Tool: Quill agent (LLM) + canonical template; personalize from deal + evidence pack; embed objection-proofing (internal-build, cost, hype, budget, company, deliverables) · Owner: Quill → Output: `proposal_draft.md`
5. **Check margin + attach** — Tool: Code node verifying gross margin ≥ cost + 40% and Option B = Recommended with subscription attach · Owner: Quill → Output: `commercial_ok` flag
6. **Render to PDF/HTML** — Tool: render pipeline (Pandoc/Markdown → PDF node or Playwright HTML) · Owner: Cog → Output: `proposal.pdf` + `proposal.html` in client workspace
7. **Send to QA gate** — Tool: Webhook (outgoing) → WF-DV-04 (Norm) with draft + SOW scope + checklist ref · Owner: Quill → Output: `qa_verdict`
8. **Handle QA result** — Tool: Switch node: IF `pass` THEN continue; IF `return-for-fix` THEN loop to Step 4 with findings (max 2 revision cycles, then escalate) — owner: Norm
9. **Deliver by email** — Tool: HTTP Request → Resend `/v1/emails` (or SendGrid) with cover email (3 lines), PDF attachment, physical address + opt-out (CAN-SPAM) · Owner: Quill → Output: `email_id`, `delivered_at`
10. **Schedule follow-up cadence** — Tool: HTTP Request → Cal.com/Calendly + CRM task creation (Day +2/+4/+7/+10/+14 per `03-sales/proposal-playbook.md` §6) · Owner: Vector → Output: follow-up task sequence
11. **Log proposal record** — Tool: Execute Query (`kpi_log` + CRM deal update: status=proposal, option A/B/C, attach flag, time-to-proposal) · Owner: Quill → Output: metrics for win/loss + `WF-SL-04`
12. **Report to dashboard** — Tool: POST Ops dashboard (proposal sent, next actions) · Owner: Quill → Output: visible pipeline status

## Decision points / branching

1. IF any discovery input missing THEN return to Vector for re-discovery — do NOT draft on assumptions — owner: Quill
2. IF QA `return-for-fix` THEN loop with Norm's findings; ≥ 3 failures on same deal → escalate to COO — owner: Norm
3. IF margin < cost + 40% THEN reject pricing, flag to Ledger; discount > 10% from list → CEO gate — owner: Ledger
4. IF client requests revisions after send THEN re-run Steps 5–9 on the revised draft (QA re-run mandatory) — owner: Quill
5. IF email bounces THEN retry address check, update CRM contact, notify Vector — owner: Vector
6. IF proposal accepted THEN trigger WF-SL-04 (contract prep + e-sign) — owner: Vector

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| LLM draft fails / times out | Retry 3× backoff; fall back to template placeholders + flag | Yes |
| PDF render fails | Retry; send HTML link instead if PDF blocked | No |
| Resend/SendGrid API error | Retry 3×; then alert Cog + Dispatch (T0 email) | Yes — send not complete |
| HubSpot deal read fails | Retry; buffer event, replay ≤ 3× | No |
| QA gate unavailable | Hold at gate — never send un-QA'd proposal | Yes |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Proposal not sent within 24h SLA | Email via Resend + dashboard | COO | next business day |
| QA fail 3× on same deal | Email via Resend | COO + Norm | systemic → CEO |
| Email delivery failure (T0) | n8n alert → Slack/Discord | Cog + Dispatch | > 2 failures → COO |
| Margin floor breach | Email via Resend | Ledger + CEO | immediate (pricing exception) |

## Success criteria

- [ ] Proposal is QA-cleared by Norm before any client-facing send (release lock enforced)
- [ ] Time-to-proposal ≤ 24h; revision cycles ≤ 2; win rate per `sales-system.md` ≥ 35%
- [ ] 3 options presented; Option B marked Recommended; subscription attach ≥ 60%
- [ ] Email delivered with cover message, PDF, physical address, and opt-out; follow-up cadence scheduled
- [ ] Proposal record + metrics (time-to-proposal, options chosen, attach flag) written to `kpi_log`

## Related

`07-automation/workflow-catalog.md` · `03-sales/proposal-playbook.md` · `03-sales/sales-system.md` · `03-sales/onboarding-playbook.md` · `WF-SL-04` · `WF-DV-04` · `00-company/pricing.md` · `01-departments/08-proposals.md` · `14-integrations/integration-matrix.md`
