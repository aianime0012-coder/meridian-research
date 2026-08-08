# SOP — Data & Insight Products

> Version 1.0 · Owner: Forge (Engineering) + Dispatch (Delivery Ops) · Applies to: Data & Insight Products ($200–2k/mo or one-time $500–5k)

## Purpose

Produce and operate productized data assets: datasets, industry snapshots, market signal feeds, and benchmarks (e.g., AI Adoption Benchmark, Vertical Snapshots, Signal Feed API/CSV). Products are engineered once and delivered repeatedly — data hygiene, refresh cadence, and licensing discipline are non-negotiable for trust and compliance.

## Product tiers

- **Entry** ($200/mo): single-dataset snapshot or basic signal feed, monthly refresh, portal delivery.
- **Standard** ($800/mo): snapshot + benchmark metrics, weekly refresh, portal + CSV.
- **Premium** ($2,000/mo): multiple datasets / vertical snapshots, nightly refresh, API access, support SLA.
- **One-time licenses** ($500–5k): snapshot or dataset sold once with a defined license term and no refresh guarantee unless stated.
- Tier and cadence are part of the signed order; any change runs change control via Dispatch + Amicus.

## Trigger

- Product order via signed license/order form; recurring invoices charged at period start (Tally); one-time licenses invoiced Net-15.
- Internal product build triggered by Product backlog (Forge) or client-custom configuration.
- Subscription version triggered by cross-sell to research-heavy accounts (upsell ladder).

## Prerequisites

- Signed license/order agreement; Legal Gate closed by Amicus (data licensing, IP, usage terms); payment verified by Tally.
- Workspace created by Dispatch: `MRA-<client>-data-<YYYYMMDD>` (client-specific) or standard product workspace (non-client products).
- Data source licenses confirmed: every source has documented usage rights covering the client's intended use. Cleared by Amicus + Sentinel.
- Product spec locked by Forge: schema, refresh cadence, delivery format (API/CSV/portal), SLA, and support level.
- Data hygiene standard loaded: schema validation, dedup, PII handling, versioning, provenance log.

## Steps

1. **Order & config intake** — Dispatch + Halo. Confirm product SKU, tier, delivery format, refresh cadence, and recipient/endpoint. Log order to CRM + billing (Tally). *Outcome: order record complete; invoice issued.*
   - Config file holds: schema version, cadence, delivery channel, endpoint/recipient, and support level.
2. **Data source setup** — Forge. Configure source connectors (APIs, scrapers, feeds), credentials (Sentinel-managed), and ingestion jobs in the automation layer. Log provenance: source, URL, license, access date. *Gate: every source has a documented license + provenance entry.*
   - Connector health monitored; dead webhooks auto-detected and re-registered.
3. **Schema & pipeline build** — Forge. Build/configure the data pipeline: ingestion → validation → dedup → normalization → enrichment → output (API/CSV/portal). Version the schema. *Gate: pipeline test run passes validation on ≥ 1,000 rows.*
4. **Data hygiene pass** — Forge + Euclid. Run hygiene checks: schema conformance, duplicate detection, missing-value flags, outlier screening, PII redaction, and temporal consistency. Fix or document exceptions. *Gate: hygiene scorecard ≥ 95% before any delivery.*
   - Exceptions documented in a known-issues file shipped with the dataset.
5. **Refresh execution (per cadence)** — Cog. Execute scheduled refreshes (nightly, weekly, or quarterly per product spec). Verify row counts, freshness, and validation on each run; alert on failures. *Gate: refresh success rate and freshness monitored; failures auto-retry then escalate.*
   - Refresh logs recorded with timestamp, row delta, and validation results.
6. **Snapshot/dataset assembly** — Forge. For snapshot and benchmark products: aggregate the dataset, compute metrics (e.g., adoption benchmark scores, vertical indices), and version-stamp the release. *Output: release artifact.*
7. **Product QA** — Norm. Run the data product QA checklist: schema conformance, metric recalculation, source/date accuracy, no PII leakage, license compliance, and documentation completeness (README, field dictionary). *Gate: no release before Norm approval.*
   - QA sample-checks ≥ 1% of rows against source for accuracy.
8. **Release & delivery** — Dispatch. Deliver via the agreed channel (API key activation, CSV/portal upload, email) on the contracted cadence. Log delivery and confirm receipt/uptime. *Gate: delivery logged; client acknowledgment recorded.*
9. **Support & monitoring** — Dispatch + Forge. Monitor endpoint uptime (≥ 99%), API usage, and error rates. Respond to support tickets per product SLA. *Gate: incident response within SLA; major incidents escalated.*
10. **Usage & value feedback** — Halo. Capture product usage analytics and periodic feedback (quarterly for subscriptions). Identify upsell triggers (usage spikes, custom-column requests) and hand to Vector. *Gate: usage recorded in CRM; upsell triggers logged.*
11. **Versioning & licensing review** — Amicus + Forge. Quarterly review: licenses remain valid, terms match client usage, schema versions documented. *Gate: license register current; client usage within contracted scope.*
12. **Rolling archive** — Mnemos + Dispatch. Archive released versions with provenance and field dictionaries; index for reuse. Archive data per retention policy (Sentinel). *Gate: archive checklist complete.*
13. **Offboarding (if cancelled)** — Halo + Dispatch. Revoke API keys/access (Sentinel), final reconciliation (Tally), data deletion/retention per license. *Gate: offboarding checklist complete; access fully revoked.*

## Deliverables

1. **Dataset** — validated, versioned data with field dictionary and README.
2. **Snapshots / benchmarks** — periodic metrics releases with methodology notes.
3. **Signal feeds** — API/CSV feeds with uptime SLA and documentation.
4. **License & documentation pack** — usage terms, schema, provenance log.

**Data hygiene checks** (Forge + Euclid): schema conformance; duplicate detection; missing-value flags; outlier screening; PII redaction; temporal consistency; refresh validation. Scorecard ≥ 95% before delivery; exceptions shipped in a known-issues file.

**Licensing notes** (Amicus): every source carries a license record covering the client's intended use; redistributed third-party data is marked with the source's license terms; API keys and credentials are Sentinel-managed and never shipped in datasets.

**QA checklist** (Norm): schema conformance; metric recalculation verified; sources dated and accurate; no PII/hallucinated values; license compliance; documentation complete; versioning consistent; delivery format validated.

## KPIs

| KPI | Definition | Target |
|---|---|---|
| Refresh on-time rate | Scheduled refreshes on cadence | ≥ 95% |
| Data hygiene score | Hygiene checks passed ÷ total checks | ≥ 95% |
| QA first-pass rate | Releases passing QA first try | ≥ 90% |
| Feed uptime | Endpoint availability | ≥ 99% |
| License compliance | Sources with valid documented license | 100% |
| CSAT | Quarterly feedback (1–5) | ≥ 4.5 |
| Churn | Canceled product subscriptions ÷ total | ≤ 5%/mo |
| Support SLA | Tickets answered within product SLA | ≥ 95% |

## Escalation

- Pipeline/refresh failure → Cog auto-retry → Forge → COO if delivery at risk; client notified per SLA.
- QA failure → Norm blocks release; fix owned by Forge; release override requires COO+CEO.
- Data license breach or usage outside scope → Amicus + Sentinel; client notified; stop delivery until resolved.
- Client risk (low usage, unpaid invoices, churn) → Halo escalates to COO within 24h.
- PII/security incident → Sentinel incident response per security runbook.
- Schema change affecting a live client → Forge versions the schema; Dispatch notifies the client before the next refresh; change control via Dispatch + Amicus.
- Recurring hygiene failures → Forge + Euclid root-cause and update the hygiene standard within 5 days.

## Related

`00-company/services.md` · `00-company/pricing.md` · `05-delivery/delivery-system.md` · `05-delivery/project-lifecycle.md` · `01-departments/17-engineering.md` · `01-departments/25-analytics.md` · `01-departments/14-legal.md` · `01-departments/20-security.md` · `03-sales/upsell-playbook.md`
