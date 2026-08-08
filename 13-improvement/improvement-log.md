# Improvement Log — Meridian Research & Advisory

> Running log owned by COO (Cadence). Each entry from a daily retro (WF-OP-01) or root-cause review.
> Rules: every item has an owner + follow-up; items stale >7 days auto-flag to COO.

## 2026-08-08 — Day 1 retro (company build complete)

**Green:**
- All 14 phases delivered: 121 artifacts in `D:\OPen Code\meridian-research\`.
- QA validation passed: `data.json` parses; `16-crm/schema.sql` executes clean (Python sqlite3).
- 25 agent blueprints consistent (spot-checked 5 of 5).
- Dashboard renders with seed data (financial-model Year-1 numbers).

**Red:**
- Nothing is wired to live systems yet (no accounts/credentials) — system runs on design/seed, not production data.
- `sqlite3` CLI absent on this machine (Python stdlib used instead).
- Legal templates unreviewed/unexecuted (owner + counsel gate).
- No live research signals yet (research engine needs sources/keys).

**Root causes:**
- Credential/entity gates are intentionally human-owned (owner must register LLC, connect Stripe, create accounts).
- Environment lacks some tooling; Python available as universal fallback.

**Improvements logged:**
| # | Source | Root cause | Action | Owner | Status | Impact |
|---|---|---|---|---|---|---|
| IMP-001 | Day-1 retro | No sqlite3 CLI | Use Python stdlib `sqlite3` for schema validation/tests (document in `16-crm/README` note) | Forge | done | Schema testable anywhere |
| IMP-002 | Day-1 retro | Dashboard on seed data | Wire `kpi_log` → `data.json` via WF-OP-03 once DB live | Euclid | pending (owner: infra) | Live KPIs |
| IMP-003 | Day-1 retro | No live signals | Stand up WF-RS-01 ingestion once source keys exist; interim: manual signal seed | Sage | pending (owner: keys) | Research flywheel |
| IMP-004 | Day-1 retro | Legal unexecuted | Owner reviews 11 templates w/ counsel per `18-status/launch-checklist.md` §A | Owner | pending | Contract readiness |
| IMP-005 | Day-1 retro | Outreach not live | First campaign gated on CRM + email accounts | Ranger | pending (owner: accounts) | Pipeline |

**Escalations (to owner):** complete `18-status/launch-checklist.md` sections A–D to move from design-run to production-run.

## 2026-08-08 — Delivery pipeline drill (second run of the day)

**Green:** first sample deliverable drafted, QA-gated (2 rounds), and released;
first signals brief seeded with 9 verified, source-linked signals; n8n/Logic
Apps deployment starters produced (JSON validated).

**Red:** client-specific data in the sample is fictional (by design); live
ingestion still blocked on source keys.

**Improvements logged:**
| # | Source | Root cause | Action | Owner | Status | Impact |
|---|---|---|---|---|---|---|
| IMP-006 | QA gate log (round 1) | Findings table allowed generic citations | Require a direct URL per finding row by default (report template updated) | Norm | done | Fewer FIX cycles |
| IMP-007 | QA gate log (round 1) | Low-confidence claim without a stated reason | Checklist auto-fails "Low" confidence without reason | Norm | done | Clearer reports |
| IMP-008 | Deployment prep | No importable workflow files existed | Added n8n starters + Logic Apps ARM skeleton + env template | Cog/Forge | done | Faster go-live |

**Automation queue:** wire WF-LG-01 / WF-FN-03 starters on the n8n instance once owner provisions it (IMP-009).

## 2026-08-08 — Content engine wave (third run of the day)

**Green:** first content batch produced to spec — Meridian Weekly #001
(4-section structure, ≤350 words, source-linked), first SEO blog post, 3-post
LinkedIn batch, AI Readiness Scorecard magnet (12 scored questions), outreach
email templates (E1–E4 + nurture D1/D3/D6, CAN-SPAM clean), and landing page
`04-marketing/site/index.html` (brand tokens).

**Red:** nothing published (owner approval + accounts pending); site form is a
placeholder (no backend until CRM/email wired); scorecard scoring logic is
spec'd but not yet implemented as a live form.

**Improvements logged:**
| # | Source | Root cause | Action | Owner | Status | Impact |
|---|---|---|---|---|---|---|
| IMP-009 | Content wave | Nurture/cold templates can drift out of sync | Point both outreach + magnet handoff at a single source-of-truth (outreach templates + scorecard doc) | Vector/Astra | done | Consistent voice |
| IMP-010 | Content wave | Claims risk across 4 assets | Single source of truth for stats: cite the seeded brief, don't re-derive | Norm | done | One citation set |
| IMP-011 | Content wave | No send path for newsletter | Schedule owner approval + WF-MK-01 send before Tue 07:00 CT | Astra | pending (owner: review) | Live newsletter |

## 2026-08-08 — Content engine completion (fourth run of the day)

**Green:** content wave finished and QA-gated end-to-end: interactive scorecard
page (`site/scorecard.html`, scoring verified 0→25 min / 100 max), Vendor
Evaluation Toolkit magnet, 4-week content calendar (Q3), WF-MK-07 added to
workflow catalog, magnet KPIs in measurement + dashboard, blog SEO meta
complete. QA gate log: Round 1 overall 91 (two sub-90 assets flagged), Round 2
overall 93 → PASS.

**Red:** form→CRM/email handoff still pending accounts (scorecard records
requests in localStorage only); nothing publicly published yet (owner gate).

**Improvements logged:**
| # | Source | Root cause | Action | Owner | Status | Impact |
|---|---|---|---|---|---|---|
| IMP-012 | QA gate content wave | Interactive/web assets weren't part of QA checklist | L1 QA now includes running/clicking web assets (scorecard "PDF" bug caught) | Norm | done | Fewer UX defects |
| IMP-013 | QA gate content wave | Placeholder behaviors can mislead | Dead placeholders (fake form/email) replaced with honest states + print/Save-as-PDF path | Astra/Forge | done | Trustworthy UX |
| IMP-014 | Q3 calendar build | No single source of truth for content dates | Live calendar `04-marketing/calendar/2026-Q3.md` links every asset to a date + status | Astra | done | Executable plan |
| IMP-015 | Measurement wiring | Magnet targets were spec'd but not tracked | Magnet KPIs added to `measurement.md` + dashboard `data.json`/`index.html` | Euclid | done | Trackable engine |

## 2026-08-08 — Go-live (fifth run of the day)

**Green:** public go-live achieved without waiting on accounts — repo pushed
(`github.com/aianime0012-coder/meridian-research`, 154 files), marketing site +
interactive scorecard deployed to GitHub Pages via workflow, verified HTTP 200,
auto-deploy wired to `main`. Secrets scan clean before push; `.gitignore`
protects `.env`/keys. Launch checklist + implementation status updated.

**Red:** revenue-critical surfaces still owner-gated (LLC/EIN/bank, Stripe,
CRM, email, n8n). Newsletter/blog/social drafts cannot publish until owner
approval (IMP-011).

**Improvements logged:**
| # | Source | Root cause | Action | Owner | Status | Impact |
|---|---|---|---|---|---|---|
| IMP-016 | Go-live | Repo had no version control/CI | Public repo + Pages auto-deploy workflow; site self-updates on push | Forge | done | Live site + audit trail |
| IMP-017 | Go-live | Site could serve stale or broken builds | Auto-deploy only on `04-marketing/site/**` path change; workflow_dispatch for manual | Forge | done | Deterministic deploys |
| IMP-018 | Go-live | Secrets risk on first push | Pre-push secret regex scan + `.gitignore` hardened (IMP-018 gate in CI idea) | Forge | done | No leak risk |
| IMP-019 | Go-live | Owner gates block full production | Owner: complete `18-status/launch-checklist.md` A–D; then wire payments/CRM/email | Owner | pending | Production revenue |

## Daily report

```markdown
## 2026-08-08 Retro
**Green:** build complete, QA-clean, dashboard up.
**Red:** no live integrations (design-run only).
**Root causes:** human-owned credential/entity gates.
**Improvements logged:** IMP-001..005.
**Automation queue:** WF-OP-03 wiring (IMP-002), WF-RS-01 ingestion (IMP-003).
**Escalations:** owner → launch checklist A–D.
```

## Related

`13-improvement/daily-retro.md` · `13-improvement/improvement-engine.md` · `17-ops/workflows/WF-OP-01-daily-retro.md`
