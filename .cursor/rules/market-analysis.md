---
name: market-analysis
description: >
  Structured market and competitive analysis for product, strategy, and GTM decisions.
  Guides discovery, multi-source research, sizing, competitor mapping, trends, and
  executive-ready deliverables. Use when the user asks for market analysis, competitive
  landscape, TAM/SAM/SOM, industry research, market sizing, competitor comparison,
  GTM research, market trends, SWOT, Porter's Five Forces, ICP research, or "who are
  our competitors" — even if they do not say "market analysis" explicitly.
---

# Market Analysis

Use this skill when the user needs evidence-based market intelligence — not generic advice. Produce structured research with cited sources, explicit assumptions, and clear confidence levels.

## Quick Start

1. **Clarify the ask** — market, geography, time horizon, and decision the analysis supports.
2. **Create or resume a session** in `.cursor/market-analysis-sessions/<slug>/`.
3. **Research** — web search, official filings, product pages, pricing, reviews, analyst reports (when accessible).
4. **Synthesize** — apply the right frameworks; separate facts from inference.
5. **Deliver** — executive summary + detailed report; offer formats (memo, slide outline, comparison table).

## When to Use

| User intent | Typical deliverable |
|-------------|---------------------|
| "Size the market" | TAM / SAM / SOM with methodology and sources |
| "Who competes with X?" | Competitive landscape + positioning map |
| "Should we enter Y?" | Opportunity assessment, risks, recommendation |
| "Compare A vs B" | Feature/pricing/GTM comparison matrix |
| "Trends in Z" | Trend brief with drivers, timeline, implications |
| "Who is the ICP?" | Segments, personas, buying triggers, objections |
| Investor / board prep | 1-pager + appendix with citations |

## When NOT to Use

- **Codebase or PR work** — use Arnica-specific skills instead.
- **Legal or investment advice** — produce research support only; add disclaimer that output is not legal/financial advice.
- **Real-time trading** — do not recommend buy/sell actions.

## Session Setup

When the topic is concrete enough to name, create:

```text
.cursor/market-analysis-sessions/<slug>/
├── brief.md              # User goals, scope, constraints
├── state.json            # Phase, dates, deliverable checklist
├── research-notes.md     # Raw findings with URLs and dates
├── data/                 # Optional: CSV exports, tables
└── report.md             # Final deliverable
```

**Slug rules:** lowercase kebab-case from topic (e.g. `appsec-devsecops-2026`).

**Initialize `state.json`:**

```json
{
  "title": "",
  "slug": "",
  "phase": "DISCOVER",
  "market": "",
  "geography": "global",
  "time_horizon": "",
  "analysis_types": [],
  "created_at": "",
  "deliverables": [],
  "confidence_overall": null
}
```

Update `brief.md` after discovery and `research-notes.md` after each research pass. Set `phase` in `state.json` when advancing.

## Phase 1: DISCOVER

Run 1–2 focused rounds. Do not start heavy research until scope is clear.

**Round 1 — decision and scope**

- What decision does this analysis support? (build, buy, enter, position, pitch, prioritize)
- Which market or category? (define boundaries — e.g. "AI AppSec for enterprises" not just "security")
- Geography: global, US, EU, specific countries?
- Time horizon: current state, 3-year outlook, or both?
- Any known competitors, segments, or hypotheses to validate?

**Round 2 — depth and format**

- Required frameworks? (If unspecified, infer from decision — see [references/analysis-frameworks.md](references/analysis-frameworks.md))
- Deliverable format: memo, comparison table, slide outline, Notion-ready sections?
- Confidentiality: may findings be saved in the repo session folder, or summary-only in chat?
- Budget for depth: quick scan (2–4 hours of agent work) vs deep dive?

**Transition when ready:**

> I have enough scope. I'll research [market] for [purpose] and return with [deliverables].

## Phase 2: RESEARCH

Read [references/research-sources.md](references/research-sources.md) before searching.

### Research principles

1. **Triangulate** — at least two independent sources for material claims (market size, growth rates, share).
2. **Date everything** — note `retrieved: YYYY-MM-DD` on each source in `research-notes.md`.
3. **Prefer primary sources** — company sites, pricing pages, SEC/annual reports, official product docs, job postings (GTM signals), GitHub activity (for dev tools).
4. **Label confidence** — `high` (primary/multiple sources), `medium` (single reputable secondary), `low` (estimate or inference).
5. **Separate fact vs opinion** — use "Observed" vs "Inferred" sections in notes.

### Tool usage

| Need | Tool |
|------|------|
| Broad landscape, news, funding | `WebSearch` |
| Specific report, pricing page, docs | `WebFetch` |
| User-provided docs | `Read` on uploaded/pasted paths |
| Structured comparisons | Tables in `report.md` |

Run multiple targeted searches rather than one vague query. Example query patterns:

- `"[category] market size" 2024 2025 report`
- `"[competitor]" pricing enterprise`
- `"[competitor]" vs "[competitor]" comparison`
- `site:g2.com OR site:gartner.com "[product category]"` (when relevant)

### Research checklist (tick in `state.json` → `deliverables`)

- [ ] Market definition and boundaries documented
- [ ] Key segments and buyers identified
- [ ] Top competitors (direct + adjacent) listed
- [ ] Pricing / packaging patterns captured (where public)
- [ ] Growth drivers and headwinds noted
- [ ] Regulatory or compliance factors (if applicable)
- [ ] Recent M&A, funding, or product launches (last 12–24 months)

## Phase 3: ANALYZE

Read [references/analysis-frameworks.md](references/analysis-frameworks.md). Apply only frameworks that serve the stated decision — avoid framework dumping.

### Common analyses

| Framework | Use when |
|-----------|----------|
| TAM / SAM / SOM | Sizing, fundraising, capacity planning |
| Competitive matrix | Positioning, win/loss, differentiation |
| SWOT | Strategic choice, enter/expand/stay |
| Porter's Five Forces | Industry attractiveness, margin pressure |
| Trend / PESTLE | Macro shifts, timing, risk |
| Jobs-to-be-done | ICP, messaging, roadmap prioritization |
| Value chain | Partnerships, build vs buy, channel strategy |

### Market sizing rules

- State **methodology** (top-down vs bottom-up).
- Show **assumptions** explicitly (e.g. # of target accounts × ARPU).
- Provide **ranges** when point estimates are uncertain.
- Cite sources; if no public data, label as **modelled estimate** and list sensitivity variables.

## Phase 4: DELIVER

Read [references/report-template.md](references/report-template.md) for structure.

### Every report includes

1. **Executive summary** (≤ 10 bullets) — answer the user's decision question first
2. **Scope** — market definition, geography, date range
3. **Key findings** — numbered, evidence-backed
4. **Recommendations** — actionable, tied to findings
5. **Risks & uncertainties** — what could change the conclusion
6. **Sources** — linked list with retrieval dates
7. **Appendix** — optional detail tables, competitor profiles

### Confidence summary

End with a short table:

| Finding | Confidence | Basis |
|---------|------------|-------|
| ... | high/medium/low | 1-line rationale |

### Presentation options

After `report.md`, offer as appropriate:

- Slide outline (title + bullets per slide)
- Comparison matrix only (CSV-friendly markdown table)
- "Red team" section — strongest counter-arguments to your recommendation

## Quality Bar

**Do**

- Lead with the answer to the user's decision question
- Use tables for comparisons
- Call out where data is stale, US-centric, or vendor-biased
- Update the user mid-research if scope should narrow (e.g. "public data only for private companies")

**Do not**

- Invent market sizes or growth rates without labelling as estimates
- Treat marketing copy as independent research
- Present a single analyst PDF as ground truth without cross-check
- Hide uncertainty behind confident prose

## Subagent and parallel work

When the landscape is large, split research in parallel (e.g. one agent per competitor cluster or geography), then merge into `research-notes.md` before synthesis. Deduplicate sources and resolve conflicts in Phase 3.

## Language and tone

- Match the user's language if they write in another language.
- Default: clear business English, suitable for executives and product leaders.
- Avoid jargon unless the user uses it; define category terms once.

## Integration with Arnica context

If the analysis is for **Arnica** or **AppSec / DevSecOps**:

- Map competitors to categories: SAST, SCA, secrets, ASPM, CNAPP, etc.
- Note SCM-native vs standalone, AI triage, developer experience, enterprise GRC
- Cross-check claims against public positioning only — do not leak internal roadmap or customer data into external research notes unless the user explicitly includes internal context

## Non-negotiables

- **Read this skill first** when market analysis is requested — do not improvise a one-off structure.
- **Save session artifacts** under `.cursor/market-analysis-sessions/<slug>/` unless the user asks for chat-only output.
- **Cite sources** for non-obvious claims; no citation needed for common knowledge.
- **Disclaimer** on first deliverable in a session: research support only, not legal or investment advice.
