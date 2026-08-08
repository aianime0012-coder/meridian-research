# Deployment — Meridian OS Workflows

> Version 1.0 · Owned by Cog (Automation) + Forge (Engineering) · Turn the
> workflow runbooks (`17-ops/workflows/`) into running jobs.

## What's here

| File | Purpose |
|---|---|
| `n8n-deployment.md` | Step-by-step n8n deployment + runbook→node mapping |
| `logic-apps-deployment.md` | Azure Logic Apps alternative (ARM template) |
| `n8n-workflows/wf-lg-01-lead-source-pull.json` | Importable n8n starter (WF-LG-01) |
| `n8n-workflows/wf-fn-03-mrr-rollup.json` | Importable n8n starter (WF-FN-03) |
| `credentials-env.template` | Environment/credential variables (no secrets) |

## Ground rules

- **Runbook markdown is the source of truth** (`17-ops/workflows/*.md`); the JSON
  files are import *starters* — node parameter JSON can drift between n8n
  versions, so validate on import and align to the runbook spec.
- **Never commit secrets.** Credentials live in the vault (Bitwarden/1Password)
  or as n8n credential nodes / env vars on the runner — never in git.
- Every workflow must log its outcome to `kpi_log` (WF-OP-03 refreshes boards).
- Failure policy: retry 3× with backoff → alert → escalate to Cog → COO.

## Deploy order (dependency-aware)

1. **DB** — run `16-crm/schema.sql` (SQLite/Postgres) on the runner.
2. **Credentials** — populate `credentials-env.template` → secrets store.
3. **WF-FN-03 (MRR rollup)** — first (nothing else to show without numbers).
4. **WF-LG-01 (source pulls)** + **WF-LG-03 (scoring)** — pipeline feed.
5. **WF-DV-04 (QA gate)** + **WF-SL-03 (proposal)** — delivery loop.
6. **WF-RS-01/02 (signals + brief)** + **WF-MK-02 (newsletter)** — content loop.
7. **WF-OP-01 (daily retro)** + **WF-OP-03 (KPI refresh)** — close the loop.

## Provider choice

- **n8n** — self-host or cloud; richest library of connectors; recommended default.
- **Azure Logic Apps** — if the owner prefers Microsoft stack or SLA/compliance
  needs Azure; JSON/ARM based (see `logic-apps-deployment.md`).
- Both implement the same runbooks; the runbooks are platform-agnostic.

## Validation before production

- Dry-run each workflow with mock data; verify it writes to `kpi_log`.
- Tag revenue-critical workflows (WF-FN-*, WF-DV-*, WF-SL-*) for 24/7 alerting.
- Record go-live in `18-status/implementation-status.md` and `00-company/decision-log.md`.

## Related

`../../07-automation/automation-system.md` · `../../07-automation/workflow-catalog.md` · `../../14-integrations/integration-matrix.md`
