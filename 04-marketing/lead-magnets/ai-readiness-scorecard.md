# AI Readiness Scorecard

> Lead magnet · 12-question diagnostic → 0–100 score + PDF report · Gate: downloads ≥150/mo, form→MQL ≥25%
> Produced by Astra + Sage · Spec: `04-marketing/lead-magnets.md` · Status: DRAFT (QA + owner review)

## Format
- 12 scored questions across 5 categories (weighted): Data (25), Skills (20), Process (20), Governance (20), Budget (15).
- Response options per question: A=4, B=3, C=2, D=1 points (mapped to maturity: Advanced / Developing / Initial / Absent).
- Total 0–48 raw → scaled to 0–100.
- Output: score, category bar, top-3 weakest categories, 5-page PDF breakdown + prioritized next actions.

## Scoring bands
| Score | Band | Verdict | Suggested next step |
|-------|------|---------|---------------------|
| 80–100 | Podium | Strong foundation | Move to pilot; vendor evaluation toolkit |
| 55–79 | Developing | Workable, structural gaps | Fix ownership + data first; 90-day readiness plan |
| 30–54 | Initial | Fragmented, ad-hoc | Stop buying; run the 90-minute vendor score & diagnosis |
| 0–29 | Absent | Pre-readiness | Begin with data inventory + executive sponsor |

---

## Questions (A / B / C / D)

### Data (weight 25)
1. **Data inventory** — Do you have a written map of the data feeding your key processes?
   - A) Documented, current, and governed
   - B) Partially documented
   - C) Ad-hoc / tribal knowledge
   - D) No map

2. **Data quality** — Is the data AI will consume verified for accuracy and consistency?
   - A) Validated by owners on a schedule
   - B) Spot-checked
   - C) Assumed clean
   - D) Known to be messy

3. **Data access** — Can the right people/agents reach the data they need, when they need it?
   - A) Self-service with access control
   - B) Via ticket/requests
   - C) Silos and manual extraction
   - D) Blocked

### Skills (weight 20)
4. **Business ownership** — Is there a named owner with budget authority for AI initiatives?
   - A) Yes, with a written success metric
   - B) A sponsor, no formal metric
   - C) Committees / no single owner
   - D) None

5. **In-house capability** — Can your team evaluate, run, and maintain an AI tool today?
   - A) Yes, in-house
   - B) Partial, with vendor help
   - C) No, fully external
   - D) None / unknown

6. **Prompt & workflow craft** — Do teams routinely design prompts and workflows around tools?
   - A) Yes, standardized
   - B) Some individuals
   - C) Rarely
   - D) Never

### Process (weight 20)
7. **Current-state documentation** — Are the processes you'd automate written down?
   - A) Fully documented with metrics
   - B) Partially
   - C) In people's heads
   - D) No

8. **Experimentation discipline** — Do you time-box pilots with a defined success metric and a kill-switch?
   - A) Always
   - B) Sometimes
   - C) Rarely
   - D) Never

9. **Adoption plan** — Is there a plan for training and getting users to actually adopt new tools?
   - A) Yes, with change management
   - B) Basic training only
   - C) Relies on enthusiasm
   - D) None

### Governance (weight 20)
10. **Risk & compliance** — Is there awareness of applicable rules (e.g., EU AI Act, data protection) for AI use?
    - A) Assessed and documented
    - B) Awareness, no assessment
    - C) Assumed vendor's job
    - D) None

11. **Human oversight** — Are outputs reviewed by a human with authority before action?
    - A) Yes, built into the flow
    - B) Sometimes
    - C) Rarely
    - D) No

### Budget (weight 15)
12. **Budget clarity** — Is there a real budget with a cost/benefit threshold for AI initiatives?
    - A) Yes, with ROI bar
    - B) Soft budget
    - C) Ad-hoc
    - D) No budget

---

## Score calculation (for the implementation layer)
- Raw = Σ(option points), max 48.
- Category subtotals: Data ΣQ1–3 (max 12) / 12 × 25; Skills ΣQ4–6 / 12 × 20; Process ΣQ7–9 / 12 × 20; Governance ΣQ10–11 / 8 × 20; Budget Q12 / 4 × 15.
- Score 0–100 = sum of weighted category scores (round to integer).
- Deliver PDF: score, band, category bars, top-3 gaps, 3 prioritized actions + offer next step (book a 30-min strategy call or vendor evaluation toolkit).

## Handoff / automation (to be wired in n8n)
- Form (hosted on site) → score computed client-side → email report via WF-MG-01 → lead row in CRM (`16-crm/schema.sql`, `leads` table, source=`ai_readiness_scorecard`) → D1/D3/D6 nurture sequence (`03-sales/outreach-playbook.md`).
- Gate: downloads ≥150/mo; form→MQL ≥25%. Track in `15-dashboards/`.

## Related
`../lead-magnets.md` · `../../03-sales/outreach-playbook.md` · `../../16-crm/schema.sql`
