# Chloe On A Pedastal — what Grok did

**Code:** [github.com/DaCameraGirl/Chloe_On_A_Pedastal](https://github.com/DaCameraGirl/Chloe_On_A_Pedastal)  
**Live:** [dacameragirl.github.io/Chloe_On_A_Pedastal](https://dacameragirl.github.io/Chloe_On_A_Pedastal/)  
**Local:** `C:\Users\enter\OneDrive\Desktop\Puzzle_1`  
**Paper trail:** [groks-work](../README.md) · [PR log](../PR-LOG.md#chloe-on-a-pedastal)

---

## What the project is

A **50-piece browser jigsaw** of Chloe the long-haired calico cat on her pedestal. Static HTML/CSS/JS — cartoon-styled photo, SVG interlocking tabs, drag-and-drop tray, hint/solve/reset controls, and a **Photo** button to swap in any local image.

Angela: *"hey gm can we fix this puzzle its broken lol"*

---

## What was broken

Dragging a piece off the tray could leave it **frozen mid-air** with `position: fixed` on `document.body`. `pointerup` only listened on the piece element, so releasing over the board or tray never finished the drag.

---

## What Grok shipped

| PR | What |
|----|------|
| [#1](https://github.com/DaCameraGirl/Chloe_On_A_Pedastal/pull/1) | Window-level pointer listeners during drag + hovered-slot drop fallback |
| — | Occupied slots lose grid chrome; board clears on win |
| — | Beautiful README with language + tech stack badge bars |

**Branch:** `fix/puzzle-drag-drop` → merged to `main`

---

## Stack

HTML5 · CSS3 · vanilla JavaScript · SVG clip paths · GitHub Pages

No framework. No install. Just Chloe.