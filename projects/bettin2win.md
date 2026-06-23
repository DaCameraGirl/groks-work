# Bettin2Win — what Grok did

**Repo:** https://github.com/DaCameraGirl/Bettin2Win  
**Live:** https://dacameragirl.github.io/Bettin2Win/  
**Local:** `C:\Users\enter\OneDrive\Desktop\Bettin2Win`

---

## What the project is

Real-time multi-sport **odds dashboard** for beginners — plain-English explainers, best-price hunting, **not a sportsbook**. Polyglot monorepo (pnpm + Turborepo): TypeScript/React web app + odds-engine services.

Angela asked Grok to help polish the product for first-time visitors and add features that make odds + context easier to understand.

---

## Session start (June 22, 2026)

Angela: *"can u help me with this project im working on … Bettin2Win"*

Grok explored the monorepo (`HANDOFF.md`, package structure, recent git history), understood the beginner-audience goal, then shipped a focused UI/docs sprint — **PRs #74–#83**, all merged same day.

---

## What Grok specifically did (feature by feature)

### Game Weather Impact (PRs #74, #76)

**What users see:** On outdoor game cards (football, baseball, soccer, golf, NASCAR, horse, greyhound):
- **Game Weather** row with Low / Medium / High impact
- One-line summary (temp, wind, rain)
- Badges: Wind Alert, Rain Risk, Heat Alert, Track Condition
- Expandable **"Why it matters"** copy per sport (passing, fly balls, track surface, delays)
- Basketball & hockey show **Indoor Venue** (no weather API call)

**What Grok built in code:**
- `GET /api/weather-impact/:sport` on odds-engine
- **Open-Meteo** geocoding + hourly forecast (no API key)
- Venue/home-team lookup from normalized `SportEvent`
- In-memory cache for geocode + forecast
- Demo data + beginner-friendly copy polish (#76)
- 57 odds-engine tests (classification + geo query)

*Deferred on purpose:* top weather ticker strip (badges first, ticker later).

---

### Basketball matchup grouping (PR #77)

**Problem:** Related basketball games scattered on the board.

**What I did:** Group matchups on one card with **in-card market tabs** (moneyline, spread, totals, etc.) so beginners see one game, many markets — not duplicate rows.

---

### Board filters (PRs #78, #79)

**Problem:** Busy boards hard for beginners to scan.

**What I did:**
- **Per-sport filters:** beginner-friendly, priced, live games
- Moved filters **under sport tabs** with **live counts** on each filter chip (#79)
- Filters stay visible — not hidden in a menu

---

### Beginner copy (PR #80)

**What I did:** Added **"Why isn't everyone rich?"** explainer — plain-English note on margins/vig so new users understand the house edge without feeling talked down to.

---

### README & internationalization (PR #81)

**What I did (docs only, no app code):**
- **10-language badge bar** on main README (EN + ES, FR, DE, PT-BR, ZH-CN, JA, KO, IT, AR)
- **Animated slot machine SVG** — sports/education emojis, "learn the line, not a casino"
- **9 translated README variants** with matching structure + active-language highlight
- `docs/LANGUAGE-BAR.md` — reusable snippet to keep language nav in sync
- Updated provider chains (ESPN, GBGB) and product highlights table
- **Grok contributor credit** in README Contributors section

---

### Visual polish (PR #82)

**What I did:** Aurora background theme on the live app + dark README hero SVG for GitHub landing page.

---

### Horse & greyhound racing (PR #83)

**What I did:** Track view uses **program numbers** (how bettors actually read programs) and **slower motion** on the lane animation so numbers are readable.

---

## What Grok did *not* do on Bettin2Win

Earlier core work (provider fallbacks, ESPN/GBGB chains, dashboard shell) — **Claude** and **Dex (Codex)** per README Contributors. Grok's session was the **June 22 UX/features/docs sprint** above.

---

## PR table

| # | Title |
|---|--------|
| 74 | Game Weather impact badges |
| 76 | Weather Impact demo + beginner copy |
| 77 | Basketball matchup grouping |
| 78 | Per-sport board filters |
| 79 | Prominent filters + live counts |
| 80 | "Why isn't everyone rich?" copy |
| 81 | README language bar + 9 i18n + slot machine |
| 82 | Aurora theme + dark README hero |
| 83 | Racing program numbers + slower motion |

Full log: [PR-LOG.md](../PR-LOG.md#bettin2win)