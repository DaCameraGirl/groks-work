# RoseOps Studio — what Grok did

**Repo:** https://github.com/DaCameraGirl/RoseOps-Studio  
**Live:** https://dacameragirl.github.io/RoseOps-Studio/  
**Local:** `C:\Users\enter\OneDrive\Desktop\RoseOps     Studio` → `npm start` → http://localhost:3099

---

## What the project is

Workflow automation studio (n8n-inspired) with a warm UI, drag-and-drop canvas, and a Node.js execution engine that runs workflows for real and stores secrets encrypted.

Angela's pitch: **"n8n for the girlies"** — powerful, but obvious and friendly. Nobody should need to read GitHub docs to connect the engine or add AI keys.

---

## What Grok specifically did (by theme)

### 1. Made the app actually usable on first open

**Problem:** Clicking `+` gave empty workflows. Opening a workflow showed a blank canvas. Too much dev jargon everywhere.

**What I did:**
- **Starter workflow picker** — `+` opens a template gallery (7 starters including AI Assistant), not a blank list
- **Empty canvas repair** — GitHub Pages auto-hydrates matching starter templates so steps appear
- **UX friendliness pass** — plain language, guide panel, toasts, obvious click targets
- **Canvas fit-to-view** — steps center in view instead of hiding below the fold

**Files:** `app.js`, `lib/starter-workflows.js`, `styles.css`, `index.html`

---

### 2. Added real AI (like n8n credentials + LLM node)

**Problem:** No way to call LLMs from workflows; keys would have been pasted in nodes.

**What I did:**
- **AI Chat node** — provider dropdown, model, system/user prompts, temperature
- **Encrypted credentials vault** on the engine (`lib/credentials.js`, AES-256-GCM)
- **Quick-add** in sidebar for each AI provider
- **Providers wired in `lib/llm.js`:** OpenAI, Google Gemini, DeepSeek, xAI Grok, Anthropic Claude, Azure OpenAI (Copilot), Ollama (local), OpenCode Zen (free models)

**Later (PR #20):** Rebuilt sidebar as **Credentials vault** with category tabs — All · AI · Webhooks · Auth · Email · Cloud — so Discord, SMTP, GitHub tokens, etc. are visible, not buried behind an AI-only dropdown.

---

### 3. "How will others connect?" — everything in the UI

**Problem:** README-only setup; GitHub Pages visitors didn't know what URL to paste; desktop shortcut pointed at wrong folder.

**What I did:**
- **How to connect guide** — auto modal on first Pages visit, status badge (`● pages` / `● offline`), chat command `connect`
- **Setup guide** in sidebar + top bar + Getting started checklist (not README-only)
- **Connect engine modal** — "I started RoseOps from my desktop icon" vs online URL
- **Fixed `start-roseops.cmd`** — kills stale port 3099, runs `npm start`, opens browser; desktop shortcut path corrected

---

### 4. Free AI setup — all providers, PowerShell, OpenCode

**Problem:** Angela wanted free LLMs (not just Grok), PowerShell install steps, and OpenCode Zen remembered.

**What I did:**
- **Ollama local provider** + full 8-step checklist in Setup guide
- **Per-provider dropdown tabs** in Setup guide (Local, OpenCode, Gemini, DeepSeek, Claude, Grok, Copilot, OpenAI) — each with signup links + PowerShell test snippets
- **"Try free first" callout** — Ollama, OpenCode Zen, Gemini, DeepSeek, Grok before paid options
- **OpenCode Zen** — provider `opencode`, credential `opencode_zen`, base URL `https://opencode.ai/zen/v1`, free models like `deepseek-v4-flash-free`

---

### 5. GitHub workflow (every session)

Angela approves direction in chat. Grok:
1. Creates `feature/...` or `fix/...` branch (never direct to `master`)
2. Opens PR with what + why
3. Merges to `master` → GitHub Pages redeploys UI

**PRs #3–#20** — full table in [PR-LOG.md](../PR-LOG.md#roseops-studio)

---

## Files Grok touched most

| File | Role |
|------|------|
| `app.js` | UI, setup guide, credentials vault, canvas, chat commands |
| `index.html` | Shell, sidebar panels |
| `styles.css` | Design system, tabs, setup guide |
| `lib/llm.js` | All LLM provider API calls |
| `lib/nodes.js` | AI Chat node definition |
| `lib/credentials.js` | Vault credential types |
| `lib/starter-workflows.js` | Template catalog + empty-canvas repair |
| `start-roseops.cmd` | Windows launcher |
| `README.md` | Verbose build log + groks-work link |

---

## Problems Angela reported → what fixed them

| She said | Grok shipped |
|----------|--------------|
| "+" gives empty workflows | Starter picker |
| Canvas empty after click | Template hydration repair |
| Too much jargon | UX pass |
| Steps at bottom of canvas | Fit-to-view |
| No AI | LLM node + API keys |
| Desktop icon broken | `start-roseops.cmd` + shortcut path |
| What engine URL? | Connect modal + setup guide |
| Not just README | In-app Setup guide everywhere |
| Free LLMs in PowerShell | Ollama + provider tabs |
| Only AI keys visible | n8n-style Credentials vault |
| Remember OpenCode | Zen provider + setup tab |