# Win/Loss Playbook — Meridian Research & Advisory

**Purpose:** Learn systematically from every deal. Win/loss analysis is Meridian's evidence-first culture applied to sales itself — decisions and positioning change on data, not anecdote.

**Output:** a monthly win/loss review that feeds positioning, marketing, lead scoring, pricing, and the outreach/proposal playbooks.

---

## 1. Data Collection

Data starts at the deal record, not the post-mortem. Capture as the deal moves; never reconstruct from memory.

### 1.1 CRM deal fields (mandatory at every stage)

| Field | Required at stage |
| --- | --- |
| Source (outbound/Inbound/referral/partner/expansion) | Lead |
| First touch date + channel | Lead |
| Signal used for first-line personalization | Lead |
| Discovery held (date, attendees) | Discovery |
| Problem quote (verbatim) | Discovery |
| Proposal sent (date) + version | Proposal |
| Options chosen (A/B/C) | Proposal |
| Final amount vs. list; concession tier | Negotiation |
| Subscription attached (yes/no + reason) | Negotiation |
| Stages + stage lengths (full history) | All |
| Win/loss reason (from survey, Section 2) | Won/Lost |
| Outcome date | Won/Lost |

### 1.2 Deal info required for any win/loss analysis

- Company: size band (10–50 / 51–250 / 251–500), industry
- Champion vs. decision maker vs. economic buyer — who was each
- Decision timeline (did it match their stated need?)
- Competition seen (none / internal build / named vendor) — log what they told us
- Cycle length in days (stage-by-stage)

**Discipline rule:** deals closed without a logged win/loss reason are flagged `Incomplete` in the monthly review. The analysis is only as good as the logging.

---

## 2. Survey Questions

Send within **48h of close**. Won: ask the happy client. Lost: ask the prospect — one short, polite email (templates in `/templates`). Keep it to 5 questions max, mostly structured with one open field. CAN-SPAM applies: opt-out + physical address.

### Won-survey (client):
1. What was the single most valuable reason you chose Meridian? *(open)*
2. How important were each to the decision (scale 1–5): evidence quality / speed / independence / price / relationship with us?
3. What almost stopped you? *(open — captures near-deal friction)*
4. Was the subscription (Option B) a natural fit, or a push? *(scale)*
5. What would have made us easier to buy from? *(open)*

### Lost-survey (prospect):
1. What did the winning option look like? *(open: vendor, internal, inaction)*
2. Where did we fall short? (scale: price / scope / credibility / timing / our process / other)
3. Was the decision about budget or value? *(single choice + open)*
4. At what stage did you decide against us, and why? *(stage + open)*
5. What should we know to serve you (or someone like you) better? *(open)*

**Non-response follow-up:** one reminder at day 7 max, then mark `Survey declined`. Never chase.

**Verbatim capture:** every open answer is stored verbatim in the deal record, tagged for reuse in marketing (with client consent before quoting).

---

## 3. Analysis Framework

Each quarter, analyze the closed-deal population (min. 20 deals or one full quarter, whichever is later) using this framework.

### 3.1 Distribution view
- Win rate by source, by segment (size band, industry), by offer
- Average deal size by segment and by option chosen
- Cycle length by segment and by outcome
- MRR attach % by outcome
- Concession usage vs. win rate

### 3.2 Theme extraction (the "3-why" pass)
For every loss, read the verbatim reason and ask:
1. Why did they say that? (surface reason)
2. What underlying signal is it? (e.g., "too expensive" → we over-scoped, or we anchored poorly, or wrong segment)
3. What would we change in positioning, offer, or process to remove it?

Cluster reasons into 3–5 themes max per review. Example themes:
- "Too expensive" → price/scope misalignment
- "Doing it internally" → value/independence not landed in discovery
- "Not now" → timing, poor qualification, or our cycle exceeded their budget window
- "Chose [vendor]" → positioning gap vs. competitor or credibility gap
- "No decision" → no economic buyer in the deal, weak champion

### 3.3 Wins pass (do the same for wins)
- What did we do right that we should repeat (and encode in playbooks)?
- Which signals in discovery predicted the win? (feeds lead scoring)
- Did we win despite the process or because of it?

---

## 4. Monthly Review Output

Run a 60-minute monthly review (same meeting every month, standing). Required attendees: head of sales, AE, Halo/CS lead, marketing lead. CEO reviews summary.

**Agenda & output artifacts:**

| Item | Output |
| --- | --- |
| Win/loss numbers (rate, size, cycle, attach) vs. targets | 1-page scorecard |
| Themes this month (from Section 3.2) | Theme list w/ evidence quotes |
| Actions from last month (check) | Status + owner |
| New actions (max 3, prioritized) | Named owner + date |
| Pipeline health flags (proposals >14d, red renewals) | Escalation list |

**Fixed targets to track on the scorecard:**
| Metric | Target |
| --- | --- |
| Win rate | ≥30% |
| Avg deal | ≥$6k |
| Cycle | ≤45 days |
| MRR attach | ≥60% |
| Renewal | ≥90% |

**Actions are owned and dated.** Unfinished actions carry over with the owner accountable. The review produces changes to playbooks — not just discussion.

---

## 5. Feedback Loop: Positioning & Marketing

Monthly review outputs feed the rest of the business with evidence:

- **Positioning:** loss themes (e.g., "why AI company") → rewrite the positioning lines in the outreach/proposal playbooks; new evidence quotes → marketing.
- **Messaging:** verbatim client language from wins/losses → new subject lines, first-line personalization signals, CTA variants (outreach playbook A/B test queue).
- **Offer design:** recurring "too expensive" → review pricing doc, bundling (proposal playbook), and concession ladder. Attach losses → review MRR discipline.
- **Case studies:** won surveys + value recaps (renewal playbook) → the case-study pipeline, always with client consent.
- **Competitive intel:** named competitors and why we lost → a standing `Competitive notes` doc reviewed quarterly.

**Hygiene:** every playbook change traced to a monthly review action is logged in the playbook revision history (bottom of file: date + what changed + why).

---

## 6. Feedback Loop: Lead Scoring

Win/loss findings upgrade the lead scoring model quarterly:

| Finding (example) | Scoring change |
| --- | --- |
| Wins concentrate in 51–250 employee band | Boost segment score |
| Wins correlate with "decision within 90 days" | Boost urgency signal |
| Losses correlate with no economic buyer | Deduct for missing budget holder signal |
| "Do it internally" losses | Deduct for companies with large in-house strategy/BI teams |
| Referrals win at higher rate | Referral source scores highest |

**Rule:** lead score changes come from data in the review, not intuition. Each change is logged with the evidence. Review the scoring model twice a year or when a data threshold is crossed (e.g., 20-deal dataset refresh).

---

## 7. Dashboard Metrics

The win/loss dashboard (CRM + BI) shows these, updated daily, reviewed monthly:

| Metric | Definition | Why it matters |
| --- | --- | --- |
| Win rate | Won ÷ (Won + Lost), rolling 90d | Primary target |
| Avg deal size | Mean won amount, rolling 90d | Primary target |
| Cycle length | Median days Lead→Won | Primary target |
| MRR attach | Won deals w/ subscription ÷ all won | Primary target |
| Renewal rate | Renewals ÷ renewals due | Primary target |
| Loss reasons | Distribution of survey themes | Positioning signal |
| Win rate by source | Won ÷ closed per source | Channel investment |
| Win rate by offer | Per service line | Offer design |
| Proposal → sign time | Median days | Process friction |
| At-risk accounts | Health-scored Red/Yellow (renewal playbook) | Retention alarm |

**Dashboard rule:** the monthly review reads the dashboard first, then the themes. If the numbers are off-target and the themes say why, the actions are clear. If the numbers are on-target, the review still runs — it protects against silent quality decay.
