# vibe-backend.github.io

Source for the organization GitHub Pages site at **[https://vibe-backend.github.io/](https://vibe-backend.github.io/)**. The static site builder and `src/` pages live in this repository and build into `dist/`. Site history was imported from `vibe-backend/sdk`'s `site/` directory with `git subtree`.

## Local development

Use Node.js 22 and pnpm (the version is pinned in `package.json`):

```sh
nvm use
pnpm install
pnpm run fetch-sdk
pnpm run build
pnpm run check-links
pnpm run serve
```

Docs come from [`vibe-backend/sdk`'s `docs/`](https://github.com/vibe-backend/sdk/tree/main/docs), fetched at build time rather than maintained here. `fetch-sdk` replaces `./sdk` with a shallow sparse checkout of `main`, including `docs/` and the root README. Set `SDK_REF` to fetch another branch or tag. To build against an existing SDK checkout, set `SDK_DIR` to its path (relative paths resolve from the current working directory).

## Deployment

The Pages workflow builds on pushes to `main`, all pull requests, manual `workflow_dispatch`, and a daily schedule at 00:10 Hong Kong time (16:10 UTC). Pull requests validate the build; deployment runs only from `main` using the official GitHub Pages actions.

Each workflow build fetches docs from the public `vibe-backend/sdk@main` repository without a cross-repo token. SDK docs changes go live on the next deploy: a push here, the daily cron, or a manual `workflow_dispatch`. The daily build also refreshes the development activity heatmap.

## Path ownership

`/sample-shop/` belongs to [`vibe-backend/sample-shop`](https://github.com/vibe-backend/sample-shop), and `/sample-envelope/` belongs to [`vibe-backend/sample-envelope`](https://github.com/vibe-backend/sample-envelope). These are separate project Pages sites. Do not publish `sample-shop/`, `sample-envelope/`, `sample-shop.html`, or `sample-envelope.html` from this organization site. The workflow rejects those paths in `dist/`, including symlinks.
