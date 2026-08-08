# WF-RS-02 — Weekly Signals Brief

> Version 1.0 · Owner: Sage (Research) · Schedule/Trigger: Cron — Friday 10:00 UTC · Priority: high

## Objective

Turn the week's verified signal stream into one evidence-first, source-linked brief that routes the right signals to the right decision-makers before the weekend. The workflow aggregates WF-RS-01 verified signals, classifies them by monitoring domain, ranks them by confidence × recency × relevance, drafts a brief with an `action_recommended` per signal, runs QA, and routes to CEO/COO (and department heads where relevant) while queuing the strongest content candidate for the newsletter (WF-MK-02). This is the connective tissue between the research engine and decisions/revenue.

## Trigger

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) |
| Cadence / time | Friday 10:00 UTC (before WF-MK-02 assembly at 16:00 UTC) |
| Source node | n8n Cron node (`0 10 * * 5`) |

## Inputs

| Input | Source | Provisioned by |
|---|---|---|
| Verified signals from the past 7 days | WF-RS-01 output / SQLite `signals` (`status=verified`, `confidence ≥ 0.5`) | Sage |
| Triage routing rules (domain → owner) | `06-research/signal-catalog.md` §5 | Sage |
| Monitoring domains + tags | `06-research/monitoring-sources.md` | Sage |
| Report format + QA checklist | `06-research/report-types.md` + `12-quality/` | Norm |
| Recipient routing (CEO/COO + dept heads) | `17-ops/agents/ROSTER.md` | Cadence |
| Newsletter candidate queue | `04-marketing/newsletter.md` §4 | Astra |

## Steps

1. **Start brief run** — Tool: n8n Cron node (Fri 10:00 UTC) · Owner: Sage → Output: brief context with `week_ending`
2. **Aggregate verified signals** — Tool: Execute Query (SQLite `signals`: `status=verified`, `confidence ≥ 0.5`, `date` in last 7 days) · Owner: Sage → Output: signal set
3. **Classify by domain** — Tool: Code node mapping signal `type` → domain (AI, technology, policy, funding, markets, competition, industry trends, open-source, customer problems) per signal catalog §2 · Owner: Sage → Output: domain-grouped signals
4. **Dedupe + rank** — Tool: Code node scoring each signal by `confidence × recency × relevance` (dedupe near-identical claims, keep primary source) · Owner: Sage → Output: ranked shortlist
5. **Check escalation triggers** — Tool: IF any signal is `blocked/harm` or direct-client-impact THEN route to Compliance/COO or client owner same-day (bypasses brief) — owner: Sage
6. **Draft brief** — Tool: Sage agent (LLM) composing evidence-first brief: per-signal subject, claim, source-link, date, confidence, and `action_recommended` · Owner: Sage → Output: `brief_draft.md`
7. **Run QA** — Tool: Webhook (outgoing) → WF-DV-04 (Norm) — accuracy + source verification + no overclaim · Owner: Norm → Output: `qa_verdict`
8. **Handle QA result** — Tool: Switch node: IF `pass` THEN continue; IF `return-for-fix` THEN loop to Step 6 with findings (max 2 cycles) — owner: Norm
9. **Route to recipients** — Tool: HTTP Request → Resend (email) or Slack/Discord webhook: CEO (Zenith) + COO (Cadence) + relevant department heads; include per-domain action items · Owner: Sage → Output: delivered brief
10. **Queue newsletter candidate** — Tool: Write top content-worthy signal (≥ 0.7 confidence) + source to WF-MK-02 candidate queue · Owner: Sage → Output: newsletter intake row
11. **Update signal records** — Tool: Execute Query (SQLite: set `related_reports` + brief ID on consumed signals) · Owner: Sage → Output: traceable signal→brief lineage
12. **Archive + log** — Tool: Write brief to `11-knowledge/` (wikilinked, no orphans) + Execute Query (`kpi_log`: signals in/out, brief ID, routing) · Owner: Sage → Output: archive + metrics

## Decision points / branching

1. IF signal is `blocked/harm` (security, legal, reputational) THEN escalate to Compliance + COO within 24h, exclude from brief — owner: Sage
2. IF signal has direct client impact THEN route to client owner + Sales same day (Client Intelligence Brief candidate) — owner: Sage
3. IF confidence ≥ 0.7 AND content-worthy THEN queue to Marketing newsletter — owner: Sage
4. IF competitive movement THEN route to Sales + COO (Competitive Watch candidate) — owner: Sage
5. IF policy change THEN route to Compliance + COO (Policy Watch candidate) — owner: Sage
6. IF QA fails 2× THEN escalate brief to COO before Friday EOD — owner: Norm

## Error handling & retries

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| Signal query fails | Retry 3× backoff; else fall back to prior-day cached snapshot | No |
| QA unavailable | Hold — never route un-QA'd brief to CEO/COO | Yes |
| Email/webhook delivery fails | Retry; then POST to Ops dashboard + alert Dispatch | No — brief visible in dashboard |
| No signals in the week | Publish a short "quiet week" note (no padding) | No |
| Duplicate brief run | Upsert on `week_ending` (idempotent) | No |

## Alerts & escalation

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| Blocked/harm signal detected | Email via Resend + Security channel | Compliance + COO | within 24h (fixed SLA) |
| Brief not delivered by Friday EOD | Email via Resend + dashboard | COO | next business day |
| QA fail 2× on brief | Email via Resend | COO + Sage | systemic → CEO |
| Signal intake halted (WF-RS-01 down) | n8n alert → Slack/Discord | Cog + Sage | > 2 runs → COO |

## Success criteria

- [ ] Brief delivered Friday before EOD to CEO + COO + relevant department heads
- [ ] Every signal source-linked, confidence-stamped, and carrying an `action_recommended`
- [ ] Signals classified by domain and routed per triage rules; blocked/harm escalated within 24h SLA
- [ ] Top content-worthy signal queued to WF-MK-02; consumed signals updated with `related_reports`
- [ ] Brief archived to `11-knowledge/`; metrics logged to `kpi_log`

## Related

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `06-research/signal-catalog.md` · `06-research/monitoring-sources.md` · `06-research/report-types.md` · `06-research/recommendation-loop.md` · `WF-RS-01` · `WF-MK-02` · `WF-DV-04`
