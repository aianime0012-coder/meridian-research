-- ============================================================
-- Meridian Research & Advisory — CRM + Ops Database Schema
-- SQLite (portable, zero-cost). Maps to HubSpot/Airtable.
-- See 16-crm/crm-mapping.md for platform mapping.
-- Version 1.0
-- ============================================================

PRAGMA journal_mode = WAL;
PRAGMA foreign_keys = ON;

-- ---------- Core entities -----------------------------------

CREATE TABLE IF NOT EXISTS companies (
  id                INTEGER PRIMARY KEY AUTOINCREMENT,
  company_name      TEXT NOT NULL,
  domain            TEXT UNIQUE,                -- normalized, dedupe key
  industry          TEXT,
  employee_band     TEXT,                        -- 1-9/10-49/50-199/200-500/500+
  hq_country        TEXT,
  hq_city           TEXT,
  revenue_band      TEXT,
  funding_total_usd INTEGER,
  last_funding_date TEXT,
  tech_stack        TEXT,                        -- JSON array
  ai_signals        TEXT,                        -- JSON array of {signal, source, date}
  pain_points       TEXT,                        -- JSON array of {pain, evidence}
  budget_estimate_usd INTEGER,
  budget_confidence TEXT,                        -- low/med/high
  icp_fit_score     INTEGER,
  pain_score        INTEGER,
  budget_score      INTEGER,
  accessibility_score INTEGER,
  timing_score      INTEGER,
  fit_score         INTEGER,
  tier              TEXT CHECK (tier IN ('A','B','C','D')),
  source_channel    TEXT,
  status            TEXT DEFAULT 'discovered',   -- discovered|ready|engaged|archived
  discovered_at     TEXT DEFAULT (datetime('now')),
  last_scored_at    TEXT,
  created_at        TEXT DEFAULT (datetime('now')),
  updated_at        TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS contacts (
  id              INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id      INTEGER NOT NULL REFERENCES companies(id) ON DELETE CASCADE,
  contact_name    TEXT NOT NULL,
  role            TEXT,
  role_priority   INTEGER,                       -- 1=P1 pain-owner ... 3
  email           TEXT,
  email_source    TEXT,
  linkedin_url    TEXT,
  phone           TEXT,
  engagement_state TEXT DEFAULT 'new',           -- new|touched|replied|meeting|won|lost
  opted_out       INTEGER DEFAULT 0,
  created_at      TEXT DEFAULT (datetime('now')),
  updated_at      TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS deals (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id    INTEGER NOT NULL REFERENCES companies(id),
  service       TEXT,                            -- sprint|intel|research|advisory|product|training
  pipeline_stage TEXT DEFAULT 'lead',            -- lead|sql|discovery|proposal|negotiation|won|lost
  amount_usd    INTEGER,
  probability   REAL,
  expected_close TEXT,
  next_action   TEXT,
  next_action_date TEXT,
  sequence_id   INTEGER,
  won_at        TEXT,
  lost_at       TEXT,
  lost_reason   TEXT,
  created_at    TEXT DEFAULT (datetime('now')),
  updated_at    TEXT DEFAULT (datetime('now'))
);

-- ---------- Engagement tracking -----------------------------

CREATE TABLE IF NOT EXISTS activities (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  deal_id     INTEGER REFERENCES deals(id),
  company_id  INTEGER REFERENCES companies(id),
  contact_id  INTEGER REFERENCES contacts(id),
  type        TEXT,                             -- touch|open|click|reply|note|meeting|email|linkedin
  channel     TEXT,                             -- email|linkedin|call|manual
  content     TEXT,
  outcome     TEXT,
  at          TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS sequences (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  name          TEXT,
  steps         TEXT,                            -- JSON: [{day, channel, template, cta}]
  version       INTEGER DEFAULT 1,
  active        INTEGER DEFAULT 1,
  created_at    TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS sequence_runs (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  sequence_id INTEGER REFERENCES sequences(id),
  contact_id  INTEGER REFERENCES contacts(id),
  deal_id     INTEGER REFERENCES deals(id),
  current_step INTEGER DEFAULT 0,
  state       TEXT DEFAULT 'running',            -- running|paused|completed|replied|bounced|opted_out
  started_at  TEXT DEFAULT (datetime('now')),
  updated_at  TEXT DEFAULT (datetime('now'))
);

-- ---------- Finance / subscriptions -------------------------

CREATE TABLE IF NOT EXISTS subscriptions (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  deal_id        INTEGER REFERENCES deals(id),
  company_id     INTEGER REFERENCES companies(id),
  plan           TEXT,                           -- starter_intel|scale|enterprise_watch
  mrr_usd        INTEGER,
  status         TEXT DEFAULT 'active',          -- active|past_due|canceled|trialing
  start_at       TEXT,
  renew_at       TEXT,
  stripe_sub_id  TEXT,
  created_at     TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS invoices (
  id             INTEGER PRIMARY KEY AUTOINCREMENT,
  company_id     INTEGER REFERENCES companies(id),
  deal_id        INTEGER REFERENCES deals(id),
  subscription_id INTEGER REFERENCES subscriptions(id),
  stripe_inv_id  TEXT,
  amount_usd     INTEGER,
  status         TEXT,                           -- draft|open|paid|void|uncollectible
  due_at         TEXT,
  paid_at        TEXT,
  created_at     TEXT DEFAULT (datetime('now'))
);

-- ---------- Ops / knowledge --------------------------------

CREATE TABLE IF NOT EXISTS engagements (
  id            INTEGER PRIMARY KEY AUTOINCREMENT,
  deal_id       INTEGER UNIQUE REFERENCES deals(id),
  workspace      TEXT,
  kickoff_at    TEXT,
  milestones     TEXT,                           -- JSON
  status         TEXT DEFAULT 'setup',           -- setup|delivery|qa|delivered|archived
  created_at     TEXT DEFAULT (datetime('now')),
  updated_at     TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS kpi_log (
  id          INTEGER PRIMARY KEY AUTOINCREMENT,
  metric      TEXT NOT NULL,
  value       REAL NOT NULL,
  period      TEXT NOT NULL,                     -- YYYY-MM or YYYY-MM-DD
  source      TEXT,
  recorded_at TEXT DEFAULT (datetime('now')),
  UNIQUE(metric, period)
);

-- ---------- Indexes -----------------------------------------

CREATE INDEX IF NOT EXISTS idx_companies_tier ON companies(tier);
CREATE INDEX IF NOT EXISTS idx_companies_domain ON companies(domain);
CREATE INDEX IF NOT EXISTS idx_contacts_company ON contacts(company_id);
CREATE INDEX IF NOT EXISTS idx_deals_stage ON deals(pipeline_stage);
CREATE INDEX IF NOT EXISTS idx_deals_company ON deals(company_id);
CREATE INDEX IF NOT EXISTS idx_activity_deal ON activities(deal_id);
CREATE INDEX IF NOT EXISTS idx_activity_at ON activities(at);
CREATE INDEX IF NOT EXISTS idx_kpi_period ON kpi_log(period);
