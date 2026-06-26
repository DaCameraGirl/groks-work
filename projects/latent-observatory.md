# Latent Space Observatory — what Grok did

**Code:** [github.com/DaCameraGirl/latent-observatory](https://github.com/DaCameraGirl/latent-observatory)  
**Live:** [dacameragirl.github.io/latent-observatory](https://dacameragirl.github.io/latent-observatory/)  
**Local:** `C:\Users\enter\latent-observatory` · Desktop shortcut + `Latent_Space_Obs` clone  
**Paper trail:** [groks-work](../README.md) · [PR log](../PR-LOG.md#latent-space-observatory)

---

## What the project is

A **real embedding-space observatory** — vtk.js point cloud, live `all-MiniLM-L6-v2` via Transformers.js, CSV upload, query probe, optional nebula isosurface. No build step. 100% client-side.

Angela wanted it **real only** — no synthetic demo, no fake planets on the dots. The solar aesthetic lives in the sibling app **Solar Planets**.

---

## What Grok shipped (June 25, 2026)

| PR | What |
|----|------|
| [#14](https://github.com/DaCameraGirl/latent-observatory/pull/14) | Removed `cosmos.js` solar overlay; embedding-first defaults; link to Solar Planets in About |
| [#15](https://github.com/DaCameraGirl/latent-observatory/pull/15) | Deleted `latent.js` demo field; boots straight into live MiniLM concept atlas |
| [#16](https://github.com/DaCameraGirl/latent-observatory/pull/16) | Premiere enterprise UI — Syne/IBM Plex, gold-cyan glass, vignette, starfield, theatrical loading |

**Also this session (earlier PRs on repo):** restore demo/orbit (#11), i18n README assets (#12), solar layer (#13 — later reversed by #14).

**Hub:** Added to [links](https://dacameragirl.github.io/links/) · desktop `.url` shortcut on Angela's Desktop.

---

## Stack

vtk.js 36.2 · Transformers.js 2.17 · PCA/k-means worker · GitHub Pages

Three real data paths: concept atlas · your words · your file (CSV/TSV).