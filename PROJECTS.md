# Projects — Grok + Angela

Master index of everything Grok helped build, PR, and merge with Angela (DaCameraGirl), June 2026.

| Project | Code | Live | My write-up |
|---------|------|------|-------------|
| **RoseOps Studio** | [RoseOps-Studio](https://github.com/DaCameraGirl/RoseOps-Studio) | [Open app](https://dacameragirl.github.io/RoseOps-Studio/) · `localhost:3099` | [roseops.md](./projects/roseops.md) |
| **Bettin2Win** | [Bettin2Win](https://github.com/DaCameraGirl/Bettin2Win) | [Open app](https://dacameragirl.github.io/Bettin2Win/) | [bettin2win.md](./projects/bettin2win.md) |
| **Project Obsidian** | [Obsidian](https://github.com/DaCameraGirl/Obsidian) | `rubric-generator.html` on Desktop | [obsidian.md](./projects/obsidian.md) |
| **Chloe On A Pedastal** | [Chloe_On_A_Pedastal](https://github.com/DaCameraGirl/Chloe_On_A_Pedastal) | [Play puzzle](https://dacameragirl.github.io/Chloe_On_A_Pedastal/) | [chloe-puzzle.md](./projects/chloe-puzzle.md) |
| **Latent Space Observatory** | [latent-observatory](https://github.com/DaCameraGirl/latent-observatory) | [Open app](https://dacameragirl.github.io/latent-observatory/) | [latent-observatory.md](./projects/latent-observatory.md) |
| **Solar Planets** | [solar-planets](https://github.com/DaCameraGirl/solar-planets) | [Open app](https://dacameragirl.github.io/solar-planets/) | [solar-planets.md](./projects/solar-planets.md) |

**This repo:** [groks-work](https://github.com/DaCameraGirl/groks-work) · **All public projects:** [links hub](https://dacameragirl.github.io/links/) · [links repo](https://github.com/DaCameraGirl/links)

### What Grok did in each project (detailed)

| Project | Read this for specifics |
|---------|-------------------------|
| RoseOps Studio | [projects/roseops.md](./projects/roseops.md) |
| Bettin2Win | [projects/bettin2win.md](./projects/bettin2win.md) |
| Project Obsidian | [projects/obsidian.md](./projects/obsidian.md) |
| Chloe On A Pedastal | [projects/chloe-puzzle.md](./projects/chloe-puzzle.md) |
| Latent Space Observatory | [projects/latent-observatory.md](./projects/latent-observatory.md) |
| Solar Planets | [projects/solar-planets.md](./projects/solar-planets.md) |

---

## RoseOps Studio

**What it is:** n8n-style workflow automation — drag steps, connect dots, run real workflows, encrypted credentials vault.

**Local path:** `C:\Users\enter\OneDrive\Desktop\RoseOps     Studio`

**What Grok shipped (PRs #3–#20):**

- Enterprise execution engine + GitHub Pages deploy
- Starter workflow picker, UX friendliness, canvas fit-view
- LLM **AI Chat** node + encrypted API keys (OpenAI, Gemini, DeepSeek, Grok, Claude, Azure, Ollama, OpenCode Zen)
- In-app Setup guide (engine + per-provider tabs + PowerShell snippets)
- Connect-engine modal, desktop launcher (`start-roseops.cmd`)
- **Credentials vault** — n8n-style category tabs (AI · Webhooks · Auth · Email · Cloud)
- OpenCode Zen free models provider

**What Grok did:** [projects/roseops.md](./projects/roseops.md) · PRs: [PR-LOG.md](./PR-LOG.md#roseops-studio) · Long log: [README.md](./README.md)

---

## Bettin2Win

**What it is:** Real-time multi-sport odds dashboard for beginners — plain-English explainers, not a sportsbook.

**Local path:** `C:\Users\enter\OneDrive\Desktop\Bettin2Win`

**What Grok shipped (June 22, 2026 session — PRs #74–#83):**

| PR | What |
|----|------|
| #74 | Game Weather Impact badges on game cards |
| #76 | Weather Impact demo data + beginner copy polish |
| #77 | Basketball matchup grouping with in-card market tabs |
| #78 | Per-sport board filters (beginner, priced, live) |
| #79 | Prominent board filters with live game counts |
| #80 | "Why isn't everyone rich?" beginner margin copy |
| #81 | README language bar, animated slot machine, 9 i18n READMEs |
| #82 | Aurora background theme + dark README hero |
| #83 | Horse/greyhound track program numbers + slower motion |

**Also credited in Bettin2Win README Contributors:** Grok — Weather Impact, matchup grouping, board filters, README & i18n.

**What Grok did:** [projects/bettin2win.md](./projects/bettin2win.md) · PRs: [PR-LOG.md](./PR-LOG.md#bettin2win)

---

## Project Obsidian

**What it is:** Rubric-support workspace for Angela's OpenClaw / Handshake annotation gig. Turns a selected OpenClaw conversation + Multimango feedback into scoring goals and criteria.

**Local path:** `C:\Users\enter\OneDrive\Desktop\Project Obsidian`

**The tool:** `rubric-generator.html` — double-click, paste conversation, generate/repair rubric, copy to Multimango.

**What Grok shipped (June 22–23, 2026 session — PRs #16–#26):**

| PR | What |
|----|------|
| #16 | Fix 55% verifier failures — 8–12 criteria, no worksheet-as-binary-success |
| #17 | Ban speculative fabrication when retrieval exists |
| #18 | Fix BAC polarity + Michaela lookup lint |
| #19 | Align generator with official Multimango Steps 4–7 workflow |
| #20 | Auto-reorder criteria by category |
| #21 | **83% WHOOP gold example** + incomplete-trajectory level-1 rules |
| #22 | CRLF paste breaking reorder + BAC lint |
| #23 | Submit-ready auto-repair for WHOOP rubrics |
| #24 | 90% WHOOP+Gmail email gold standard + overlap auto-repair |
| #25 | Remove preloaded rubric examples from app |
| #26 | Frame rubrics as annotated-range step quizzes |

**Key lesson locked in:** 83% is an accepted pass for incomplete WHOOP trajectories (calendar down, CSV only). Gold template: `examples/whoop-calendar-sheets-83pct.md`.

**What Grok did:** [projects/obsidian.md](./projects/obsidian.md) · PRs: [PR-LOG.md](./PR-LOG.md#project-obsidian)

---

## Latent Space Observatory

**What it is:** Real 3D embedding visualization — live MiniLM atlas, your words, CSV upload. vtk.js observatory for AI research. **No synthetic demo.**

**Local path:** `C:\Users\enter\latent-observatory`

**What Grok shipped (June 25, 2026):**

| PR | What |
|----|------|
| #14 | Strip solar overlay from observatory; cross-link Solar Planets |
| #15 | Real-only boot — delete demo field generator |
| #16 | Premiere enterprise UI (Syne, glass chrome, starfield, loading curtain) |

**What Grok did:** [projects/latent-observatory.md](./projects/latent-observatory.md) · PRs: [PR-LOG.md](./PR-LOG.md#latent-space-observatory)

---

## Solar Planets

**What it is:** Standalone cinematic solar system — real textures, bloom, theatrical orbit. Split from Latent Observatory.

**Local path:** `C:\Users\enter\solar-planets`

**What Grok shipped (June 25, 2026):**

| PR | What |
|----|------|
| — | New repo + GitHub Pages |
| #1 | Real 2K textures, labels, loading |
| #2 | Premiere UI + Unreal bloom |

**What Grok did:** [projects/solar-planets.md](./projects/solar-planets.md) · PRs: [PR-LOG.md](./PR-LOG.md#solar-planets)

---

## How we work

Angela approves direction in chat. Grok does git mechanics: feature branches → PR → merge → deploy (where applicable).

Other assistants on Angela's repos (not logged here unless Grok paired): Claude, Dex (Codex).

---

## Session files (Grok in Cursor)

| Project | Session path (local) |
|---------|---------------------|
| RoseOps | `.grok/sessions/.../RoseOps Studio/...` |
| Bettin2Win | `.grok/sessions/.../Bettin2Win/...` |
| Obsidian | `.grok/sessions/.../desktop-project-obsidian/obsidian/...` |