# CRM & Database — Meridian Research & Advisory

> Owned by Forge (Engineering) · Canonical schema + platform mapping.

## Files

| File | Purpose |
|---|---|
| `schema.sql` | Canonical SQLite schema (companies, contacts, deals, activities, sequences, subscriptions, invoices, engagements, kpi_log) |
| `crm-mapping.md` | Mapping to HubSpot/Airtable + sync rules |

## Use

- **Bootstrap DB:** `python -c "import sqlite3; con=sqlite3.connect('meridian.db'); con.executescript(open('schema.sql',encoding='utf-8').read())"`
- **Validate schema:** same command in a temp DB (used by CI/verification).
- **No sqlite3 CLI needed** — Python stdlib `sqlite3` is the portable fallback (IMP-001).

## Conventions

- Canonical DB is the source of truth; CRMs are upsert views (`crm-mapping.md`).
- Never store secrets or client card data in the DB.
- Append-only activity log; retention: archive (not delete) records >12mo inactive.

## Related

`02-leadgen/crm-record-spec.md` · `14-integrations/integration-matrix.md`
