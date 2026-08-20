#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Install Node.js, then run this file again."
  exit 1
fi

if ! command -v pnpm >/dev/null 2>&1; then
  echo "pnpm was not found. Trying to enable it with Corepack..."
  if command -v corepack >/dev/null 2>&1; then
    corepack enable
    corepack prepare pnpm@11.21.0 --activate
  else
    echo "Corepack is not available. Install pnpm, then run this file again."
    echo "A common command is: npm install -g pnpm"
    exit 1
  fi
fi

if [[ ! -d node_modules || ! -d frontend/node_modules ]]; then
  echo "First run: installing Monkeytype frontend dependencies..."
  pnpm install --filter @monkeytype/frontend... --frozen-lockfile
fi

echo "Starting Monkeytype Offline..."
echo "Open http://localhost:3000 in your browser."
pnpm dev-fe
