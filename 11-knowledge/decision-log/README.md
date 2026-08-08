# Decision Log — Index

> **Owner:** Meridian Knowledge (11-knowledge) · **Version:** 1.0
> **Purpose:** Every consequential decision — client, product, or internal — gets a date-stamped, searchable record with owner, rationale, and downstream impact. The log is the firm's institutional memory: it lets agents and the owner answer "why did we do that?" without guessing.

---

## How the Decision Log Works

### 1. Process: Propose → Decide → Log → Notify

**Step 1 — PROPOSE (anyone)**
- An agent or the owner identifies a decision that is consequential (see threshold below).
- The decision is proposed with the options considered and a first-cut rationale.
- Record: proposed by, date, and open context. Proposal can live in chat/notes temporarily.

**Step 2 — DECIDE (owner, unless delegated)**
- The owner (sole shareholder) makes the call — or explicitly delegates with criteria.
- Consider: evidence available, options, downstream impact, reversibility.
- Where evidence matters: reference the source-linked artifacts (report/deck/engagement files), not memory.

**Step 3 — LOG (immediately)**
- Write one note per decision using the template in Section 3 below.
- One decision = one note = one date. No batching multiple decisions into one blob.
- Store under `11-knowledge/decision-log/<YYYY-MM-DD>-<short-slug>.md`.

**Step 4 — NOTIFY (same day)**
- Link the new decision note into this index (chronological list in Section 4).
- Cross-link related notes: prior decisions, affected engagements, affected templates/playbooks.
- Flag downstream impact to whoever is affected (engagement owner, client, platform/ops).

### Threshold — when does something need a log entry?
Log it if it is **irreversible, costly, precedent-setting, client-facing, or changes scope/brand/QA policy.** If unsure, log it — a short entry costs minutes; an unlogged precedent costs months.

### Rules
- **Owner-led:** the owner decides; agents propose and document. Never log a decision as made without the owner's decision (record as *Proposed* until then).
- **Honest rationale:** write the real reason, not a flattering one. "Cheapest" and "fastest" are valid; "unknown" is valid too — say so.
- **Update on impact:** when downstream effects materialize, append to the note (status/downstream impact) rather than writing a new note.
- **Keep it linked:** no orphan notes. Every decision links to the index, its engagements, and any related decisions (graph-linked in the vault).

---

## Reference: Master Decision Log

- **Location:** [`00-company/decision-log.md`](../00-company/decision-log.md) — the running, reverse-chronological master list of all decisions.
- This folder's per-decision notes are the durable detail; the master log is the scan-able one-liner summary.

---

## Per-Decision Note Template

Copy the block below into `11-knowledge/decision-log/<YYYY-MM-DD>-<slug>.md`. Keep it under ~60 lines; append impact updates over time.

```markdown
---
title: [Decision title]
date: [YYYY-MM-DD]
status: [Proposed | Decided | In effect | Superseded | Reverted]
decision-id: [D-YYYY-NNN]
---

# [Decision title]

## Context
- Why this decision surfaced: [trigger, pressure, deadline, evidence gap]
- Who/what it affects: [clients, engagements, agents, ops, brand]
- Related links: [engagements ENG-XXXX, prior decisions D-YYYY-NNN]

## Options considered
- **Option A — [name]:** [description] · pros · cons · rough cost/timeline
- **Option B — [name]:** [description] · pros · cons · rough cost/timeline
- **Option C — [name]:** [description] · pros · cons · rough cost/timeline

## Decision
**Chosen:** [Option A] — [one-line summary of the call]

## Rationale
- [Primary reason — evidence-linked where possible]
- [Secondary reasons — cost, speed, risk, reversibility, brand fit]
- [What was explicitly traded off / rejected and why]

## Owner
- **Decided by:** [Owner / delegated to — name]
- **Proposed by:** [name / agent]
- **Documented by:** [name / agent]

## Status & follow-ups
- Status: [Proposed → Decided → …]
- Open follow-ups: [e.g., "revise milestone-template.md", "communicate to client ENG-0123"]
- Review date: [YYYY-MM-DD if a revisit is scheduled]

## Downstream impact (append as it materializes)
- [YYYY-MM-DD] — [effect observed; client reaction; cost/time impact; artifact changed]
```

---

## Index of Decision Notes (chronological)

| Date | ID | Decision | Status | Link |
|---|---|---|---|---|
| [YYYY-MM-DD] | D-[YYYY-NNN] | [One-line summary] | [Decided] | [link] |
| [YYYY-MM-DD] | D-[YYYY-NNN] | [One-line summary] | [Superseded] | [link] |
| [YYYY-MM-DD] | D-[YYYY-NNN] | [One-line summary] | [Proposed] | [link] |

> **Maintenance rule:** whenever a decision note is created or updated, update this table and the master log on the same day. The index is the entry point; the master log is the source of truth.

---

## Template & Process References

- Full engagement lifecycle: SIGN→SETUP→KICKOFF→DELIVERY→QA→DELIVER→FEEDBACK→ARCHIVE (see `00-company/`).
- Templates this log governs/links: [`../templates/report-template.md`](../templates/report-template.md), [`../templates/deck-template.md`](../templates/deck-template.md), [`../templates/milestone-template.md`](../templates/milestone-template.md).
- Sales decisions and client conversations feed in from [`../playbooks/sales-scripts.md`](../playbooks/sales-scripts.md).

---

*End of index — keep the process section stable; only the decision table and notes change.*
