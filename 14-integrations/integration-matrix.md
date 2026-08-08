# Integration Matrix — Meridian Research & Advisory

> Version 1.0 · Owned by Cog + Forge · Every external system, its purpose, and status. Credentials/accounts → owner action.

## Integration tiers

- **T0 — Critical (revenue/legal):** billing, CRM, email delivery, signing.
- **T1 — High (core ops):** knowledge, scheduling, lead data, notifications.
- **T2 — Support (growth):** analytics, SEO, social, payments secondary.

## Matrix

| System | Purpose | Tier | Status | Integration method |
|---|---|---|---|---|
| **Stripe** | Payments, subscriptions, invoices, receipts, portal | T0 | PENDING owner connect | REST API + webhooks |
| **PayPal** | Secondary payments | T0 | PENDING owner connect | REST API + webhooks |
| **HubSpot CRM** | CRM UI (companies/contacts/deals) | T0 | PENDING owner account | REST API |
| **Airtable** | Alternative/free CRM UI + ops bases | T1 | PENDING owner account | REST API |
| **SQLite → DB** | Source of truth for records, KPI log | T0 | IN REPO (`16-crm/schema.sql`) | native |
| **Resend / SendGrid** | Transactional + campaign email | T0 | PENDING owner account | REST API |
| **Cal.com / Calendly** | Meeting booking | T0 | PENDING owner account | REST API + embed |
| **E-sign (DocuSign / PandaDoc / Dropbox Sign)** | Contract execution | T0 | PENDING owner account | REST API |
| **n8n / Azure Logic Apps** | Workflow orchestration | T0 | PENDING deploy | native connectors |
| **Obsidian vault** | Knowledge base | T1 | IN REPO (vault) | file sync |
| **Vector store (LanceDB/Chroma)** | RAG retrieval | T1 | PENDING build | SDK |
| **Crunchbase API** | Company/funding data | T1 | PENDING API key | REST API |
| **Clearbit / Hunter / Apollo** | Contact/email enrichment | T1 | PENDING key | REST API |
| **LinkedIn (Sales Nav partner / official APIs)** | Prospecting + outreach | T1 | PENDING account | official API / partner (ToS-safe) |
| **BuiltWith** | Tech-stack detection | T2 | PENDING key | REST API |
| **Plausible / GA4** | Web analytics | T1 | PENDING account | script/API |
| **Stripe Customer Portal** | Client self-service billing | T0 | via Stripe | hosted |
| **Grafana / custom HTML dashboards** | Monitoring + KPIs | T1 | IN REPO (`15-dashboards/`) | read DB |
| **GitHub (repos/actions)** | Source control + cron jobs | T1 | IN REPO | native |
| **Site forms → CRM (WF-MK-07)** | Scorecard/toolkit signups → leads + nurture | T1 | DESIGN (form live, backend pending) | static form + n8n webhook |
| **Slack/Discord (optional)** | Alerts + internal comms | T2 | PENDING | webhooks |
| **Google Workspace** | Docs, sheets, calendar, drive | T1 | PENDING owner account | API + native |
| **QuickBooks / Xero** | Accounting sync (books) | T1 | PENDING owner account | REST API |
| **LLM providers (OpenAI/Anthropic/etc.)** | Agent reasoning | T0 | PENDING owner key | API (pluggable abstraction) |

## Integration architecture

```
Sources (Crunchbase, feeds, jobs) ─┐
                                  ├─▶ n8n / Logic Apps ─▶ Meridian agents ─▶ SQLite/DB
CRM (HubSpot/Airtable) ◄──────────┘          │                │                 │
                                            ▼                ▼                 ▼
Stripe ◄── invoices/billing     Scheduling (Cal)      Knowledge vault      Dashboards
   │                                                      │
   └── webhooks → dunning/accounting/notify ──────────────┘
```

## Ownership & key management

- All credentials in the company vault (Bitwarden/1Password), never in code or `.env` in git.
- Rotate quarterly; revoke on suspicion (Sentinel).
- Owner creates accounts (email owner) — listed in `18-status/launch-checklist.md`.

## Build order

1. Stripe connect + CRM account + email + scheduling + e-sign (T0).
2. n8n deploy + core workflows (lead gen, delivery, finance rollups).
3. Enrichment APIs + research ingestion.
4. Dashboards live on shared DB.
5. Analytics/SEO/social (T2) as traffic grows.

## Related

`07-automation/automation-system.md` · `17-ops/schedules/` · `18-status/launch-checklist.md`
