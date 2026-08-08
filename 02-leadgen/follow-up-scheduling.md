# Follow-up & Response Tracking — Meridian Research & Advisory

**Purpose:** Rules for what happens after a touch goes out: when to advance or drop a prospect, reply triage, "not now" nurture cadence, CRM task creation, response tracking via webhooks into deal-stage updates, reply SLA, and the handoff criteria to Sales (SQL definition).
**Owner:** Lead Gen Dept. **Pipeline position:** after OUTREACH SEQUENCE; before Sales.

---

## 1. Follow-up scheduling rules

### 1.1 Advance vs. drop decision matrix
Evaluate after every reply and after the day-14 terminal touch.

| State | Evidence | Action |
|---|---|---|
| **Advance (A)** | Reply with a question, scheduling intent, budget/procurement mention, or a "let's talk" | → Warm-reply follow-up (3 touches); book when possible |
| **Hold (H)** | "Not now", "timing is bad", "next quarter", positive but vague | → Monthly nurture (Section 3); schedule a re-touch |
| **Never (N)** | Explicit "not interested", unsubscribe, or no reply after full 6-touch sequence | → Suppress permanently; record outcome; recycle only on a *new* signal |
| **Drop (D)** | Bounce, invalid company, merged/closed, no ICP fit confirmed | → Remove or archive; no further sends |

- **No-reply default:** after the terminal touch with zero response → state `H` with reason `no_reply_after_sequence`, enter 90-day quiet period, then re-evaluate on new signal.
- **Never re-contact a "Never"** without a genuinely new signal and an explicit internal approval.

### 1.2 Timing rules
- Reply received → respond within the **24-hour SLA** (Section 5).
- Reply with a question → answer + follow-up touch within 24h.
- "Not now" → acknowledge warmly, offer to add to monthly insights list, then silence until the monthly cadence date.
- Warm-reply 3-touch: touch 2 at day +3, touch 3 at day +6 (see outreach-sequence-spec.md).

---

## 2. Reply handling triage

All inbound replies (email + LinkedIn) are classified on arrival (manual or via AI-assist with human confirmation):

| Triage tag | Definition | Next step |
|---|---|---|
| **interested** | Books, asks for more detail, shows budget/timeline, wants a proposal | Immediate warm follow-up; handoff path triggered |
| **question** | Asks about services, pricing, process, or our credentials | Answer within 24h SLA; then re-triage |
| **not_now** | "Busy", "later", "different priorities", "revisit in X months" | Set `not_now_until` date; monthly nurture; never chase harder |
| **never** | Explicit no, unsubscribe, negative | Suppress; log reason; optional post-exit survey link once (no re-send) |
| **spam/bounce** | OOO, wrong person, auto-reply, tech bounce | Drop; update email status; remove from sequence |

**Triage SLA:** every reply tagged within 4 business hours of arrival; unread inbox flag on the owner + CRM task created automatically.

---

## 3. "Not now" nurture (monthly cadence)

- **Cadence:** 1 email/month (fixed month-day, e.g., 1st) for up to 6 months, then pause unless a new signal appears.
- **Content:** evidence-based value only — a 3-line insight relevant to their industry/AI adoption, a relevant case-study line, or a new research finding. No pitch, no CTA beyond "reply if timely."
- **Trigger for escalation:** any reply, or a *new high-intent signal* (fresh funding, AI role open, launch) → re-enter as a fresh sequence contact.
- **Compliance:** nurture emails still carry CAN-SPAM block and opt-out; unsubscribe during nurture is permanent.

---

## 4. CRM task creation

Automation (n8n / Azure Logic Apps) creates CRM records/tasks on these events:

| Event | Created object | Fields set |
|---|---|---|
| Touch scheduled | Task per touch (6) | due date/timezone, channel, template_id, variant_id, contact, sequence_id |
| Touch sent | Activity log | sent_at, variant_id, provider message-id |
| Reply received | Task "Reply triage" + Contact activity | triage tag, received_at, channel, thread |
| Triage = not_now | Task "Nurture follow-up" | due = next monthly date, `not_now_until` |
| Triage = interested | Task "Handoff to Sales" | due = within 24h, priority = P0 |
| Opt-out / unsubscribe | Suppression record | source, date, never-send flag |
| Bounce (hard) | Suppression record | reason, date |

**Rules:** every sequence state change updates the deal stage (Section 6). Tasks auto-assign to the campaign owner; overdue SLA tasks escalate to the Lead Gen lead.

---

## 5. Response tracking & SLA

### 5.1 Tracking infrastructure
- **Open tracking:** pixel in all emails → event → CRM (note: many providers block pixels; treat open rates as directional only).
- **Click tracking:** link rewrite → event → CRM; record which CTA/token was clicked.
- **Reply tracking:** mailbox webhook (send/receive hookup on the outreach inbox, or provider webhooks for Outreach/Salesloft/Lemlist style tools) → triage classifier → CRM.
- **LinkedIn events:** connection accepted, message read, reply — via the sequence tool's integration (no manual data entry).
- **Pipeline:** all events flow through n8n/Azure Logic Apps into a single `tracking_events` store, then update the deal stage.

### 5.2 SLA (reply within 24h)
- **Rule:** any human reply to an outreach email or LinkedIn message must get a response within **24 hours** (calendar time, measured to the send timestamp of our reply).
- **Tracking:** `first_reply_at` → `our_reply_at`; breach → alert to the owner + Lead Gen lead.
- **Exceptions:** weekend buffer allowed for non-urgent `question` type; `interested` is always same-business-day.
- **Reporting:** weekly SLA compliance % must stay ≥95%; top blocker remediated immediately.

---

## 6. Deal stage updates (webhook → CRM)

Stage state machine driven by tracking events:

| Stage | Trigger event | Notes |
|---|---|---|
| `queued` | Record enters sequence | Sequence id + variant_id attached |
| `in_progress` | Touch 1 sent | count_of_touches incremented per send |
| `replied` | Any human reply (webhook) | triage tag set; warm follow-up begins |
| `engaged` | Reply = question/interested, or 2+ click-throughs | marketing-qualified (MQL) |
| `meeting_booked` | Calendar event created | owner gets handoff task |
| `sql` | Meets SQL criteria (Section 7) | Sales owner assigned; stage locked |
| `qualified_loss` | "never" / no-fit after full sequence | archived with reason |
| `nurture` | "not_now" / no-reply | monthly cadence active |

**Rules:** one stage at a time, no skips backward except to `nurture`. Every stage change writes an audit row (who/what/when) for compliance. Automated stage changes from webhooks are human-verifiable in a daily review queue.

---

## 7. Handoff criteria to Sales (SQL definition)

A prospect is a **Sales-Qualified Lead (SQL)** when ALL of the following hold:

1. **Engagement:** real human reply (triage = `interested` or substantive `question`) within 90 days, OR a booked meeting.
2. **Fit:** ICP confirmed on research record (industry, size band 10–500, region) with firmographics confidence ≥ MED.
3. **Budget:** `budget_band` not `micro` (≥$10k) OR explicit budget statement from the prospect; `budget_confidence` recorded.
4. **Authority:** ≥1 verified decision maker (title/level High-confidence) OR the replying person demonstrates purchasing influence (title or explicit statement).
5. **Timing:** prospect states or implies a timeline (or `not_now_until` has passed and they re-engage).
6. **Compliance:** record has full source/evidence provenance; opt-out or suppression not triggered.

**Handoff mechanics:**
- On SQL: owner creates deal in CRM, assigns Sales owner, attaches research record + full message thread + triage tags, sets `handoff_at`.
- SLA: Sales reaches out within 24h of handoff; Lead Gen stands by for the first reply loop.
- **Non-SQL replies** (e.g., `not_now`): stay in Lead Gen nurture; never pushed to Sales.

---

## 8. Operational checklist (weekly)

- [ ] Reply triage backlog = 0; all replies answered within 24h SLA (report ≥95%).
- [ ] "Not now" records on monthly cadence sent; `not_now_until` dates current.
- [ ] Webhook/event pipeline healthy (open/click/reply → CRM stage) — 100% event reconciliation.
- [ ] Suppression list honored; no sends to opt-outs or bounces.
- [ ] Advance/drop matrix applied to all sequences completed in the week; `no_reply` records scheduled for 90-day re-eval.
- [ ] SQL handoffs completed within 24h; Sales acknowledgment logged.
- [ ] Weekly metrics: reply rate, engagement rate, SQL count, SLA %, nurture churn — reviewed vs. A/B results.
