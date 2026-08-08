# n8n Deployment Guide — Meridian OS

> Version 1.0 · Owned by Cog · Recommended default workflow engine.

## 1. Provision n8n

- **Self-host (recommended):** Docker on a VPS or the owner's infra.
  `docker run -it --rm -p 5678:5678 -v n8n_data:/home/node/.n8n -e N8N_BASIC_AUTH_ACTIVE=true -e N8N_BASIC_AUTH_USER=<admin> -e N8N_BASIC_AUTH_PASSWORD=<strong> n8nio/n8n`
- **Cloud:** n8n cloud subscription (fastest; owner account).

## 2. Configure environment & credentials

- Copy `credentials-env.template` → runner env; fill real keys in the secrets vault.
- Create n8n **Credential nodes** for: HTTP Header Auth (API keys), Postgres/SQLite, Stripe, Resend/SendGrid, HubSpot. Never paste secrets into workflow JSON.
- Set timezone to UTC and enable `N8N_ENCRYPTION_KEY` persistence.

## 3. Import workflows

1. n8n UI → Workflows → **Import from File** → `n8n-workflows/wf-lg-01-*.json` and `wf-fn-03-*.json`.
2. On import, fix any **typeVersion/parameter drift** flagged by the editor — align to the runbook spec in `17-ops/workflows/`.
3. Wire credential nodes to each HTTP/DB node.

## 4. Runbook → node mapping (reference)

| Runbook step | n8n node type |
|---|---|
| Schedule/cron | `scheduleTrigger` (cronExpression) |
| Call API (sources, Stripe, Resend, HubSpot) | `httpRequest` |
| Transform/normalize | `code` |
| Write records | `postgres` / `sqlite` / `executeQuery` |
| Condition/branch | `if` / `switch` |
| Failure handling | `errorTrigger` + `if` retry |
| Notify | `slack` / `emailSend` |
| No-op end | `noOp` |

## 5. Schedule alignment

Apply `17-ops/schedules/cron-schedule.md`:
- Daily 02:00 UTC → WF-LG-01 source pulls
- Daily 00:00 UTC → WF-FN-03 MRR rollup
- Daily 20:00 UTC → WF-OP-01 retro
- Friday 10:00 UTC → WF-RS-02 weekly brief
- Friday 16:00 UTC → WF-MK-02 newsletter

## 6. Observability & alerting

- Every workflow ends with a `code` node that logs `{wf_id, status, ran_at}` to `kpi_log`.
- On failure: `errorTrigger` → retry (3×) → notify Slack `#ops-alerts` → auto-escalate to Cog after 2 consecutive failures.
- Uptime target: ≥99% for revenue-critical workflows.

## 7. Security

- n8n behind auth; enable HTTPS (reverse proxy with TLS).
- Secrets only via env/credential nodes; encrypt the n8n DB.
- Weekly access review (Sentinel) per `01-departments/20-security.md`.

## Related

`README.md` (deployment) · `../../17-ops/schedules/cron-schedule.md` · `../../14-integrations/integration-matrix.md`
