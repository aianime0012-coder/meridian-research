# Outreach Sequence Generation Spec — Meridian Research & Advisory

**Purpose:** The exact spec for generating and running the standard 6-touch / 14-day outreach sequence (email + LinkedIn mix), the 3-touch warm-reply follow-up, message rules, variable fields, tone, spam-safety, and the A/B test plan.
**Owner:** Lead Gen Dept. **Consumes:** the researched record (research-playbook.md). **Outputs:** queued, personalized touches in the CRM/outreach tool.

---

## 1. The standard 6-touch / 14-day sequence

Default schedule, in calendar days from `day 0` (first touch). Mix = 4 email + 2 LinkedIn.

| Touch | Day | Channel | Type | Goal / CTA |
|---|---|---|---|---|
| 1 | 0 | Email | Cold open, signal-first | Reply to a question, or book 15-min intro |
| 2 | 2 | LinkedIn | Connection request + short note (signal-first) | Connect; no pitch in the request |
| 3 | 4 | Email | Value drop: 1 evidence-based insight for *their* situation | Reply: "worth a chat?" |
| 4 | 7 | Email | Case-study / proof pattern (similar company, anonymized) | Reply or book |
| 5 | 10 | LinkedIn | Follow-up DM (only if connected) + content share tagged to their signal | "Still relevant?" reply |
| 6 | 14 | Email | Final, polite break-up with soft CTA | Reply "not now" to stay in nurture |

**Rules of the sequence:**
- No more than 6 touches; day-14 is the terminal touch. After it, record goes to `done_no_reply` and can be re-entered only after a new signal appears (new funding, new AI role, new launch).
- Between touches, **do not send anything else** to the same contact unless they reply.
- If the prospect replies at any point, the sequence stops and the warm-reply follow-up (Section 2) takes over.
- Each email is written from a **template** + a **personalized-first-line**; the body must read human, not templated.

---

## 2. Warm-reply 3-touch follow-up

Triggered when a reply is received (any channel). 3 touches over ~6 days.

| Touch | Timing | Channel | Type |
|---|---|---|---|
| 1 | ≤24h after reply (SLA, see follow-up-scheduling.md) | Reply channel | Answer the reply fully; 1 clear CTA (book time / send 1-page value note) |
| 2 | 3 days after last exchange | Same channel | Nudge with a specific, useful artifact (mini-insight, sample, case study) tied to their question |
| 3 | 6 days after last exchange | Alternate channel | "Still interested?" — soft close, or offer nurture if timing is bad |

**Rules:** never send a follow-up without substance (artifact > reminder). If they book a call, stop the sequence — handoff to Sales (see follow-up-scheduling.md).

---

## 3. Message rules

### 3.1 Personalized-first-line rule (non-negotiable)
- The **first sentence** of touch 1 must reference a **verified signal** (HIGH/MED confidence, dated) from the research record — e.g., the Series A announced on a specific date, the AI Platform role they're hiring, their recent Product Hunt launch, the LLM API job post.
- Format: `[Signal] + [1-line why it matters to them]`. Example: *"Saw Meridian Labs closed a $12M Series A in March — congrats. When teams scale that fast, AI strategy usually bottlenecks first."*
- Forbidden: "Hope you're well", "As an industry leader", company-name-only openers, or any unverified inference.
- LinkedIn connection requests: signal-first note too, ≤200 chars.

### 3.2 CTA per touch
- Touch 1: a single question (reply-friendly) or 15-min intro. Never a calendar link on the first touch — ask first.
- Touch 3/4: one CTA only (reply or 15-min). Calendar link allowed from touch 4 onward.
- Touch 6: "not now?" soft exit — keeps them in monthly nurture.

### 3.3 Variable field spec (personalization tokens)
Tokens are rendered from the research record. All must be validated non-empty before send; a send with an empty token is blocked.

| Token | Source field | Example |
|---|---|---|
| `{{company}}` | company.name | Meridian Labs |
| `{{first_name}}` | dm.name | Sarah |
| `{{exec_title}}` | dm.title | Head of Strategy |
| `{{signal}}` | pain.evidence (dated) | $12M Series A, March |
| `{{signal_url}}` | pain.evidence_url | crunchbase.com/... |
| `{{pain}}` | pain.hypothesis | scaling AI without a strategy |
| `{{pain_weight}}` | pain.weight | 9/10 |
| `{{budget_band}}` | financials.budget_band | medium |
| `{{dm_signal}}` | dm.dm_signal | your talk at AI Summit |
| `{{service}}` | chosen offer | AI Strategy Sprint |
| `{{sibling_case}}` | case-study lookup (similar size+industry) | anonymized case |

**Render rules:** never stack more than 3 tokens per email; token text must read naturally in context; dates always full (e.g., "March 2026"), never relative.

---

## 4. Tone rules (brand: clear, evidence-first, no hype)

- **Register:** concise, specific, calm. Professional business English (or matched language for non-EN targets).
- **Evidence-first:** every claim about *them* carries the signal; every claim about *us* is a fact or a case, not an adjective ("we help" > "we're world-class").
- **No hype:** no exclamation stacking, no "game-changer", no superlatives, no urgency gimmicks ("last chance").
- **Length:** email body ≤120 words; LinkedIn notes ≤200 chars; break-up touch ≤90 words.
- **One idea per touch.** No menus of services. Pick the single offer that matches `pain` + `budget_band` (e.g., pain=early-stage AI build → AI Strategy Sprint; pain=ongoing intel need → Intelligence Subscription; pain=scale → Fractional Advisory).
- **Human cadence:** emails spaced (2–4 days), sent business hours in the prospect's timezone, one channel at a time, person-signed with a real name and title.

---

## 5. Spam-safety rules

- **Volumes:** no more than ~60 new cold emails/day/sending-domain (domain warmed first); max ~20 connection requests/day/account (LinkedIn limit). New domains warmed 2 weeks before cold sending.
- **Health gates:** if bounce >3% or reply-unsubscribe >0.3% on a domain, pause that domain and re-warm. Hard-bounce suppression on first bounce; soft-bounce retry max 2×.
- **Humanizing:** personalized-first-line (3.1), natural timing, no identical subject line reuse beyond ~5% of sends, individual send (no batch "to-all" headers), signed by a person, trackable replies to a monitored inbox, not a no-reply address.
- **CAN-SPAM compliance (US sends):** every email includes (a) valid physical postal address of Meridian Research & Advisory, (b) functional one-click unsubscribe/opt-out link, (c) clear "sender is Meridian Research & Advisory" identification, (d) accurate, non-misleading subject line. Honors opt-out within 10 business days, permanently.
- **GDPR/global:** for EU/UK recipients rely on legitimate-interest assessment; always offer opt-out and honor it; never send to someone who opted out; keep a suppression list. No scraping-derived personal data (see sources.md governance).
- **Reply management:** no-reply addresses forbidden; all replies route to the owner + outreach tool for SLA tracking.

---

## 6. A/B test plan

Test matrix — one experiment at a time, minimum ~200 sends per arm (across the weekly cohort) before judging.

| Experiment | Variants | Metric | Minimum run |
|---|---|---|---|
| Subject line style | (A) Signal-fronted: "re: your $12M round" vs (B) Question: "Who owns AI strategy at {{company}}?" vs (C) Plain: "Meridian Labs + {{signal}}" | Reply rate | 200/arm |
| First-line signal type | Funding signal vs hiring signal vs launch signal (same body) | Reply rate | 200/arm |
| CTA type | (A) "reply and I'll send 2 pages" vs (B) "15-min intro?" vs (C) "worth a chat?" | Meeting booked / reply | 200/arm |
| Body length | ~60-word micro vs ~120-word standard | Reply rate | 200/arm |
| Channel order | Email-first (standard) vs LinkedIn-first | Reply rate, connect acceptance | 100/arm |
| Offer match | AI Strategy Sprint vs Intelligence Subscription (matched to pain) | Meeting booked | 150/arm |

**Rules:**
- Only one variable changes per experiment; everything else frozen.
- Record `variant_id` on every sent message for reporting; results feed a weekly standing experiment dashboard.
- Winners roll into the default sequence; losers are retired; hold-out control arm kept in every cycle.
- Statistical bar: p < 0.05 or ≥2× difference before rollout; otherwise continue.
- Never A/B on a real prospect's *first* touch using compliance-sensitive content (unsubscribe/address always present in all arms).

---

## 7. Sequence generation checklist (per record)

- [ ] Record passed scoring gate (A/B tier) — sequence tier matches record tier.
- [ ] Personalized-first-line built from a HIGH/MED dated signal.
- [ ] Single offer chosen (pain + budget_band matched); one CTA per touch.
- [ ] All tokens validated non-empty; render previewed for natural language.
- [ ] Tone check: evidence-first, no hype, ≤120 words, one idea.
- [ ] Spam-safety gates cleared (domain health, volume headroom, suppression check, opt-out honored).
- [ ] CAN-SPAM block present on every email (address, unsubscribe, sender ID, truthful subject).
- [ ] Schedule computed in prospect timezone; 6 touches/14 days; channel mix 4+2.
- [ ] Variant_id assigned; analytics event queued.
- [ ] Sent to queue; replied/bounced/opted-out routing rules active.
