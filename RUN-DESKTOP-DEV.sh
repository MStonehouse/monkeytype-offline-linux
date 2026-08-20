#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v pnpm >/dev/null 2>&1; then
  corepack enable
  corepack prepare pnpm@11.21.0 --activate
fi

if ! command -v cargo-tauri >/dev/null 2>&1; then
  if [[ -f "$HOME/.cargo/env" ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
  fi
  cargo install tauri-cli --version '^2' --locked
fi

pnpm install --frozen-lockfile
pnpm --filter @monkeytype/frontend dev &
DEV_PID=$!
trap 'kill $DEV_PID >/dev/null 2>&1 || true' EXIT
sleep 4
cd src-tauri
cargo tauri dev
