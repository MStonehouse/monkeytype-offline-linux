#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required before building. Install Node.js 22 or newer, then run this again."
  exit 1
fi

if ! command -v rustc >/dev/null 2>&1; then
  if [[ -f "$HOME/.cargo/env" ]]; then
    # shellcheck source=/dev/null
    source "$HOME/.cargo/env"
  fi
fi

if ! command -v rustc >/dev/null 2>&1; then
  echo "Rust is required before building. Run ./INSTALL-LINUX-DEPENDENCIES.sh first."
  exit 1
fi

if ! command -v pnpm >/dev/null 2>&1; then
  echo "pnpm was not found. Enabling pnpm with Corepack..."
  corepack enable
  corepack prepare pnpm@11.21.0 --activate
fi

if ! command -v cargo-tauri >/dev/null 2>&1; then
  echo "Installing the Tauri command-line builder with Cargo..."
  cargo install tauri-cli --version '^2' --locked
fi

echo "Installing frontend dependencies..."
pnpm install --frozen-lockfile

echo "Building Monkeytype frontend production files..."
pnpm --filter @monkeytype/frontend exec vite build

echo "Building Linux desktop packages with Tauri..."
cd src-tauri
cargo tauri build

cd ..
echo
echo "Build complete. Look for packages in:"
echo "  src-tauri/target/release/bundle/appimage/"
echo "  src-tauri/target/release/bundle/deb/"
echo
echo "For a quick test, run the AppImage from the appimage folder."
