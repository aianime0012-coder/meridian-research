# QA Gate Log — Content Engine Wave (2026-08-08)

> Owned by Norm (QA) · Per WF-DV-04 · Assets: newsletter #001, blog post,
> LinkedIn batch, AI Readiness Scorecard (spec + interactive page), Vendor
> Evaluation Toolkit, outreach email templates, landing page (index.html).

## Round 1 — Review (2026-08-08)

| Asset | Accuracy & sources (30%) | Logic (25%) | Completeness (20%) | Grammar (10%) | Formatting (10%) | Brand/comp (5%) | Weighted |
|---|---|---|---|---|---|---|---|
| Newsletter #001 | 95 | 92 | 90 | 95 | 90 | 100 | **93** |
| Blog (genAI value gap) | 95 | 92 | 90 | 95 | 88 | 100 | **93** |
| LinkedIn batch | 95 | 90 | 88 | 95 | 90 | 100 | **92** |
| Scorecard spec | 95 | 95 | 92 | 95 | 90 | 100 | **94** |
| Scorecard page (HTML) | 90 | 88 | 82 | 90 | 88 | 100 | **88** |
| Vendor toolkit | 90 | 92 | 90 | 95 | 90 | 100 | **92** |
| Outreach templates | 90 | 92 | 88 | 95 | 88 | 100 | **91** |
| Landing page (index.html) | 85 | 88 | 85 | 90 | 88 | 100 | **87** |

**Overall weighted: 91** → PASS (≥90), but two assets below 90 (scorecard page,
landing page) → conditional release pending fixes.

**Findings (returned to producers):**
1. `scorecard.html` — "Download PDF" button wrote a `.txt` blob and said PDF;
   email button claimed "Report sent" without a backend. Misleading UX.
2. `index.html` — scorecard form was a dead placeholder (no `scorecard.html` link);
   JS referenced a removed `#scoreForm` (dead code).
3. Landing page email CTA points at placeholder domain `meridian-research.example`
   — fine for draft, flag to owner for the real domain at go-live.
4. Newsletter/blog reference "[link-to-magnet]" / magnet links not yet wired to
   `scorecard.html` — resolve at publish wiring.

## Round 2 — Rework review (2026-08-08)

| Asset | Weighted | Notes |
|---|---|---|
| Scorecard page (HTML) | **94** | Real .txt export + Print/Save-as-PDF path; email request recorded honestly (localStorage), labeled "activates once accounts connected" |
| Landing page (index.html) | **92** | Dead form/JS removed; scorecard CTA links to `scorecard.html`; placeholder domain flagged not hidden |
| Newsletter #001 | **93** | Magnet links added to publish checklist (wired at send time) |
| Blog | **93** | Magnet CTA linked to both magnets |
| LinkedIn batch | **92** | Unchanged, already pass |
| Scorecard spec | **94** | Unchanged, already pass |
| Vendor toolkit | **92** | Unchanged, already pass |
| Outreach templates | **91** | Unchanged, already pass |

**Overall weighted: 93** → **PASS**

**Release decision:** PASS — content wave released to `04-marketing/content/`,
`04-marketing/lead-magnets/`, `03-sales/templates/`, `04-marketing/site/`.
**KPI logged:** qa_pass_rate +1 (pass on round 2); qa_score_avg 93.

## Go-live pre-checks (before any publish)
- [ ] Newsletter: wire magnet + unsubscribe + postal address, owner approval → WF-MK-01
- [ ] Blog/LinkedIn: SEO meta + schedule via WF-MK-06
- [ ] Landing page: replace placeholder domain, connect real analytics
- [ ] Scorecard: add form→CRM handoff (WF-MG-01) once accounts exist

## Lessons fed to improvement engine
- Interactive assets need a functional QA pass, not just copy review (new rule:
  L1 includes running/clicking web assets). See `13-improvement/improvement-log.md`.

## Related
`../../12-quality/qa-framework.md` · `../../12-quality/qa-checklists.md` · `../../../17-ops/workflows/WF-DV-04-qa-gate.md`
