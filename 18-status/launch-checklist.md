# Launch Checklist — Meridian Research & Advisory

> Version 1.0 · Owner executes the items below; Meridian agents prepare everything else.

## A. Legal entity & money (critical path)

- [ ] Register LLC: `[State]` Secretary of State; name "Meridian Research & Advisory, LLC"
- [ ] Obtain EIN (IRS) for the LLC
- [ ] Open business bank account (LLC)
- [ ] Decide tax election (single-member default; confirm pass-through) — consult CPA
- [ ] Approve & sign: MSA, SOW, NDA templates (`10-legal/`) after counsel review
- [ ] Publish: Privacy Policy, Terms, Cookie Policy, DPA (`10-legal/`)

## B. Payments (Phase 10)

- [ ] Create Stripe account for the LLC; complete KYC; add bank; enable Customer Portal
- [ ] Create PayPal Business account; link
- [ ] Approve refund policy + discount floors (`09-payments/`)
- [ ] Create Stripe products/prices per `00-company/pricing.md` + `09-payments/templates/payment-link-matrix.md`

## C. Accounts & integrations (Phase 8/14)

- [ ] Register domain `meridianra.com` (Cloudflare or Namecheap) + DNS
- [ ] Create email provider (Resend/SendGrid) + transactional domain
- [ ] Create CRM: HubSpot (free tier) or Airtable base per `16-crm/crm-mapping.md`
- [ ] Create scheduling: Cal.com account
- [ ] Create e-sign: DocuSign / PandaDoc / Dropbox Sign
- [ ] Provision n8n (self-host or cloud) / Azure Logic Apps
- [ ] API keys: LLM provider(s), Crunchbase, Clearbit/Hunter/Apollo, BuiltWith
- [ ] Web analytics: Plausible or GA4 on the site
- [ ] Accounting sync: QuickBooks or Xero
- [ ] Password manager: Bitwarden/1Password vault; store all credentials (never in git)

## D. Infrastructure

- [ ] Deploy dashboard (`15-dashboards/`) behind auth; wire to `kpi_log`
- [ ] Deploy workflow runbooks (`17-ops/workflows/`) on schedule per `17-ops/schedules/cron-schedule.md`
- [ ] Stand up SQLite DB (`16-crm/schema.sql`) + nightly KPI rollup (WF-OP-03)
- [ ] Stand up knowledge vector store for RAG retrieval
- [ ] Set up backups + security (Sentinel checklist: `01-departments/20-security.md`)

## E. Go-live sequence (Meridian agents execute once A–D done)

1. Research engine live (WF-RS-01, WF-RS-02)
2. First lead-gen campaign (WF-LG-01 → WF-LG-05) — 50 A/B-tier accounts
3. Marketing baseline: site, newsletter (WF-MK-02), 3 lead magnets
4. Sales pipeline open + discovery slots (Cal.com)
5. First engagement end-to-end via `05-delivery/project-lifecycle.md`
6. Daily retro running (WF-OP-01) + dashboards green

## F. Continuous (monthly)

- [ ] Pricing review + scoring-weight calibration
- [ ] Risk register review (`10-legal/risk-register.md`)
- [ ] Tax prep pack (WF-FN-06) — owner files
- [ ] Compliance checklist (`10-legal/compliance-checklist.md`)

## First-week targets after go-live

- 50 A-tier leads engaged · 1 signed client · newsletter live · dashboards live · 100% critical workflows passing
