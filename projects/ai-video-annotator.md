# AI Video Annotator Suite — what Grok did

**Code:** [github.com/DaCameraGirl/AI-Video-Annotator](https://github.com/DaCameraGirl/AI-Video-Annotator)  
**Live:** [dacameragirl.github.io/AI-Video-Annotator](https://dacameragirl.github.io/AI-Video-Annotator/)  
**Local:** `C:\Users\enter\AI-Video-Annotator`  
**Paper trail:** [groks-work](../README.md) · [PR log](../PR-LOG.md#ai-video-annotator-suite)

---

## What the project is

A **zero-cloud warehouse video analysis** app that runs entirely in the browser. Upload a clip and get live COCO-SSD object detection, virtual-fence zones, activity heatmaps, dwell-time analytics, caption QA, and exportable reports. Nothing leaves the device.

Angela: *"can u fix this its jus an empty white page link no woking ai video annotator at all"*

---

## What was broken

GitHub Pages was serving the **unbuilt** source `index.html`, which pointed at `/src/main.tsx`. Browsers cannot run TypeScript/TSX directly, so the live site showed a blank white page even though the app code on `main` was fine.

Pages had no deploy workflow on `main` — only raw source was being published.

---

## What Grok shipped

| PR | What |
|----|------|
| [#12](https://github.com/DaCameraGirl/AI-Video-Annotator/pull/12) | Add CI + GitHub Actions Pages deploy workflow (`npm run build` → publish `dist/`) |
| [#13](https://github.com/DaCameraGirl/AI-Video-Annotator/pull/13) | Fix README to reference `deploy-pages.yml` (actual workflow filename) |

**Also:**
- Switched GitHub Pages from legacy branch deploy to **GitHub Actions** workflow deploy
- Verified live site serves built JS/CSS (200 OK) — app loads again

**Branches:** `fix/github-pages-deploy` → merged to `main`

---

## Stack

React 19 · TypeScript · Vite · Tailwind CSS v4 · TensorFlow.js (COCO-SSD) · IndexedDB · GitHub Actions → GitHub Pages

No backend. No API keys. Video stays local.