# Azure Logic Apps Deployment — Meridian OS

> Version 1.0 · Owned by Cog · Alternative to n8n when the owner prefers the
> Microsoft stack (SLA, compliance, existing Azure tenancy).

## When to choose Logic Apps

- Owner already runs Azure and wants managed service + 99.9% SLA.
- Compliance requires Azure-native auditing, identity (Entra ID), or DPA coverage.
- Otherwise default to n8n (cheaper, richer connector set, easier iteration).

## Architecture

```
Recurrence trigger → HTTP (source/Stripe/Resend) → Parse JSON / Data Operations
→ Condition (retry/alert) → SQL Server/Azure SQL (kpi_log) → Notification
```

Equivalent primitives to n8n nodes: `Recurrence` (schedule), `HTTP`,
`Compose`/`Parse JSON` (transform), `Condition`, `Insert row` (SQL),
`Send email` (Office 365), `Slack`.

## Deployment steps

1. Create a Resource Group in Azure (owner account).
2. Deploy the ARM template below (or use the Logic Apps designer to build from
   the runbook spec in `17-ops/workflows/`).
3. Wire managed identities / secrets via Azure Key Vault (never plaintext).
4. Set schedules per `17-ops/schedules/cron-schedule.md` (Recurrence uses UTC).
5. Enable Application Insights for run failures → alert to Slack/email.

## Starter ARM template (skeleton — extends with steps per runbook)

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-01-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "logicAppName": { "type": "string", "defaultValue": "meridian-wf-fn-03" },
    "sqlConnectionString": { "type": "string" }
  },
  "resources": [
    {
      "type": "Microsoft.Logic/workflows",
      "apiVersion": "2019-05-01",
      "name": "[parameters('logicAppName')]",
      "location": "[resourceGroup().location]",
      "properties": {
        "state": "Enabled",
        "definition": {
          "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
          "actions": {
            "call_stripe": {
              "type": "Http",
              "inputs": {
                "method": "GET",
                "uri": "https://api.stripe.com/v1/subscriptions?status=active",
                "headers": { "Authorization": "Bearer [[STRIPE_API_KEY]]" }
              },
              "runAfter": {}
            },
            "insert_kpi": {
              "type": "Sql",
              "inputs": {
                "procedureName": "UpsertKpiLog",
                "server": "[[SQL_SERVER]]",
                "database": "[[SQL_DB]]"
              },
              "runAfter": { "call_stripe": ["Succeeded"] }
            }
          },
          "triggers": {
            "recurrence": {
              "type": "Recurrence",
              "recurrence": { "frequency": "Day", "interval": 1 }
            }
          }
        }
      }
    }
  ]
}
```

> `[[...]]` are placeholders; replace with Key Vault references
> (`@Microsoft.KeyVault(SecretUri=...)`) before deployment. This is a skeleton —
> the production workflow follows the runbook in `17-ops/workflows/`.

## Notes

- ARM `Sql` action requires an API connection; create via the designer once, then export.
- Recurrence offsets to UTC; DST-safe.
- Run history + Application Insights give the uptime/health feed for `15-dashboards/ops.html`.

## Related

`README.md` (deployment) · `../../07-automation/automation-system.md`
