# Implementation Status — Meridian Research & Advisory

> Version 1.0 · Updated 2026-08-07 · This is the single view of what's built vs. what the owner must do.

## Legend

- **BUILT** — artifact exists and is complete in this repo.
- **DESIGN** — spec complete; implementation pending (needs accounts/tools).
- **OWNER** — requires human owner action (accounts, legal, money).

## Phase status

| Phase | Scope | Status |
|---|---|---|
| 1 | Company creation | **BUILT** — see `00-company/` |
| 2 | 25 departments/agents | **BUILT** — see `01-departments/` + `17-ops/agents/ROSTER.md` |
| 3 | Lead generation | **BUILT** (design) — see `02-leadgen/` |
| 4 | Sales machine | **BUILT** (design) — see `03-sales/` + `16-crm/schema.sql` |
| 5 | Marketing | **BUILT** (design) — see `04-marketing/` |
| 6 | Service delivery | **BUILT** — SOPs in `05-delivery/` |
| 7 | Research engine | **BUILT** — see `06-research/` |
| 8 | Automation | **BUILT** (design + runbooks) — see `07-automation/` + `17-ops/workflows/` + `17-ops/schedules/` |
| 9 | Finance | **BUILT** (design + model) — see `08-finance/` |
| 10 | Payments | **BUILT** (design + templates) — see `09-payments/` — **OWNER** to connect Stripe/PayPal |
| 11 | Legal | **BUILT** (templates) — see `10-legal/` — **OWNER** to review/execute |
| 12 | Knowledge base | **BUILT** — see `11-knowledge/` |
| 13 | Quality | **BUILT** — see `12-quality/` |
| 14 | Self-improvement | **BUILT** — see `13-improvement/` |

## Integrations

| System | Status |
|---|---|
| CRM (HubSpot/Airtable) | OWNER — create account, connect |
| Stripe + PayPal | OWNER — create entity-connected accounts, KYC |
| Email (Resend/SendGrid) | OWNER — create account |
| Scheduling (Cal.com) | OWNER — create account |
| E-sign (DocuSign/PandaDoc/Dropbox Sign) | OWNER — create account |
| n8n / Azure Logic Apps | DESIGN — deploy workflow runbooks |
| Enrichment APIs (Clearbit/Hunter/Apollo, Crunchbase) | OWNER — API keys |
| LLM providers | OWNER — API key |
| Dashboards | BUILT (seed) — connect DB for live |

## Built-but-not-wired summary

Everything in this repo is real and usable as documentation/spec; the **wiring**
(accounts, keys, hosting, legal execution) is deliberately left as owner gates
per the project rules ("generate everything except the final execution step").

## Next steps

1. Owner completes `18-status/launch-checklist.md`.
2. Deploy workflows (n8n/Azure Logic Apps) from `17-ops/workflows/`.
3. Stand up CRM sync + dashboards.
4. First outreach campaigns from `02-leadgen/` + `03-sales/`.
