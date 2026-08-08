# Opportunity Scoring Model — Meridian Research & Advisory

> Version 1.0 · Owned by Ranger + Euclid (Analytics) · Deterministic, auditable, re-tuned quarterly.

## Purpose

Rank every discovered company on a 0–100 **Fit Score** and assign a priority
tier so limited outreach capacity goes to the accounts most likely to buy.

## Formula

```
Fit Score = (ICP Fit × 0.30) + (Pain Signal × 0.30) + (Budget Proxy × 0.20)
          + (Accessibility × 0.10) + (Timing × 0.10)
```

All sub-scores are 0–100. No sub-score of 0 on **ICP Fit** may still reach tier A (hard gate).

## Sub-score definitions

### 1. ICP Fit (30%)
| Condition | Score |
|---|---|
| Industry in priority list AND size 10–500 | 100 |
| Industry in priority list, size 5–1000 | 80 |
| Adjacent industry, size 10–500 | 60 |
| Adjacent industry, wrong size | 30 |
| Wrong industry / consumer-only | 0 (gate) |

### 2. Pain Signal (30%)
| Signal (evidence required) | Score |
|---|---|
| 3+ verified signals (AI hiring + launch + funding) | 100 |
| 2 verified signals | 80 |
| 1 strong signal (e.g., dedicated AI exec hire) | 60 |
| Weak/indirect signals only | 30 |
| None found | 10 |

Signal catalog: `06-research/signal-catalog.md`. Each must carry a dated source.

### 3. Budget Proxy (20%)
| Revenue band (est.) | Score |
|---|---|
| $10M+ | 100 |
| $5M–$10M | 85 |
| $2M–$5M | 70 |
| $500k–$2M | 50 |
| < $500k | 25 |
| Unknown | 40 (assume mid, flag for enrichment) |

Funding rounds and hiring growth raise the band by one step (documented in the record).

### 4. Accessibility (10%)
| Factor | Score |
|---|---|
| 2+ decision-makers with active LinkedIn + email discoverable | 100 |
| 1 decision-maker discoverable | 70 |
| Only generic inbox / no named execs | 40 |
| No path to contact | 10 |

### 5. Timing (10%)
| Signal recency | Score |
|---|---|
| Signal within last 30 days | 100 |
| Within 60 days | 75 |
| Within 90 days | 55 |
| Older than 90 days | 30 |
| None | 10 |

## Tiers

| Tier | Score | Action |
|---|---|---|
| **A** | ≥ 75 | Immediate outreach (sequence in < 24h); Sales notified |
| **B** | 50–74 | Standard outreach sequence; nurture cadence |
| **C** | < 50 | Monitor list; monthly re-score when new signals appear |
| **D** | ICP gate fail | Excluded; logged for reference |

## Re-scoring triggers

- New signal detected (funding, exec hire, launch, job posting).
- Reply / engagement event.
- Every 90 days for C-tier records with new activity.

## Calibration loop (monthly)

1. Compare scored tier vs. actual Sales outcomes (SQL conversion by tier).
2. Adjust sub-score weights to maximize A→SQL conversion.
3. Log changes in `00-company/decision-log.md`; store calibration data in Analytics DB.

## Related

`leadgen-engine.md` · `crm-record-spec.md` · `06-research/signal-catalog.md` · `16-crm/schema.sql`
