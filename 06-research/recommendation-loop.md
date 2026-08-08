# Recommendation Loop

> Version 1.0 · Owned by COO (with Sage as engine) · The closed loop that converts verified research signals into owned actions, routes them to the right department, tracks them to completion, and feeds outcomes back into the improvement engine.

## 1. The loop at a glance

```
Signal → triage (signal-catalog.md §5) → recommendation drafted
→ routed to owner → owner decides (accept / amend / decline)
→ action tracked in CRM/kanban → outcome logged
→ outcome feeds improvement engine → monitoring adjusts (sources, thresholds, weights)
```

Closed loop means **no verified insight dies silently**: every routed recommendation is accepted, amended, declined-with-reason, or escalated.

## 2. Recommendation types

| Type | Question it answers | Default owner | Example |
|---|---|---|---|
| **Build/Buy/Partner** | Do we make, acquire, or ally? | COO | Agentic MCP router: build vs buy vs use n8n plugin |
| **Go / No-Go** | Proceed with project/engagement/entry? | COO + CEO | Enter fintech vertical? Snapshot signals → go/no-go |
| **Content topic** | What should we publish? | Marketing | Vertical Snapshot on embedded AI ops → blog series |
| **Sales play** | How do we win this deal/segment? | Sales | Competitor dropped price 20% → counter-play card |
| **Client advisory** | Which client gets a proactive warning? | Client Success | New AI Act obligation affecting client vertical |
| **Compliance action** | What must we change to stay legal? | Compliance | API sunset with data-retention implications |
| **Tool adoption** | Which OSS/automation do we run? | Engineering | Adopt `mcp-proxy` (1-day effort) |
| **Source/feed change** | Is the monitoring itself failing? | Sage | Domain < 3 healthy sources → swap feeds |

## 3. Drafting the recommendation

Every recommendation is a structured record (stored in the action tracker):

| Field | Required | Example |
|---|---|---|
| `signal_ids` | yes | `[uuid-1, uuid-2]` (evidence chain) |
| `type` | yes | `sales_play` |
| `title` | yes | "Counter competitor price cut with ROI calculator" |
| `rationale` | yes | 2–3 sentences citing signals + confidence |
| `options` | yes | 2+ viable options with pros/cons (for build/buy/partner) |
| `owner` | yes | Default from table §2 |
| `due` | yes | Date |
| `confidence` | yes | From signal scoring |
| `impact_estimate` | optional | $ or time or wins affected |

**Quality bar:** never recommend from a single unverified source; never recommend a build without a buy option listed. Drafted by Sage, approved-by-default at triage unless escalated.

## 4. Routing to owners

| Owner (dept) | Receives | Channel | SLA |
|---|---|---|---|
| COO (`02-coo.md`) | build/buy/partner, go/no-go, cross-domain | Slack `#strategy` + COO board | 48h |
| CEO (`01-ceo.md`) | go/no-go on large commitments, M&A | Slack + decision log | 1 week |
| Marketing (`04-marketing.md`) | content topics, vertical snapshots | Slack `#marketing` + content calendar | 48h |
| Sales (`05-sales.md`) | sales plays, competitive intel | Slack `#sales` + CRM tasks | 24h |
| Compliance (`15-compliance.md`) | policy actions, client advisory | Slack `#compliance` | 48h |
| Engineering (`17-engineering.md`) | tool adoption, deprecation risk | Slack `#engineering` + backlog | 1 week |
| Client Success (`09-client-success.md`) | client advisory calls | CRM + client workspace | 48h |
| Automation (`16-automation.md`) | n8n/agent pipeline changes | Automation kanban | 1 week |

**Routing rules:** one owner per recommendation (no duplicate owners); if cross-department, primary owner listed and secondary notified. Priority tag `P1` (regulatory/security) bypasses normal queue → immediate escalation path.

## 5. Decision & tracking

1. Owner opens recommendation → picks **Accept / Amend / Decline**.
2. **Accept** → action created in tracker (CRM tasks / project board) with due date and owner.
3. **Amend** → owner edits options/timing, records reason, re-routes.
4. **Decline** → reason required; logged to decision-log (`00-company/decision-log.md`); marked `declined_with_reason` (not dead — can be re-proposed at next cycle).
5. **Tracking:** statuses `drafted → routed → accepted → in_progress → done | declined | expired`. Weekly review in the Monday ops standup.
6. **Completion:** done = outcome recorded (deploy, published piece, call booked, compliance change shipped).

**KPIs tracked per month:** recommendations routed ≥ 20; acceptance rate; on-time completion; declined-with-reason rate; revenue-attributed actions.

## 6. Feedback to the improvement engine

Outcomes feed back so the system gets smarter (loop closes):

| Feedback | What improves |
|---|---|
| Accepted actions that produced wins | **Weight signals** of that type/domain higher (source weights, impact score) |
| Declined/irrelevant recommendations | **Retune triage thresholds**; recalibrate confidence floors |
| Sources producing junk | Downgrade priority or drop source (monitoring-sources.md health rules) |
| Missed signals (client asked, we had nothing) | **Add source / topic** to monitoring; gap logged as `coverage_gap` |
| Wrong predictions (signal said X, market did Y) | **Confidence recalibration** + decision-log retrospective |
| Client feedback on reports | **Report template tweaks**; QA gate adjustments |

Mechanism: `13-improvement/` monthly retro reviews the loop metrics and applies the table above; changes are versioned in this doc's changelog.

## 7. Escalation paths

- **P1 (harm/legal/security):** immediate Slack DM to COO + Compliance; no waiting for weekly cycle; logged as `escalated` in signal status.
- **Client-affecting:** same-day notification to Client Success + Sales; Client Intelligence Brief can be emitted early.
- **Stale owner (no response by SLA):** auto-escalate to next level owner, then COO, then CEO.

## 8. Related

`signal-catalog.md` · `report-types.md` · `monitoring-sources.md` · `01-departments/02-coo.md` · `00-company/decision-log.md` · `13-improvement/`
