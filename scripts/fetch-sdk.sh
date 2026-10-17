#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")/.."
rm -rf ./sdk
git clone --depth 1 --filter=blob:none --sparse --branch "${SDK_REF:-main}" https://github.com/vibe-backend/sdk.git ./sdk
git -C ./sdk sparse-checkout set docs
printf 'Fetched SDK commit: %s\n' "$(git -C ./sdk rev-parse HEAD)"
