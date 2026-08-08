# SOP — Fractional Advisory Retainer

> Version 1.0 · Owner: Halo (Client Success) + Dispatch (Delivery Ops) · Applies to: Fractional AI Advisory Retainer ($5–15k/mo)

## Purpose

Provide an always-available AI chief-of-staff to client leadership: weekly decision memos, on-demand Q&A, meeting prep, and board packs, backed by the Meridian research desk. The retainer is the highest-value recurring product; responsiveness SLAs and proactive value delivery drive retention and expansion.

## Responsiveness SLA

- **Q&A, research-backed** — < 24 business hours (default), measured from receipt to answer sent.
- **Q&A, urgent** — < 4 business hours, urgent classification defined in contract (e.g., time-sensitive vendor decision, board crisis).
- **Meeting prep** — ≥ 24 hours before the meeting.
- **Weekly memo** — delivered ≥ 24h before the weekly session.
- **Out-of-scope asks** — triaged and routed to Vector within 24h for an upsell conversation.
- SLA clock runs on business hours; urgent bypasses normal queue via the automation layer.

## Trigger

- Signed MSA + retainer order; first-month invoice charged at period start (annual prepay discounted per pricing policy).
- Kickoff scheduled within 5 business days; time-to-first-value (first decision memo) ≤ 14 days.
- Attach/expansion path from Sprint or Intelligence subscription identified (upsell ladder).

## Prerequisites

- Signed agreement; Legal Gate closed by Amicus; payment verified by Tally.
- Workspace created by Dispatch: `MRA-<client>-advisory-<YYYYMMDD>` with folders (`00-intake/`, `10-memos/`, `20-meetings/`, `30-board/`, `40-qa/`, `50-delivery/`), client portal, and shared calendar.
- Retainer scope locked by Kepler: hours-equivalent per month (10–40h agent+human), session cadence, Q&A channel, stakeholder map, and escalation contacts.
- Success plan created by Halo: objectives, adoption targets, and monthly value metrics.
- Decision-memo template, Q&A triage rules, and meeting-prep checklist loaded into the automation layer.

## Steps

1. **Kickoff call** — Halo + Kepler. Confirm scope, stakeholder map, communication channels, session cadence (default weekly), Q&A channel (email/portal/Slack), and the decisions the retainer supports. Log success plan to CRM. *Outcome: success plan agreed with client sponsor.*
   - Agenda: scope, decision domains, channels, session cadence, escalation contacts, success plan.
2. **Session scheduling** — Dispatch. Book the recurring weekly session (60 min) for the retainer term; register meeting-prep triggers and client-input reminders (48h before each session). *Gate: recurring calendar confirmed by client.*
3. **Ongoing context ingestion** — Halo. Maintain a living context file: client strategy, open decisions, prior memos, meeting notes, and standing research topics. Updated after every interaction. Tool: CRM + workspace `00-intake/`. *Gate: context file updated within 24h of any client interaction.*
   - Context file feeds the memo generator so each week builds on the last.
4. **Weekly decision memo** — Sage + Kepler. Produce the weekly decision memo (2–4 pages): top decisions on the client's table, analysis, options with trade-offs, recommendation, and risks — every claim source-linked and grounded in the context file. *Output: memo draft.*
   - Structure: Decision → Context → Options (with trade-offs) → Recommendation → Risks → Ask of client.
5. **Memo QA** — Norm. Run the advisory QA checklist: factual accuracy, source verification, internal consistency with prior memos, decision-quality of recommendations, brand voice, and scope adherence. *Gate: no client-facing send before Norm approval.*
   - Recurring topics that repeat in QA findings trigger a checklist/context update.
6. **Weekly session** — Halo + Sage. Run the 60-min session: walk the memo, surface open questions, capture decisions and new asks. Distribute action items within 24h. Tool: video, meeting notes template, action-item tracker. *Gate: action items logged and owners assigned.*
7. **On-demand Q&A** — Sage. Triage incoming questions via the automation: classify (strategy / research / operational / out-of-scope). Answer within SLA — default: research-backed answers < 24 business hours, urgent (defined in contract) < 4 hours, out-of-scope routed to Vector for upsell. *Gate: SLA compliance tracked per ticket; breaches logged.*
   - Q&A log maintained in the portal so the client sees a searchable history.
8. **Meeting prep** — Sage + Halo. For sponsor-requested client meetings (vendor demos, investor prep, internal exec reviews): agenda, context brief, stakeholder positioning, and recommended talking points, delivered ≥ 24h before the meeting. *Output: prep pack.*
9. **Board pack** — Sage + Kepler. On the agreed cadence (quarterly default): board-ready summary of AI initiatives, competitive positioning, risks, and next-quarter plan. Source-linked, CEO-grade. *Gate: board pack passes the full QA gate before send.*
   - Board pack reviewed by Halo for tone and by Norm for evidence before delivery.
10. **Value reporting** — Halo. Monthly value report: decisions informed, Q&A volumes, memos delivered, SLA compliance, and documented client value (cost saved, decisions unblocked). Shared in the monthly review call. *Gate: value metrics recorded in CRM.*
11. **Monthly review call** — Halo + Kepler. Review value delivered, reset priorities, refresh the success plan, and confirm the next month's focus. Log re-scope asks through change control. *Gate: success plan updated and client confirms focus.*
12. **Renewal & expansion** — Halo + Vector. Day-45 renewal opener; expansion triggers (Q&A volume growth, new business units, board-level questions) handed to Vector. Per `03-sales/renewal-playbook.md` and `03-sales/upsell-playbook.md`. *Gate: renewal conversation logged; churn-risk refreshed.*
13. **Feedback capture** — Halo. Monthly CSAT pulse; quarterly NPS. Capture qualitative feedback and route lessons to Mnemos and Norm. *Gate: feedback recorded before month close.*
14. **Rolling archive** — Mnemos. Archive memos, prep packs, board packs, and session notes; index into the vector store for continuity. Dispatch archives quarterly. *Gate: archive checklist complete.*
15. **Offboarding (if cancelled)** — Halo + Dispatch. 30-day wind-down: final memo, board pack, data/context export, access revocation (Sentinel), final reconciliation (Tally). Churn root-cause review within 24h. *Gate: offboarding checklist complete; access revoked.*

## Deliverables

1. **Weekly decision memos** — source-linked analysis + recommendation per session.
2. **On-demand Q&A** — research-backed answers within SLA (default < 24h; urgent < 4h).
3. **Meeting prep packs** — agenda + briefs for client-hosted meetings.
4. **Board pack** — quarterly board-ready summary.

**Memo anatomy** (Sage): Decision → Context → Options (with trade-offs) → Recommendation → Risks → Ask of client. Every claim source-linked and grounded in the living context file.

**Q&A quality bar** (Norm): answers name the evidence base, state confidence, flag uncertainty, and never fabricate sources; answers that exceed one page are split into memo-form follow-ups.

**QA checklist** (Norm): claims source-verified; recommendation quality (options + trade-offs + risk); internal consistency with prior memos; scope adherence; no unqualified guarantees; brand voice + formatting; AI-assisted + human-reviewed disclosure present.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| Q&A SLA compliance | Answers within SLA ÷ questions | ≥ 95% |
| Memo on-time rate | Weekly memos delivered on schedule | ≥ 95% |
| QA first-pass rate | Memos/packs passing QA first try | ≥ 90% |
| CSAT | Monthly pulse (1–5) | ≥ 4.5 |
| Renewal rate | Retainer renewals ÷ renewals due | ≥ 92% |
| Churn | Canceled retainer revenue ÷ total | ≤ 5%/mo |
| Time-to-first-value | Sign → first decision memo | ≤ 14 days |

## Escalation

- SLA breach on Q&A or memo → Dispatch → COO within 24h; client notified per comms policy.
- Scope creep (new business units, outsized Q&A volume, board asks beyond scope) → Kepler change control; price/scope change → COO + Vector; contract amendment → Amicus + Owner.
- Client risk (low engagement, unpaid invoices, satisfaction drop) → Halo escalates to COO within 24h.
- QA failure on a client-facing memo → Norm blocks; fix owned by Sage; release override requires COO+CEO.
- Confidential/sensitive client data handling → Sentinel + Amicus.

## Related

`00-company/services.md` · `00-company/pricing.md` · `05-delivery/delivery-system.md` · `05-delivery/project-lifecycle.md` · `05-delivery/sop-sprint.md` · `05-delivery/sop-intelligence-subscription.md` · `03-sales/renewal-playbook.md` · `03-sales/upsell-playbook.md` · `01-departments/09-client-success.md`
