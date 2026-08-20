#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required before building."
  exit 1
fi

if ! command -v rustc >/dev/null 2>&1 && [[ -f "$HOME/.cargo/env" ]]; then
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"
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
  echo "Installing the Tauri command-line builder..."
  cargo install tauri-cli --version '^2' --locked
fi

echo "Installing JavaScript dependencies..."
pnpm install --frozen-lockfile

echo "Building the Monkeytype frontend..."
pnpm --filter @monkeytype/frontend exec vite build

echo "Building Debian package..."
cd src-tauri
cargo tauri build --bundles deb

DEB_DIR="target/release/bundle/deb"
DEB_FILE="$(find "$DEB_DIR" -maxdepth 1 -type f -name '*.deb' -print -quit)"

if [[ -z "${DEB_FILE:-}" ]]; then
  echo "Build finished but no .deb package was found in $DEB_DIR"
  exit 1
fi

echo
echo "Debian package created successfully:"
echo "  src-tauri/$DEB_FILE"
echo
echo "Inspect package metadata with:"
echo "  dpkg-deb --info src-tauri/$DEB_FILE"
echo "  dpkg-deb --contents src-tauri/$DEB_FILE"
