# Grok's Work

**Session log & build notes** from Angela (DaCameraGirl) pairing with **Grok in Cursor** on [RoseOps Studio](https://github.com/DaCameraGirl/RoseOps-Studio).

You met Grok yesterday. This repo is the paper trail — what we built, why, and where it lives.

---

## What this repo is

| | |
|---|---|
| **Not** | A copy of the RoseOps app |
| **Is** | Documentation of what Grok helped design, code, PR, and merge |
| **Main project** | [RoseOps-Studio](https://github.com/DaCameraGirl/RoseOps-Studio) |
| **Live UI** | [dacameragirl.github.io/RoseOps-Studio](https://dacameragirl.github.io/RoseOps-Studio/) |
| **Local full stack** | `http://localhost:3099` after `npm start` |

Angela approves direction in chat. Grok does git mechanics: branches, PRs, merges, deploy.

---

## The pitch we kept building toward

**RoseOps Studio** = workflow automation that's powerful like n8n but warm and obvious — "n8n for the girlies."

- Drag steps, connect dots, run real workflows
- Encrypted API keys (not pasted in nodes)
- Self-hosted Node engine + SQLite
- GitHub Pages for preview; engine for execution

---

## Timeline (June 2026 sessions)

### Foundation (already in repo before the big UX sprint)

- **PR #3** — Enterprise v3 execution engine (`server.js`, vault, audit, webhooks, cron)
- **PR #4** — Visual overhaul + README badges
- **PR #5** — Starter workflow picker on `+` (not an empty workflow list)

### "It should feel friendly"

- **PR #6** — Onboarding deployment path fix
- **PR #7** — UX friendliness: plain language, guide panel, toasts, obvious click targets
- **PR #8** — Canvas fit-to-view so steps aren't hidden below the fold

### "Add AI like n8n"

- **PR #9** — LLM **AI Chat** node + API key types (OpenAI, Gemini, DeepSeek, Grok)
- Encrypted credentials vault integration
- Quick-connect buttons in sidebar

### "GitHub Pages feels broken"

- **PR #10** — Empty canvas bug: workflows auto-hydrate from matching starter template
- **PR #11** — Desktop shortcut fixed (`start-roseops.cmd`, wrong `m9m` workdir corrected)
- **PR #12** — Connect engine modal: desktop icon vs mystery `your-api.example.com` URL

### "How will others know how to connect?"

- **PR #13** — How to connect guide (auto modal on first Pages visit, status badge, chat `connect`)
- **PR #14** — **Everything on the website** — Setup guide drawer, top bar, Getting started checklist (not README-only)

### "Free LLMs with PowerShell"

- **PR #15** — Ollama local provider + PowerShell install in Setup guide
- **PR #16** — Full 8-step checklist: RoseOps engine + Ollama + first workflow run
- **PR #17** — **All** free/freemium providers (not just Grok): Gemini, DeepSeek, OpenAI, etc.

### "Dropdown tab for each provider"

- **PR #18** — Per-provider **dropdown + tabs** in Setup guide
- PowerShell install/test block per provider
- Added **Anthropic Claude** + **Microsoft Copilot (Azure OpenAI)** to engine
- API keys sidebar: provider dropdown instead of button grid

---

## Feature inventory (what exists now)

### Studio UI (`app.js`, `index.html`, `styles.css`)

- Starter workflow picker (7 templates incl. **AI Assistant**)
- 2-step onboarding + Getting started checklist
- Setup guide: engine connection + AI provider tabs
- Canvas: drag/drop, magnetic connections, fit view, auto-arrange
- API keys panel with provider dropdown
- Assistant chat commands (`connect`, `gemini`, `claude`, `ollama`, …)
- GitHub Pages preview mode + connect to localhost/deployed engine
- Empty canvas overlay + template repair

### Execution engine (`server.js`, `lib/`)

- Workflow CRUD, versioning, DAG validation
- Queued execution, SSE live logs
- Credentials: AES-256-GCM vault
- Node types: HTTP, Code, Delay, Filter, Email, Webhook, Schedule, Discord, GitHub, Sheets, **LLM**
- LLM providers: `openai`, `google`, `deepseek`, `xai`, `anthropic`, `azure`, `opencode`, `ollama`

### Credential types

`openai_api` · `google_gemini` · `deepseek_api` · `xai_grok` · `anthropic_api` · `azure_openai` · `opencode_zen` · `ollama_local` · plus integration types (SMTP, Discord, GitHub, etc.)

### OpenCode Zen (Angela asked to remember)

[OpenCode](https://opencode.ai) is an open-source AI coding agent with **75+ providers** and **several completely free models** on [OpenCode Zen](https://opencode.ai/zen):

- `deepseek-v4-flash-free`, `mimo-v2.5-free`, `big-pickle`, `north-mini-code-free`, `nemotron-3-ultra-free`
- API: `https://opencode.ai/zen/v1/chat/completions` (OpenAI-compatible)
- Key: [opencode.ai/auth](https://opencode.ai/auth)
- Windows PowerShell: `npm i -g opencode-ai` or `scoop install opencode` or `choco install opencode`
- In RoseOps: provider **opencode**, model e.g. `deepseek-v4-flash-free`

### Desktop / local launch

- `start-roseops.cmd` — kills stale port 3099, `npm start`, opens browser
- Desktop shortcut target: RoseOps Studio folder (fixed from broken path)

---

## Architecture (one picture)

```
Browser (studio)          Engine (server.js)
─────────────────         ──────────────────
index.html / app.js  ←──→  Express API :3099
GitHub Pages (static)      SQLite + vault
       │                         │
       └─ sessionStorage ────────┘  roseops_api_url
          or localhost only
```

**Pages alone:** build flows, save keys in browser localStorage.  
**Engine connected:** run workflows, encrypted vault, Ollama on localhost, real LLM calls.

---

## Problems we solved (user-reported)

1. **"+" gave empty workflows** → starter picker
2. **Clicking workflow showed nothing** → empty canvas repair + template hydration
3. **Too much dev jargon** → UX friendliness pass
4. **Steps at bottom of canvas** → fit-to-view layout
5. **No AI integrations** → LLM node + API keys
6. **Desktop icon did nothing / wrong folder** → shortcut + `start-roseops.cmd`
7. **"What URL do I paste for engine?"** → connect modal + setup guide
8. **"How will others connect?"** → in-app guide everywhere
9. **"Not just README"** → Setup guide on live site
10. **"Free LLMs in PowerShell"** → Ollama section + provider tabs for all AIs

---

## How to run what we built

```powershell
git clone https://github.com/DaCameraGirl/RoseOps-Studio.git
cd RoseOps-Studio
npm install
Copy-Item .env.example .env
npm start
```

Open **http://localhost:3099**. Use **Setup guide** in the sidebar for AI keys.

Optional local AI (always free):

```powershell
winget install Ollama.Ollama
ollama pull llama3.2
```

---

## Git workflow we used

Every change:

1. `feature/...` or `fix/...` branch (never direct to `master`)
2. PR with description of what + why
3. Merge to `master` → GitHub Pages redeploys UI

---

## Files Grok touched most

| File | Role |
|------|------|
| `app.js` | UI, setup guide, credentials UI, canvas, chat |
| `index.html` | Shell, panels, provider dropdown |
| `styles.css` | Design system, tabs, setup guide |
| `lib/llm.js` | All LLM provider API calls |
| `lib/nodes.js` | AI Chat node definition |
| `lib/credentials.js` | Vault credential types |
| `lib/starter-workflows.js` | Template catalog + repair |
| `start-roseops.cmd` | Windows launcher |
| `README.md` | This verbose log (in main repo too) |

---

## What's next (not done yet)

- Public demo engine URL so Pages visitors connect without self-hosting
- CI (lint/test) on PRs
- More starter templates
- Optional: Anthropic prompt caching, streaming SSE for LLM tokens

---

<div align="center">

**groks-work** — because yesterday you met Grok, and a lot got shipped.

[RoseOps Studio](https://github.com/DaCameraGirl/RoseOps-Studio) · [Live UI](https://dacameragirl.github.io/RoseOps-Studio/)

Made with ✿ by Angela + Grok

</div>