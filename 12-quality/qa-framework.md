# Quality Framework — Meridian Research & Advisory

> Version 1.0 · Owned by Norm (QA) · Every client-facing output passes a QA gate. Quality is the product.

## Principle

**Nothing leaves the company without a QA pass.** Every deliverable, proposal,
email, report, and dashboard is checked for: logic, accuracy, formatting,
grammar, sources, completeness, and professional quality.

## QA layers

| Layer | Scope | Owner |
|---|---|---|
| L1 — Automated checks | Spelling, grammar, format, links, completeness | Tools (linters, link checkers) + Norm |
| L2 — Agent review | Logic, accuracy, source verification, brand tone | Norm agent (independent of producing agent) |
| L3 — Expert review | Legal, financial, high-stakes outputs | Amicus / Ledger / Solon |
| L4 — Human gate | Legally binding documents, entity/financial acts | Owner |

## QA gate workflow (WF-DV-04)

```
Deliverable draft → L1 auto checks → L2 Norm review → score → 
  PASS (≥90) → release
  FIX (<90) → return with findings → rework → re-QA
  BLOCK (critical flaw) → escalate to COO
```

## Checklist

Full checklists: `12-quality/qa-checklists.md`. Core items:
- **Logic:** recommendations follow from evidence; no contradictions; assumptions stated.
- **Accuracy:** every factual claim has a dated, named source; numbers internally consistent; confidence stated where uncertain.
- **Formatting:** brand template applied; headings/tables correct; file naming standard.
- **Grammar:** clear, professional English; no typos; tone per branding.
- **Sources:** links work; sources current (≤90 days preferred for time-sensitive claims); no fabricated citations.
- **Completeness:** every promised section present; client name/date/version correct; appendix included.
- **Professional:** reads like a top-tier firm; no hype; disclosure footer present.

## QA scorecard

| Dimension | Weight |
|---|---|
| Accuracy & sources | 30% |
| Logic & analysis | 25% |
| Completeness | 20% |
| Grammar & clarity | 10% |
| Formatting | 10% |
| Brand/compliance | 5% |
| **Total** | 100% (pass ≥ 90) |

Scores logged to `kpi_log` (`qa_pass_rate`, `qa_score_avg`).

## Sampling audits

- 10% of QA-passed items re-audited independently each month.
- Client complaints & rework trigger full root-cause review.

## Delivery KPIs

| KPI | Target |
|---|---|
| First-pass QA pass rate | ≥ 90% |
| QA score average | ≥ 92 |
| Client-reported defects / month | ≤ 2 |
| QA cycle time | ≤ 24h |

## Feedback loop

QA findings → `13-improvement/` → updates to SOPs, templates, and agent
instructions so the same defect class doesn't recur.

## Related

`12-quality/qa-checklists.md` · `12-quality/qa-gates.md` · `17-ops/workflows/WF-DV-04-qa-gate.md` · `01-departments/19-quality.md`
