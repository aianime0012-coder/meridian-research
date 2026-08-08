# Decision Log — Meridian Research & Advisory

> Rule: every material decision is logged here with date, owner, rationale, and status. Owned by COO agent; reviewed in daily retro.

## Log

| # | Date | Decision | Rationale | Owner | Status |
|---|---|---|---|---|---|
| D001 | 2026-08-07 | Legal entity: single-member US LLC | Simple, owner = sole shareholder, pass-through tax, low admin | Strategy | Decided |
| D002 | 2026-08-07 | Brand: "Meridian Research & Advisory" (MRA) | Distinctive, credible, global, fits research/advisory | Strategy | Decided |
| D003 | 2026-08-07 | Niche: applied AI strategy + market & competitive intelligence for mid-market | Whitespace between tier-1 and freelancers; recurring revenue | Strategy | Decided |
| D004 | 2026-08-07 | Revenue model: subscriptions/retainers ≥ 60% target | Recurring revenue = valuation + predictability | Finance | Decided |
| D005 | 2026-08-07 | Pricing: fixed/value-based, never hourly | Hourly caps upside; fixed simplifies automation | Finance | Decided |
| D006 | 2026-08-07 | Primary domain: `meridianra.com` | Trust, availability, short | Strategy | Pending owner register |
| D007 | 2026-08-07 | Stack: Meridian OS (agent orchestration) + n8n/Azure Logic Apps automations + HubSpot/Airtable CRM + Stripe | Open, portable, low-cost, compliant payments | Engineering | Decided (see `14-integrations/`) |
| D008 | 2026-08-07 | CRM: SQLite-native schema first, mapped to HubSpot/Airtable | Zero-cost bootstrap; portable schema | Engineering | Decided |
| D009 | 2026-08-07 | Knowledge base: Obsidian vault + vector store | Graph-friendly, local-first, AI-retrievable | Knowledge | Decided |
| D010 | 2026-08-07 | Payments: Stripe (Checkout, Billing, Customer Portal) primary; PayPal secondary | KYC/AML native, subscriptions, global cards | Finance | Decided (owner: connect accounts) |
| D011 | 2026-08-07 | Delivery model: sprint-shaped projects + rolling subscriptions | Predictable dates, bounded scope, recurring attach | COO | Decided |
| D012 | 2026-08-07 | QA gate mandatory before any client-facing output | Protects trust, brand, and legal standing | QA | Decided |
| D013 | 2026-08-07 | Human review required only for legally binding acts & entity/financial setup | Meets legal reality; everything else delegated | CEO | Decided |
| D014 | 2026-08-07 | Founding-client discount program (first 10 clients) | Fast seed references + case studies | Sales | Decided |
| D015 | 2026-08-07 | Open methodology (publish QA standards) | Trust + inbound SEO + defensibility | Marketing | Decided |

## How decisions get made

1. Agent proposes with evidence (options, trade-offs, recommendation).
2. If within decision authority (`01-departments/*`), decide + log.
3. If legally binding, entity-level, or >10% pricing: escalate to CEO agent; if required by law → owner (shareholder) approval gate.
4. Log here. Update affected docs. Notify downstream workflows.

## Related

`13-improvement/daily-retro.md` · `11-knowledge/decision-log/`
