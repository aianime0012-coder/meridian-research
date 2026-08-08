# Measurement Framework — Meridian Research & Advisory

> Version 1.0 · Owned by Euclid (Ops/Analytics) · Mirrors `marketing-system.md` KPIs; feeds `15-dashboards/`.

## 1. North-star & KPI definitions (match marketing-system.md)

| KPI | Definition (exact) | Target | Frequency |
|---|---|---|---|
| Organic sessions/mo | GA4 sessions with default channel "Organic Search" | ≥5,000 by Y3 | Monthly |
| MQLs/mo | Contacts scoring ≥40 (see `16-crm/lead-scoring.md`) who opted in, are in-market | ≥40 | Monthly |
| MQL→SQL | SQL = MQL that books/intends a discovery call, within 90 days | ≥30% | Monthly |
| Newsletter open rate | Unique opens / delivered, per send, trailing 4 weeks | ≥45% | Weekly |
| List growth | Net new subscribed / subscribers at period start | ≥20%/mo | Monthly |
| Webinar→MQL | MQLs from webinar pool / total webinar attendees (live ≥45 min or replay+deck) | ≥25% | Monthly |
| Content→signup | Form conversions / unique landing-page visitors (gated assets) | ≥2% | Monthly |
| Cost per MQL (paid) | Paid spend / paid-attributed MQLs | ≤$25 | Monthly |

### Lead definitions (shared with `03-sales/`)

| Stage | Definition | Source |
|---|---|---|
| MQL | Score ≥40, opted-in, matched ICP (10–500 employees, priority vertical) | Scoring model |
| SQL | MQL with booked discovery call or explicit request for proposal | Sales + form data |
| Opportunity | SQL with defined need + budget signal | CRM |

### Magnet-specific targets (see `lead-magnets/`)

| Magnet | Downloads/mo | Form→MQL | Source in CRM |
|---|---|---|---|
| AI Readiness Scorecard | ≥150 | ≥25% | `source=ai_readiness_scorecard` |
| Vendor Evaluation Toolkit | ≥120 | ≥20% | `source=vendor_toolkit` |
| (future) CI sample / Benchmark | ≥100 | ≥15% | per magnet |

## 2. Channel dashboards

| Channel | Primary metrics | Secondary | Tool |
|---|---|---|---|
| SEO | Organic sessions, keyword positions, backlinks, CTR | Top landing pages, content→signup | GA4 + GSC |
| LinkedIn | Impressions, engagement rate, profile visits, follows | Inbound messages, link clicks | LinkedIn Analytics |
| X | Impressions, engagement, link clicks | Follower growth | X Analytics |
| Email | Opens, clicks, unsubs, bounces | Sequence conversion, spam rate | ESP |
| Webinar | Regs, attendance, stay-time, replay | Webinar→MQL | Zoom/YouTube + CRM |
| Magnets | Downloads, form conversion | Magnet→MQL | GA4 + CRM |
| Paid (if used) | Spend, CPA, CPC, conversion rate | Ad CTR, quality score | Ad platform |

**Dashboard rule:** every dashboard answers one question ("are we hitting the
monthly target?") and shows trend (4/13-week), not just snapshots.

## 3. Attribution model

- **Default: first-touch + last-touch recorded on every contact** (from first
  channel that drove the visit → channel that converted).
- First touch = acquisition channel of the initial session; last touch = channel
  of the conversion/form.
- UTM discipline: every outbound link (social, email, webinar, partner) carries
  `utm_source/medium/campaign`. No exceptions.
- **Scoring note:** MQL credit = first touch (acquisition) + last touch
  (conversion); SQL credit = last touch only; won-deal credit = both, weighted 40/60.
- No paid attribution tool required at Y1 scale; UTM + GA4 + CRM IDs suffice.
- Offline/source handoffs (referrals) recorded manually as "direct/referral" tags in CRM.

## 4. Funnel & conversion tracking

```
Sessions → Unique visitors → Page/CV → Magnet/signup → MQL → SQL → Opportunity → Won
   (GA4)      (GA4)        (GA4)      (forms+CRM)    (score)  (call)    (CRM)      (CRM)
```

| Funnel step | Formula | Target |
|---|---|---|
| Session→signup | signups / sessions | ≥1% |
| Page/CV→signup | signups / landing visitors | ≥15% |
| Signup→MQL | MQLs / signups (30d) | ≥15% |
| MQL→SQL | SQLs / MQLs (90d) | ≥30% |
| SQL→Opportunity | Opps / SQLs | ≥50% |
| Opportunity→Won | Won / Opps | ≥30% |
| CAC payback | LTV / CAC | ≥3x |

Weekly refresh of the funnel; monthly MQL→SQL deep-dive with Vector.

## 5. Weekly review ritual (Fridays, 30 min)

1. **Dashboard scan** — Euclid pulls: sessions, signups, MQLs, email metrics, webinar regs vs targets.
2. **Anomalies** — any metric ±20% vs 4-week trend → root cause in 2 min (e.g., a viral post, a deliverability dip, a schema error).
3. **Experiment log** — check open experiments; kill or continue (see §7).
4. **Calendar check** — content due next week has owners + assets.
5. **One decision** — one change this week (test, reallocate, or cut).

## 6. Monthly review ritual (1st working day, 60 min)

1. **KPI scorecard** — fill table in §1; red/green vs target.
2. **Channel ROI** — cost (if paid) + effort (hours) per MQL per channel; reallocate.
3. **Funnel deep-dive** — biggest drop-off step; one fix for next month.
4. **Content performance** — top/bottom 3 pieces; update calendar.
5. **MQL→SQL handoff quality** — Vector reviews lead quality; adjust scoring.
6. **Attribution check** — validate UTM coverage ≥95% of form sessions.
7. **Write retrospective** → `13-improvement/` + notify owner.

## 7. Experiment log

Format (append in `13-improvement/experiment-log.md`):

```
ID: EXP-014
Hypothesis: [X change] will [effect] because [reason]
Channel: [SEO/email/LinkedIn/webinar/magnet]
Started: [date] · Sample size: [n] · Duration: [30d]
Result: [metric before → after]
Decision: keep / iterate / kill
Owner: [agent] · Learned: [one line]
```

Rules: one experiment per channel at a time; run ≥30 days or ≥statistically
meaningful n (use free A/B tools); log every test, even failures; review the
log weekly in §5.

## 8. Reporting cadence & stakeholders

| Report | Cadence | To |
|---|---|---|
| Weekly KPI dashboards | Weekly | Astra, Euclid |
| Monthly KPI scorecard | Monthly | Owner, all agents |
| Channel deep-dives (per underperforming channel) | Monthly | Astra + owner |
| Quarterly strategy review (vs plan) | Quarterly | Owner |
| Compliance/consent audit (marketing data) | Quarterly | Owner (via `10-legal/`) |

## 9. Guardrails

- Numbers are pulled from source tools (GA4/ESP/CRM) — no manual re-typing of figures into reports.
- Every report names its date range and tool version.
- No vanity metrics in decision-making (reach ≠ revenue; follows ≠ MQLs).
- If a metric misses target 2 months straight: change tactic or target — never both at once.

## Related

`marketing-system.md` · `seo-strategy.md` · `email-campaigns.md` · `newsletter.md` · `webinars.md` · `case-studies.md` · `15-dashboards/` · `16-crm/` · `13-improvement/`
