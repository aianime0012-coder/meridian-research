# Vendor Evaluation Toolkit

> Lead magnet · 20-criteria weighted scoring template → pick a vendor in 90 minutes
> Companion to the AI Readiness Scorecard (use after you've passed the readiness gate)
> Produced by Astra + Sage · Status: DRAFT · Gate: downloads ≥120/mo, form→MQL ≥20%

## Purpose
Shortlist and score 3–5 AI vendors in ~90 minutes without drowning in feature
spreadsheets. Output: a weighted total per vendor, a defensible decision, and a
killed-loser list for next time.

## Weights (total 100)
| Category | Weight | Why |
|---|---|---|
| Capability | 25 | Does it actually do the job you defined? |
| Cost | 25 | Total cost of ownership, not list price |
| Data | 20 | Access, portability, and quality of integration |
| Integration | 15 | Fit with your stack and workflows |
| Risk | 15 | Security, compliance, vendor stability |

## The 20 criteria

### Capability (25)
1. Does it solve the *specific* problem from your process map, not a generic one?
2. Accuracy on a 20-case sample *you* bring, not the vendor's demo set?
3. Throughput / speed meets your real volume?
4. Customization without vendor engineering?
5. Roadmap has a named owner and a date for your must-haves?

### Cost (25)
6. True 3-year TCO: license + integration + training + support + exit?
7. Pricing model scales predictably (per seat / per call / flat)?
8. No surprise overage mechanics?
9. Contract length ≤ pilot length, with month-to-month option?
10. Exit / export costs (data out, offboarding) documented?

### Data (20)
11. Bring-your-own-data works with your formats today?
12. Data residency and retention match your policy?
13. Model training on *your* data — opt-out explicit and real?
14. Outputs exportable and auditable (not a black box)?

### Integration (15)
15. Native connectors for your stack (CRM, email, cloud) — no middleware patchwork?
16. API documented, stable, and rate-limited sanely?
17. Human-in-the-loop review points built into the workflow?
18. Failure / fallback behavior defined (what happens when it breaks)?

### Risk (15)
19. Security: SOC 2 / ISO 27001 / pen tests / data breach track record?
20. Compliance: EU AI Act posture, DPAs, and transparency duties covered?

## Scoring sheet
Use one row per vendor, one column per criterion, points 0–5 each, then:
`Category score = (Σcriterion scores / (5 × n)) × category weight`.
Vendors: `[V1] [V2] [V3] [V4] [V5]`. Total = sum of 5 category scores (max 100).

| Criterion (0–5) | V1 | V2 | V3 | V4 | V5 |
|---|---|---|---|---|---|
| C1–C5 → Capability /25 | | | | | |
| C6–C10 → Cost /25 | | | | | |
| C11–C14 → Data /20 | | | | | |
| C15–C18 → Integration /15 | | | | | |
| C19–C20 → Risk /15 | | | | | |
| **Total /100** | | | | | |

## Decision rules
- Score < 55: kill, do not negotiate.
- 55–74: shortlist only if top-3 gap < 10 points; else kill.
- 75–89: pilot 30 days against your success metric.
- 90+: pilot immediately, but still enforce the 30-day metric + kill-switch.

## Notes / mechanics
- Bring the 20-case sample and the process map from your readiness diagnosis —
  scoring without either is theater.
- Time-box each vendor to 20 minutes in the room; the sheet does the work.
- Log the killed list + reasons; reuse it next quarter (research engine input).

## Handoff / automation (to be wired in n8n)
- Download form → lead row in CRM (`16-crm/schema.sql`, `leads`, source=`vendor_toolkit`) →
  nurture D1/D3/D6 → MQL flag if score+interest. Track in `15-dashboards/`.

## Related
`../lead-magnets.md` · `ai-readiness-scorecard.md` · `../../03-sales/outreach-playbook.md`
