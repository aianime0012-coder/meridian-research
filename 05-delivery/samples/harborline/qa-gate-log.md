# QA Gate Log — MRA-HARBORLINE-SPRINT-20260808 (SAMPLE)

> Owned by Norm (QA) · Per WF-DV-04 · Demonstrates the gate loop: draft → L1/L2 → FIX → rework → PASS.

## Round 1 — Draft review (2026-08-08)

| Dimension | Weight | Score | Notes |
|---|---|---|---|
| Accuracy & sources | 30% | 70 | F3/F4 sources generic (no direct URL captured); F1 good |
| Logic & analysis | 25% | 80 | Sound frame; recommendations traceable |
| Completeness | 20% | 75 | Executive summary missing "what we did NOT cover"; no glossary |
| Grammar & clarity | 10% | 90 | Clean |
| Formatting | 10% | 85 | Cover OK; footer present |
| Brand/compliance | 5% | 100 | SAMPLE banner + disclosure present |
| **Weighted total** | | **76** | → **FIX** (below 90 pass bar) |

**Findings (returned to Sage):**
1. F3/F4 citations must carry direct URLs + dates (source-verification rule).
2. Add "What we did NOT cover" to the executive summary.
3. Add 7.C Glossary (was referenced but empty).
4. F7 tagged Low confidence without a reason — add one-line reason.

## Round 2 — Rework review (2026-08-08)

| Dimension | Weight | Score | Notes |
|---|---|---|---|
| Accuracy & sources | 30% | 95 | Direct URLs added; confidence reasons stated |
| Logic & analysis | 25% | 92 | Consistent |
| Completeness | 20% | 95 | Exclusions + glossary added |
| Grammar & clarity | 10% | 95 | Pass |
| Formatting | 10% | 90 | Pass |
| Brand/compliance | 5% | 100 | SAMPLE framing intact |
| **Weighted total** | | **94** | → **PASS** |

**Release decision:** PASS — released as SAMPLE deliverable to `05-delivery/samples/harborline/`.
**KPI logged:** qa_pass_rate +1 (pass on round 2); qa_score_avg 94.

## Lessons fed to improvement engine

- Findings tables must carry a direct URL per citation by default (template updated —
  see `13-improvement/improvement-log.md` for the linked entry).
- Confidence = Low without a stated reason → auto-fail item in checklist.

## Related

`../../12-quality/qa-framework.md` · `../../12-quality/qa-checklists.md` · `../../../17-ops/workflows/WF-DV-04-qa-gate.md`
