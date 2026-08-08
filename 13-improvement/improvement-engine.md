# Self-Improvement Engine — Meridian Research & Advisory

> Version 1.0 · Owned by COO (Cadence) + Euclid (Analytics) · The company improves itself daily.

## Daily questions

Every day, the engine asks over the day's events:

1. **What failed?** — blocked workflows, QA returns, client issues, missed SLAs.
2. **Why?** — root cause (tool, process, data, instruction, external).
3. **Can it be automated?** — if it repeats, build/queue a workflow.
4. **Can it be simplified?** — remove steps, merge stages.
5. **Can it be delegated?** — route to a more appropriate agent.
6. **Can it become software?** — productize a manual step.
7. **Can it increase profit?** — revenue, margin, or efficiency impact.

## The loop

```
EVENTS (logs, KPIs, QA, client feedback)
   │  WF-OP-01 daily retro
   ▼
ANALYZE (7 questions, root cause)
   │
   ▼
DECIDE (improve workflow / update SOP / edit agent instruction / add automation / stop doing)
   │  logged to improvement log + decision log
   ▼
IMPLEMENT (Cog/Forge update runbooks; Mnemos update knowledge)
   │
   ▼
MEASURE (KPIs before/after, experiment tracker)
   └───────── back to EVENTS
```

## Improvement log

Every improvement recorded: `{date, source_event, root_cause, action, owner, expected_impact, status, measured_impact}`.
Log lives with `13-improvement/improvement-log.md` (running).

## Prioritization

Score = Impact (1–5) × Frequency (1–5) ÷ Effort (1–5). High-score items go into
the next sprint. Everything repeats eventually automates.

## Metrics that trigger action

| Signal | Trigger |
|---|---|
| QA pass < 90% | Review templates/instructions |
| Workflow failure > 2/wk | Fix root cause, add tests |
| Churn > 5%/mo | Client-success + delivery review |
| Sales cycle > 45 days | Proposal/negotiation/outreach audit |
| CAC > $300 | Marketing/lead-quality review |
| MRR regression 2 wks | Full commercial review |
| Repeated client complaint | Root-cause + playbook update |

## Review cadence

- **Daily:** retro (WF-OP-01) → improvement log.
- **Weekly:** priority scoring, sprint of improvements.
- **Monthly:** experiment review (win/lose), KPI calibration (scoring weights, targets).
- **Quarterly:** pricing review, risk register, strategic pivot check.

## Culture rules

- Blameless: failures are system problems, not personal.
- Evidence over opinion: every improvement measured.
- Ships fast: small, reversible experiments beat big rewrites.
- Bias to automation: if a human-ish step repeats, it's a bug.

## Related

`13-improvement/daily-retro.md` · `13-improvement/experiment-tracker.md` · `17-ops/workflows/WF-OP-01-daily-retro.md` · `12-quality/`
