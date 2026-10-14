# vibe-backend.github.io

Organization GitHub Pages site for **[https://vibe-backend.github.io/](https://vibe-backend.github.io/)**.

The HTML is built from [`vibe-backend/sdk`](https://github.com/vibe-backend/sdk) (`site/` + `docs/`) on every deploy. This repository only holds the deploy workflow.

## Deploy triggers

- `repository_dispatch` (`deploy-docs`) from `vibe-backend/sdk` after a successful main build
- `workflow_dispatch` (manual)
- Daily cron (Hong Kong 00:10 / UTC 16:10) — refreshes the development-activity section and acts as a fallback if the sdk dispatch PAT expires

Deploys always use **sdk `main`**. Pull requests here only dry-run the build.

## Path ownership

Do **not** add a `sample-shop/` (or `sample-shop.html`) publish path here. That URL is owned by [`vibe-backend/sample-shop`](https://github.com/vibe-backend/sample-shop) at [https://vibe-backend.github.io/sample-shop/](https://vibe-backend.github.io/sample-shop/). The workflow fails the build if the dist tree would claim it.
