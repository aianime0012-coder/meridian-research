# QA Gates — Meridian Research & Advisory

> Version 1.0 · Owned by Norm (QA) · Where gates exist in the pipeline and what blocks release.

## Gate map

| Gate | Where | Blocks | Decides |
|---|---|---|---|
| **G1 — Content** | Every client-facing draft | Release to client | PASS / FIX / BLOCK |
| **G2 — Compliance** | Legal, privacy, payment, marketing claims | Send/sign/publish | PASS / FIX (Solon) |
| **G3 — Financial** | Invoices, forecasts, pricing deviations | Send/invoice | PASS / FIX (Ledger/Tally) |
| **G4 — Legal execution** | Contracts, policies, filings | Signature/execution | Owner decision |
| **G5 — Go-live** | New workflow/automation | Production | Test-pass + owner if financial |

## Gate rules

1. A gate is an **independent check** — the producing agent never self-approves.
2. Scoring: PASS ≥ 90 · FIX 70–89 (return with findings) · BLOCK < 70 or critical flaw (escalate to COO).
3. Every gate decision logged (who, when, score, findings) in the QA log.
4. BLOCKed items freeze until resolved; nothing ships around a gate.
5. Gates G2–G4 are **non-overridable by the producing department**; only COO (G2/G3) or Owner (G4) can overturn.

## Release authority

| Artifact | Releasing authority |
|---|---|
| Research report / brief | Norm (G1) |
| Proposal / SOW | Norm (G1) + Amicus check (G2) |
| Contract execution | Owner (G4) |
| Invoice | Tally (G3) |
| Public content | Norm (G1) + Solon (G2) |
| Payment/refund > $2,500 | COO + Legal (G2/G3) |
| New automation to production | Forge tests + Cog (G5) |

## Failure handling

- FIX: findings → producing agent → rework → re-enter gate.
- Repeated FIX (3× same class): root cause → improvement engine → SOP/template/agent instruction update.
- Client complaint post-delivery: full audit + retro within 24h.

## Related

`12-quality/qa-framework.md` · `12-quality/qa-checklists.md` · `17-ops/workflows/WF-DV-04-qa-gate.md` · `13-improvement/`
