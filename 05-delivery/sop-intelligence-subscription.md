# SOP — Intelligence Subscription

> Version 1.0 · Owner: Dispatch (Delivery Ops) + Halo (Client Success) · Applies to: Intelligence Subscription ($1.5–5k/mo, rolling)

## Purpose

Operate an always-on competitive & market intelligence service: continuous monitoring of the client's competitive set, market dynamics, AI-relevant signals, and buyer behavior, delivered as a live dashboard, a weekly source-linked brief, a quarterly deep-dive, and a real-time alert feed. This is the flagship recurring product; renewals and expansion are engineered from day 1 (attach at report/sprint delivery, day-45 renewal opener, usage-based upsell triggers).

## Operating cadence

- **Daily** — Sage + Cog: signal scans, dedup, tagging, indexing; alert evaluation; dashboard refresh.
- **Weekly** — Sage: Weekly Brief production and delivery (contracted cadence day, default Monday 08:00).
- **Monthly** — Halo: CSAT pulse, value review call, config health check.
- **Quarterly** — Sage + Kepler: Deep-Dive, config re-scope, renewal touchpoint, NPS, archive.
- **On trigger** — Cog: real-time alerts per configured thresholds.

## Trigger

- Signed MSA + subscription order; first-month invoice issued by Tally (charged at period start; annual prepay discounted per pricing policy).
- Attach or upsell path identified (e.g., from a completed Sprint or Custom Research report).
- Client confirmed kickoff slot within 5 business days; time-to-first-value ≤ 14 days.

## Prerequisites

- Signed subscription agreement; Legal Gate closed by Amicus; payment setup verified by Tally.
- Workspace created by Dispatch: `MRA-<client>-intelligence-<YYYYMMDD>` with folders (`00-config/`, `10-signals/`, `20-briefs/`, `30-dashboard/`, `40-qa/`, `50-delivery/`), client portal, and dashboard hosting.
- Subscription config locked by Kepler at kickoff: competitive set (3–10 competitors), industry/vertical scopes, geographies, signal categories, alert thresholds, and recipient list.
- Source access provisioned: paid/newswires, funding/job/filing feeds, CRM data per agreement. Access rights confirmed by Sentinel.
- Alert preferences (channels, frequency, quiet hours) captured from the client.
- Monitor taxonomy, dedup rules, and relevance scoring weights loaded by Sage; ingestion automations registered by Cog.

## Steps

1. **Kickoff call** — Kepler + Halo. Confirm competitive set, scope, alert preferences, dashboard viewers, and success metrics (what decisions the brief should inform). Log config to workspace `00-config/` and CRM. *Outcome: config signed off by client contact.*
   - Walk the client through a sample weekly brief so expectations on depth and tone are set.
2. **Monitor configuration** — Dispatch + Sage. Build the monitor: sources, keywords, competitor entities, signal taxonomy, dedup rules, and scoring weights. Register scheduled ingestions in the automation layer (n8n/Azure Logic Apps). *Gate: monitor test run returns ≥ 30 relevant signals/day without duplicates before go-live.*
   - Competitor entities encoded (parent/child, aliases, product lines) to avoid mismatches.
   - Test window: 3 consecutive daily runs pass before the first client-facing week.
3. **Continuous monitoring (daily)** — Sage + Cog. Run scheduled signal scans across news, funding, job postings, product launches, executive moves, regulatory changes, and competitor filings. Deduplicate, tag by taxonomy, score by relevance, and index to the vector store. *Gate: signal quality check — false-positive rate ≤ 10% per weekly sample.*
   - Failed ingestion runs auto-retry; persistent failure pages Cog and escalates to Dispatch.
   - Signals logged with source URL, date, taxonomy tags, and confidence score.
4. **Alert triggers (real-time)** — Cog. Compare scored signals against the client's alert thresholds (e.g., competitor funding > $10M, product launch, price change, leadership change). Dispatch alerts on the agreed channel within the agreed SLA (default: 4 business hours). Log alert history to the dashboard. *Gate: alert delivery SLA compliance tracked; missed alerts logged and escalated.*
   - Quiet hours respected; urgent-only exceptions defined in config.
5. **Weekly brief production** — Sage. Assemble the Weekly Brief (target 2–4 pages): headline moves, competitive set changes, market signals, AI-relevant developments, and implications for the client. Every claim source-linked (URL + date + confidence). Draft from templated generator, then review by Sage for coherence and implication quality. *Output: Weekly Brief draft.*
   - Structure fixed: This week's moves → Signals by category → Implications → Watchlist.
   - Each implication states what it means for the client and a suggested action.
6. **Weekly brief QA** — Norm. Run the brief QA checklist: source verification for every claim, citation accuracy, scope adherence, brand voice, formatting, and internal consistency with prior weeks. *Gate: no client-facing send before Norm approval.*
   - Weekly sample audit samples 10% of signals for false positives (feeds the signal-quality KPI).
7. **Weekly brief delivery** — Dispatch + Halo. Send the brief on the contracted cadence day (default Monday 08:00 client time) via email + portal; dashboard refreshed with the week's signals. Log send, open, and click-through. *Gate: delivery logged in CRM with engagement metrics.*
   - Dispatch verifies delivery; any failed send retried within 1 business hour.
8. **Dashboard upkeep** — Dispatch + Forge. Keep the live dashboard current: refresh data nightly, verify widget health, monitor uptime (target ≥ 99%), and log viewer analytics. Escalate hosting failures per ops runbook. *Gate: dashboard uptime and data freshness monitored weekly.*
9. **Quarterly deep-dive** — Sage + Kepler. Produce the Quarterly Deep-Dive (8–12 pages): competitive landscape shifts, market sizing updates, theme analysis, signal backlog synthesis, and recommended actions. Includes a config re-scope conversation with the client (competitors to add/retire). *Gate: full research QA checklist via `sop-custom-research.md` deep-dive rules.*
   - Deep-dive scheduled in the same week as the renewal touchpoint to maximize value visibility.
10. **Renewal & expansion touchpoints** — Halo. Day-45 renewal opener (draft email + proposal from account record); monthly value review call; alert-feed engagement nudges for low-usage accounts; upsell triggers (usage spikes, expansion questions) handed to Vector. Per `03-sales/renewal-playbook.md` and `03-sales/upsell-playbook.md`. *Gate: renewal conversation logged; churn-risk score refreshed.*
11. **Feedback capture** — Halo. Monthly CSAT pulse on brief value; quarterly NPS. Capture qualitative feedback and adoption blockers; log lessons to Mnemos; route improvement items to Norm. *Gate: feedback recorded before month close.*
12. **Rolling archive** — Mnemos + Dispatch. Archive each quarter's deliverables and signals; preserve source ledger; keep running history in the vector store for retrieval and the next deep-dive. *Gate: archive checklist complete per quarter.*
13. **Offboarding (if cancelled)** — Halo + Dispatch. 30-day wind-down: final brief, dashboard export, access revocation (Sentinel), final invoice reconciliation (Tally). Churn triggers root-cause review within 24h. *Gate: offboarding checklist complete; access fully revoked.*

## Deliverables

1. **Live dashboard** — always-on view of competitors, market signals, alert history, and the client's configured watchlist.
2. **Weekly Brief** — source-linked, decision-oriented, delivered on the contracted cadence.
3. **Quarterly Deep-Dive** — synthesis and recommendations with config re-scope.
4. **Alert feed** — real-time threshold-triggered notifications on the agreed channel.

**Signal taxonomy** (Sage): funding, product launch, pricing/positioning change, executive move, hiring, regulatory, partnership, financial results, buyer behavior. Every signal tagged to at least one category and one competitor/entity.

**Brief structure** (fixed): This week's moves → Signals by category → Implications → Watchlist. Each implication states what it means for the client and a suggested action.

**QA checklist** (Norm): every claim source-linked (URL + date + confidence); competitor facts verified against primary sources; scope adherence vs. config; no hallucinated events; consistent tone and structure across weeks; dashboard data matches the signal log; AI-assisted + human-reviewed disclosure present.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| On-time delivery | Weekly briefs sent on cadence day | ≥ 95% |
| QA first-pass rate | Briefs passing QA gate first try | ≥ 90% |
| CSAT | Monthly pulse (1–5) | ≥ 4.5 |
| Alert SLA | Alerts within agreed window ÷ alerts sent | ≥ 95% |
| Signal quality | False-positive signals ÷ total signals | ≤ 10% |
| Renewal rate | Paid renewals ÷ renewals due | ≥ 92% |
| Churn | Canceled subscription revenue ÷ total | ≤ 5%/mo |
| Dashboard uptime | Successful dashboard availability | ≥ 99% |
| Time-to-first-value | Sign → first weekly brief | ≤ 14 days |

## Escalation

- Missed brief cadence or alert SLA → Dispatch → COO (Cadence) within 24h; client notified per comms policy.
- Scope creep (new competitors/geographies requested mid-term) → Kepler config change control; price change requires COO + Vector; contract amendment requires Amicus + Owner.
- Data source failure (feed down, provider degraded) → Sage + Cog reroute; escalate to COO if delivery date at risk.
- Client risk (low adoption, missed payments, churn signal) → Halo escalates to COO within 24h.
- Content legal/liability risk in a brief → Amicus review before send.

## Related

`00-company/services.md` · `00-company/pricing.md` · `05-delivery/delivery-system.md` · `05-delivery/project-lifecycle.md` · `05-delivery/sop-custom-research.md` · `03-sales/renewal-playbook.md` · `03-sales/upsell-playbook.md` · `01-departments/03-research.md` · `01-departments/09-client-success.md` · `01-departments/11-delivery-ops.md`
