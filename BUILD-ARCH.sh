#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js 24 is required before building. Run ./INSTALL-ARCH-DEPENDENCIES.sh first."
  exit 1
fi

NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]')"
if [[ "$NODE_MAJOR" != "24" ]]; then
  echo "Monkeytype requires Node.js 24.x. Found: $(node --version)"
  echo "Switch to Node 24, then rerun ./BUILD-ARCH.sh."
  exit 1
fi

if ! command -v rustc >/dev/null 2>&1 && [[ -f "$HOME/.cargo/env" ]]; then
  # shellcheck source=/dev/null
  source "$HOME/.cargo/env"
fi
if ! command -v rustc >/dev/null 2>&1; then
  echo "Rust is required. Run ./INSTALL-ARCH-DEPENDENCIES.sh first."
  exit 1
fi
if ! command -v makepkg >/dev/null 2>&1; then
  echo "makepkg is required. Install Arch base-devel first."
  exit 1
fi
if ! command -v pnpm >/dev/null 2>&1; then
  echo "pnpm was not found. Enabling pnpm with Corepack..."
  corepack enable
  corepack prepare pnpm@11.21.0 --activate
fi

export PATH="$HOME/.cargo/bin:$PATH"
export RECAPTCHA_SITE_KEY="${RECAPTCHA_SITE_KEY:-offline}"

echo "Installing JavaScript dependencies..."
pnpm install --frozen-lockfile

echo "Building Monkeytype workspace packages..."
pnpm --filter @monkeytype/tsup-config build
pnpm --filter @monkeytype/util build
pnpm --filter @monkeytype/schemas build
pnpm --filter @monkeytype/funbox build
pnpm --filter @monkeytype/contracts build
pnpm --filter @monkeytype/challenges build

echo "Building the Monkeytype frontend..."
pnpm --filter @monkeytype/frontend exec vite build

echo "Building the Tauri application..."
cd src-tauri
cargo build --release
cd ..

echo "Creating Arch package..."
cd packaging/arch
rm -f ./*.pkg.tar.zst
makepkg -f
PKG_FILE="$(find . -maxdepth 1 -type f -name 'monkeytype-offline-*.pkg.tar.zst' -print -quit)"
if [[ -z "${PKG_FILE:-}" ]]; then
  echo "Build finished but no Arch package was found."
  exit 1
fi

echo
echo "Arch package created successfully:"
echo "  packaging/arch/${PKG_FILE#./}"
echo
echo "Install it with:"
echo "  sudo pacman -U packaging/arch/${PKG_FILE#./}"
