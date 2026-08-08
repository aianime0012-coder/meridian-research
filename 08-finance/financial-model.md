# Financial Model — Meridian Research & Advisory

> Version 1.0 · Owned by Ledger · Y1–Y3 planning with scenarios. Living model; refresh monthly against actuals.

## Key assumptions

- **Pricing:** per `00-company/pricing.md` (subscriptions $1.5–5k/mo, sprints $5–15k, research $3–30k, retainer $5–15k/mo).
- **Mix (Y2):** 40% intel subs, 25% advisory, 20% projects, 10% products, 5% training.
- **Delivery cost:** ~10% of revenue (LLM + infra + tools) + QA overhead ~5% → GM ≈ 85%.
- **Acquisition:** CAC ≤ $300; S&M ~15% of revenue Y1, declining.
- **Zero human payroll** (agents only); owner draw + human-gate costs (legal, tax) accounted separately.

## Year 1 (base case)

| Metric | Q1 | Q2 | Q3 | Q4 |
|---|---|---|---|---|
| Paying accounts | 2 | 6 | 12 | 20 |
| MRR | $3.0k | $15k | $35k | $60k |
| One-time revenue (cum) | $5k | $17k | $37k | $67k |
| Total revenue (cum) | $14k | $62k | $167k | $380k |
| GM (cum) | 80% | 82% | 84% | 85% |
| S&M (cum) | $2k | $8k | $18k | $33k |
| Infra+LLM+tools (cum) | $3k | $10k | $25k | $52k |
| Net (cum) | −$2k | −$4k | −$2k | +$15k |
| Cash (end) | $10k | $18k | $30k | $55k |

## Year 2 (target)

| Metric | Value |
|---|---|
| Paying accounts (exit) | 60 |
| MRR (exit) | $150k |
| ARR run-rate | $1.8M |
| Revenue | $1.4M |
| GM | 86% |
| Net margin | 22% |
| NRR | ≥ 115% |
| CAC | ≤ $250 |

## Year 3 (scaled)

| Metric | Value |
|---|---|
| Paying accounts (exit) | 150–300 |
| ARR run-rate | $5M–$8M |
| Revenue | $4M–$6M |
| GM | 87% |
| Net margin | 25–30% |

## Scenario plan

| Scenario | Assumption | Revenue Y1 | Cash need | Action |
|---|---|---|---|---|
| **Base** | 20 accounts, avg $3k MRR | $380k | ~$30k peak | as planned |
| **Bull** | 30 accounts, higher attach | $550k | self-funded | accelerate content + sales |
| **Bear** | 12 accounts, slower close | $230k | keep costs variable | cut S&M, extend runway, founder-led |

## Cash flow levers

1. Annual prepay (−10%) to pull cash forward.
2. Subscription-first packaging to smooth revenue.
3. Costs scale with revenue (pay-as-you-go LLM, variable marketing).
4. Invoice upfront for projects; milestone billing ≥ 30% at kickoff.

## Model updates

- Monthly: plug actuals into `kpi_log`, recompute, flag variance > 20% to CEO.
- Quarterly: refresh pricing, mix, and scenario weights with new benchmark data.
- Forecast file: `08-finance/forecast.xlsx` (owner can generate via Google Sheets linked to dashboards) — pending build.

## Related

`finance-system.md` · `margin-model.md` · `kpi-dictionary.md` · `00-company/business-plan.md`
