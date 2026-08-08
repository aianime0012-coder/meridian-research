# WF-<GRP>-<NN> — <Runbook Name>

> Version 1.0 · Owner: <owner agent> · Schedule/Trigger: <trigger> · Priority: <rev-relevant|high|normal>

## Objective
Write one paragraph: what this workflow produces and why it exists. State the measurable business outcome
(e.g. "a candidates table ready for scoring", "a QA-cleared proposal sent to a client"). Anchor to the
relevant KPI from the owner's department blueprint — the runbook exists to move that number, so say so.
> Guidance: if it has no measurable outcome, it does not belong in the catalog. Every runbook answers:
> "What did this produce, and what does that do for the company?"

## Trigger
Describe how the run starts. Be exact — the implementation (n8n/Azure Logic Apps) will copy this verbatim.

| Field | Value |
|---|---|
| Trigger type | Schedule (cron) · Event (webhook) · Manual run |
| Cadence / time | e.g. Daily 02:00 UTC / On deal-stage change / On demand |
| Source node | n8n Cron node · n8n Webhook node · HubSpot workflow trigger · Logic Apps recurrence |

> Guidance: scheduled runs belong in `17-ops/schedules/cron-schedule.md`. Event runs must name the emitting
> system (HubSpot stage change, Stripe webhook, n8n workflow success). Manual runs list who may launch them.

## Inputs
List every input the workflow consumes. One row per input: name, source, and who must provision it.

| Input | Source | Provisioned by |
|---|---|---|
| e.g. Candidates staging table | SQLite (`16-crm/schema.sql`) | Forge |
| e.g. Crunchbase API key | `14-integrations/integration-matrix.md` | Owner (vault: Bitwarden) |
| e.g. Deal record JSON | HubSpot API (HTTP Request node) | Owner account |

> Guidance: every external integration must already exist in `14-integrations/integration-matrix.md`.
> Credentials live in the company vault, never in git or `.env`. If the account isn't connected yet, the
> runbook must state that the run is BLOCKED pending owner provisioning.

## Steps
Numbered 1..n in execution order. Each step MUST carry three things: the action, the tool/API node that
performs it, and the owner. Include the expected output so a reader can verify each step ran.

1. **<Action verb + object>** — Tool: `<n8n node / API + endpoint>` · Owner: `<agent>` → Output: `<artifact>`
2. **<Action verb + object>** — Tool: `<n8n node / API + endpoint>` · Owner: `<agent>` → Output: `<artifact>`
3. …continue…

> Guidance: be specific — `HTTP Request → GET https://api.crunchbase.com/v4.0/entities/organizations` beats
> "pull Crunchbase". n8n nodes: HTTP Request, Webhook, Cron, RSS Feed, Execute Query (SQLite), Code, IF,
> Error Trigger, Send Email, Webhook (outgoing). Logic Apps: HTTP connector, SQL connector, Recurrence,
> Service Bus. The step that produces the deliverable is the step whose output feeds the next workflow.

## Decision points / branching
Numbered if/then branches. Each branch: the condition, the path taken, and who owns the decision. Be explicit
about hard gates (QA pass/fail, tier thresholds, data-quality floors) — branches are where quality leaks.

1. IF `<condition>` THEN `<path A>` ELSE `<path B>` — owner: `<agent>`
2. IF `<data-quality check fails>` THEN `<quarantine record, do not continue>` ELSE `<proceed>` — owner: `<agent>`

> Guidance: use the n8n IF / Switch nodes to mirror this section. Never branch silently; every branch must be
> logged so the retro (WF-OP-01) can see why records took one path over another.

## Error handling & retries
Default policy unless overridden here: retry 3× with exponential backoff; every run is idempotent (safe to
re-run); poison records go to a DLQ / error table, they do NOT block the batch. State per step what is
skipped vs. what blocks the whole run.

| Step / failure | Behavior | Blocks run? |
|---|---|---|
| e.g. Crunchbase 429 rate-limit | Back off, retry ≤3×, then skip source | No — other sources continue |
| e.g. Record fails normalization | Route to `errors` table with reason | No |
| e.g. Downstream webhook down | Buffer and replay after 30 min | Yes — retry then alert |

> Guidance: revenue-critical workflows (WF-FN-*, WF-DV-*, WF-SL-*) must block-and-alert, never silently drop.
> Everything else degrades gracefully: finish what you can, report what you couldn't.

## Alerts & escalation
Who gets notified, on what condition, via which channel. Follow the escalation ladder in
`17-ops/agents/ROSTER.md`: routine → department head → COO (Cadence) → CEO (Zenith) → Owner (only legally
binding / entity / financial acts). Human-in-the-loop only at legal and financial gates.

| Condition | Alert channel | Recipient | Escalate after |
|---|---|---|---|
| e.g. Source pull fails 3× | n8n alert → Slack/Discord webhook | Cog + Dispatch | > 2 failures → COO |
| e.g. QA gate fails 2× on same deliverable | Email via Resend | COO + owner dept | systemic → CEO |

> Guidance: every workflow reports success/failure to the Ops dashboard and `kpi_log`. Alert thresholds must
> be low-noise — alert on SLA breach, not on routine retries. Uptime target ≥ 99% for revenue-critical runs.

## Success criteria
A checklist of measurable outcomes. Every run reports pass/fail against these to the Ops dashboard and logs
the result to `kpi_log`. If a criterion cannot be checked automatically, say who checks it and when.

- [ ] e.g. Candidates table updated; pull manifest logged with per-source counts
- [ ] e.g. ≥ 95% of new records carry `evidence_url` + `evidence_date`
- [ ] e.g. Run completes within SLA window; success/failure reported to dashboard
- [ ] e.g. KPI snapshot written to `kpi_log`

## Related
Backlinks to the rest of the system: catalog row, cron entry, sibling workflows, playbooks, schemas,
integration matrix, department blueprint. Always link the source documents this runbook reads/writes.

`07-automation/workflow-catalog.md` · `17-ops/schedules/cron-schedule.md` · `14-integrations/integration-matrix.md` · `<sibling WF-IDs>` · `<playbooks/schemas>`
