# Domain & Web Presence Plan — Meridian Research & Advisory

> Version 1.0 · Owner action required: register domains + create accounts.

## Primary domains (recommended)

| Domain | Use | Status |
|---|---|---|
| `meridianra.com` | **Primary website** (marketing + client portal) | PENDING — register |
| `meridianra.co` | Brand protection / redirect | PENDING — optional |
| `meridianresearch.com` | Alternate brand term | Likely taken — verify |
| `meridianra.io` | Product/API surface (Meridian OS public tools) | PENDING — optional |

Domain registrar: Cloudflare (recommended, no-cost registrar + DNS + CDN) or
Namecheap. DNS at Cloudflare for free CDN/HTTPS/email routing.

## Website structure (meridianra.com)

```
/                      Landing: value prop, services, evidence, CTA (book a 15-min fit call)
/services              Service catalog + pricing bands
/method                Methodology (QA standards, evidence-first)
/insights              Blog + research library (SEO engine — 04-marketing/)
/resources             Lead magnets: AI Readiness Scorecard, industry snapshots
/case-studies          Anonymized client outcomes
/pricing               Transparent pricing + bundles
/contact               Booking link (Cal.com/Calendly) + support inbox
/legal                Privacy, Terms, Cookies, DPA, IP (10-legal/)
/app                   Client portal: dashboards, briefs, invoices (locked)
```

## Stack for web presence (defaults, changeable)

| Need | Choice | Alternative |
|---|---|---|
| Website | Astro/Next.js static on Cloudflare Pages or Vercel | WordPress |
| Email | Resend (transactional) + custom domain | SendGrid, Postmark |
| Booking | Cal.com (self-hosted option) | Calendly |
| Analytics | Plausible (privacy-friendly) | GA4 |
| Payments | Stripe (Checkout + Billing + Customer Portal) | PayPal |
| Client portal | Stripe portal + shared dashboards (`15-dashboards/`) | Notion sites |

## Account registry (owner action)

All accounts are created under the owner's email; credentials live in the
company vault (Bitwarden/1Password — never plaintext). See
`18-status/launch-checklist.md` for the full registry.

## Domain decisions

- **Decision:** register `meridianra.com` first; `meridianra.co` defensively.
- **Decision:** serve everything HTTPS-only via Cloudflare.
- **Decision:** use a `.com` for the primary site for trust; `.io` reserved for product tooling.

## Related

`branding.md` · `04-marketing/` · `18-status/launch-checklist.md`
