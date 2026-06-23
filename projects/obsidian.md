# Project Obsidian — what Grok did

**Code:** [github.com/DaCameraGirl/Obsidian](https://github.com/DaCameraGirl/Obsidian) (private)  
**Local:** `C:\Users\enter\OneDrive\Desktop\Project Obsidian`  
**The tool:** double-click `rubric-generator.html`  
**Paper trail:** [groks-work](../README.md) · [PR log](../PR-LOG.md#project-obsidian)

---

## What the project is

Angela's **OpenClaw / Handshake annotation** workspace. She runs multi-tool prompts in a remote OpenClaw VM, selects a conversation range in Multimango, then writes/repairs **scoring goals and criteria** (rubrics) for how well the agent performed.

**Grok's job here:** Fix and improve `rubric-generator.html` so routine rubric formatting stops burning hours and verifier scores go up. Grok does **not** write Angela's task prompts or fill worksheet answers — that's her graded work.

---

## The pain Grok was solving

A WHOOP + Google Calendar + Email + Sheets chart task took **~4 hours** to get to an **83% quality pass** (should be ~1 hour). Earlier drafts scored **55–70%** because the generator:

- Turned worksheet emails/URLs into **binary success criteria** that never appear in the selected transcript
- Generated **15–25 criteria** from worksheet fields → forced **score 0** on incomplete deliverables
- Wrote chart criteria assuming a built chart when only manual CSV steps existed
- Got **Strain fabrication polarity** wrong (Hard Fail)
- Mixed scoring directions (0 = worst vs 0 = safe)

---

## What Grok specifically did (PR by PR)

### PR #16 — Fix incomplete trajectories (55% → workable rubrics)

**Changed the generator SYSTEM prompt and lint rules:**
- Target **8–12 evaluable criteria** (not 15–25)
- **Three-level scoring** for partial progress (calendar down, CSV only → level **1** is correct, not a bug)
- Chart color checks grade **instructions**, not whether a chart rendered
- Worksheet clarifies ambiguity; **transcript is authoritative**
- Lint warnings for chart-display assumptions, binary email criteria, wrong Strain polarity

**Synced fixes to Desktop `Project Obsidian` folder.**

---

### PR #17 — Ban speculative fabrication

When the agent retrieved real data, criteria must not reward **making up** Strain/BAC values. Generator now blocks speculative fabrication checks when retrieval exists.

---

### PR #18 — BAC + Michaela lint

- **BAC:** WHOOP doesn't measure BAC — goal must say "prompt named BAC" not "retrieved BAC"
- **Michaela lookup:** lint for daughter email criteria that can't be verified from transcript

---

### PR #19 — Official Multimango workflow

Angela pasted Handshake **Steps 4–8 + repair checklist**. Grok wired that into:
- `rubric-generator.html` SYSTEM prompt
- `RUBRIC_GENERATOR_RULES.md`
- Coverage rules (e.g. reward stopping to ask when blocked)
- Negative/detrimental criteria rules
- Banned tools list for prompt-side checks

---

### PR #20 — Auto-reorder by category

Criteria now sort into platform order automatically:
1. Safety & Trustworthiness  
2. Instruction Following  
3. Factuality & Hallucination  
4. Task Completion  
5. Communication Style  

Saves manual reorder clicks before submit.

---

### PR #21 — 83% WHOOP gold example (the big one)

**Locked in lessons from the 4-hour session:**

| Added | Purpose |
|-------|---------|
| `examples/whoop-calendar-sheets-83pct.md` | Paste-ready gold standard + selection tips + expected Run Trial scores |
| **Load 83% WHOOP example** button in app | One-click template in the tool |
| Incomplete-trajectory level-1 wording | Calendar/sheet partial = score 1, not failure |
| Goal template fix | "User made two requests" — never claim calendar updated or email sent |
| `HANDOFF.md` update | Next session reads this first |
| Build tag `2026-06-22` | Know which generator version you're on |

**Key rule:** **83% is an accepted pass** when the conversation genuinely stopped mid-task.

---

### PR #22 — CRLF paste repair

Windows paste from Multimango used `\r\n` line endings → criterion reorder and BAC lint broke silently. Fixed post-processing to normalize CRLF.

---

### PR #23 — Submit-ready auto-repair

One-click repairs before paste into Multimango: overlap, polarity, banned patterns, category order — tuned for WHOOP task shapes.

---

### PR #24 — 90% WHOOP+Gmail gold standard

Second gold template for email-success trajectories + auto-repair for overlapping high-importance criteria.

---

### PR #25 — Remove preloaded examples

Stripped hardcoded rubric examples from the app UI — gold standards live in `examples/` and load via button only (cleaner, less confusion).

---

### PR #26 — Annotated-range framing

Rubrics framed as **quizzes on the selected message range only** — not "did the whole job succeed globally." Stops criteria that assume outcomes outside the selection.

---

## Files Grok touched most

| File | Role |
|------|------|
| `rubric-generator.html` | THE TOOL — SYSTEM prompt, UI, lint, examples loader |
| `RUBRIC_GENERATOR_RULES.md` | Generator priorities |
| `rubric-repair.md` | Scoring direction, repair patterns |
| `examples/whoop-calendar-sheets-83pct.md` | 83% gold template |
| `README.md` | How to use the tool |
| `HANDOFF.md` | Session-to-session context |

---

## Hard rules Grok followed with Angela

- **No em dashes** in anything she might submit
- **Don't write her OpenClaw prompts** or invent worksheet ground truth
- **Do** fix generator, draft/repair criteria format, save paste-ready `.txt` files
- Rotate exposed sandbox credentials when gig work ends (WHOOP OAuth, Telegram, Google — noted in HANDOFF)

---

## PR table (#16–#26)

Full list: [PR-LOG.md](../PR-LOG.md#project-obsidian)