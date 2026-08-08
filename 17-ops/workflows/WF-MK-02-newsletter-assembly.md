# WF-MK-02 — Newsletter Assembly

> Version 1.0 · Owner: Astra (Marketing) · Schedule/Trigger: Cron — Friday 16:00 UTC assembly; send Tuesday 07:00 CT · Priority: high

## Objective

Produce and ship "Meridian Weekly" — the recurring, evidence-first nurture engine and proof of the research engine — from verified, source-linked signals. The workflow assembles the fixed 4-section email (Signal of the week · One insight · One technique · One source) plus a single P.S. CTA, runs QA, segments, schedules, and sends via Resend/SendGrid, then feeds send analytics to Euclid. Guards the targets in `04-marketing/newsletter.md`: open ≥ 45%, click ≥ 3%, unsubscribe < 0.5%, growth ≥ 20%/mo.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) |
| Cadence / time | Assembly: Fri 16:00 UTC; scheduled send: Tue 07:00 CT (aligned to LinkedIn Tue–Thu) |
| Source node | n8n Cron node (`0 16 * * 5`) → assembly; n8n Schedule Trigger on send day |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Verified signals (≥ 0.5 confidence, dated, source-linked) | WF-RS-01 output / SQLite `signals` | Sage |
| Weekly Signals Brief (if published) | WF-RS-02 output | Sage |
| Technique / magnet links (blog post, lead magnet) | `04-marketing/lead-magnets.md` + content calendar | Astra |
| Subscriber list segments | HubSpot lists (≥ 2,000 → topic-matched variants) | Astra |
| Send credentials (Resend API key / SendGrid) | `14-integrations/integration-matrix.md` | Owner (vault) |
| Issue template + brand footer | `04-marketing/newsletter.md` §6 template | Astra |

## Steps

1. **Start assembly** — Tool: n8n Cron node (Fri 16:00 UTC) · Owner: Astra → Output: issue context with `week_ending`
2. **Pull candidate signals** — Tool: Execute Query (SQLite `signals`: `status=verified`, `confidence ≥ 0.5`, last 7 days) · Owner: Sage → Output: candidate list
3. **Shortlist 1 signal + 1 source** — Tool: Code node applying filters (SMB/mid-market relevance, dated & verifiable, actionable, no hype) · Owner: Astra → Output: selected signal + source with links
4. **Draft 4 sections** — Tool: Astra agent (LLM) per `newsletter.md` §6 template (≤ 350 words total) + draft P.S. CTA · Owner: Astra → Output: `issue_draft.md`
5. **Render email HTML** — Tool: markdown → HTML render (n8n Convert/Code node), inject subject, preview (≤ 40 chars), footer, unsubscribe + postal address · Owner: Astra → Output: `issue.html`
6. **Run QA** — Tool: Webhook (outgoing) → WF-DV-04 (Norm) — checklist: every claim source-linked, ≤ 1 CTA, AI-disclosure footer, no unlinked claims, deliverability fields present · Owner: Norm → Output: `qa_verdict`
7. **Handle QA result** — Tool: Switch node: IF `pass` THEN continue; IF `return-for-fix` THEN loop to Step 4 (max 2 cycles, then escalate to COO) — owner: Norm
8. **Segment list** — Tool: HTTP Request → HubSpot contacts API (list + variant mapping; > 2,000 → topic-matched segments) · Owner: Astra → Output: send segment(s)
9. **Schedule send** — Tool: n8n Schedule Trigger (Tue 07:00 CT) + HTTP Request → Resend `/v1/emails` (batch) or SendGrid Mail Send · Owner: Astra → Output: `send_ids`, `scheduled_at`
10. **Capture engagement** — Tool: Resend/SendGrid webhooks (open, click, unsubscribe) → SQLite `email_events` · Owner: Euclid → Output: event stream
11. **Update analytics** — Tool: Execute Query → `kpi_log` (open %, click %, forward %, unsub %, MQL attribution) + refresh dashboard · Owner: Euclid → Output: metrics for Friday review
12. **Report to dashboard** — Tool: POST Ops dashboard (issue #, send stats, growth) · Owner: Astra → Output: visible newsletter KPI status

## Decision points / branching

1. IF no signal passes relevance filters THEN publish the best candidate or a "how we research" note — never pad with fluff — owner: Astra
2. IF QA `return-for-fix` THEN loop; 3rd failure → escalate to COO — owner: Norm
3. IF list > 2,000 THEN split into topic-matched variants; else single send — owner: Astra
4. IF holiday/break week THEN send "break week" notice, never ghost — owner: Astra
5. IF deliverability checks fail (SPF/DKIM, spam score) THEN fix headers and re-check before send — owner: Cog
6. IF unsubscribe rate ≥ 0.5% THEN flag list hygiene + content review — owner: Astra

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Send API failure (Resend/SendGrid) | Retry 3× backoff; fallback to secondary provider | Yes — send incomplete |
| Signal query empty | Fall back to WF-RS-02 brief; else "how we research" note | No |
| QA unavailable | Hold — never send un-QA'd newsletter | Yes |
| Bounce / hard-bounce | Suppress address, update HubSpot, log | No |
| Analytics webhook lost | Reconcile via API pull at next run | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Send not completed by Tue 09:00 CT | Email via Resend + dashboard | Astra + COO | next business day |
| Open rate < 45% or click < 3% | Weekly report to Euclid review | Astra + Euclid | 2 weeks below → COO |
| Unsubscribe ≥ 0.5% | Email via Resend | Astra + Halo | immediate list hygiene |
| Deliverability / sender reputation issue | Email via Resend | Cog + Astra | immediate → Sentinel if spoof risk |

## Success criteria

- [ ] Email sent on schedule (Tue 07:00 CT); no late or missed issue without a "break week" notice
- [ ] ≤ 350 words; every claim source-linked; exactly one CTA; AI-disclosure footer present
- [ ] QA-cleared by Norm before send (release lock enforced)
- [ ] Open ≥ 45%, click ≥ 3%, unsubscribe < 0.5%, growth ≥ 20%/mo
- [ ] Send + engagement metrics logged to `kpi_log` and dashboard refreshed

## Related

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `04-marketing/newsletter.md` · `04-marketing/email-campaigns.md` · `04-marketing/measurement.md` · `04-marketing/lead-magnets.md` · `WF-RS-01` · `WF-RS-02` · `WF-DV-04` · `14-integrations/integration-matrix.md`
