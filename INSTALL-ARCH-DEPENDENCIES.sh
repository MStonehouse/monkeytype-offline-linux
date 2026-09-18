#!/usr/bin/env bash
set -euo pipefail

echo "Installing build dependencies for Monkeytype Offline on Arch Linux."
echo "You may be asked for your password for sudo."

sudo pacman -S --needed --noconfirm \
  base-devel \
  curl \
  wget \
  file \
  openssl \
  gtk3 \
  webkit2gtk-4.1 \
  libappindicator-gtk3 \
  librsvg \
  patchelf \
  nodejs-lts-jod \
  pnpm

if ! command -v rustc >/dev/null 2>&1; then
  echo "Rust was not found. Installing Rust with rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  echo "Rust installed. Run: source \"$HOME/.cargo/env\""
else
  echo "Rust is already installed."
fi

echo
echo "Dependency installation finished."
echo "Verify that 'node --version' reports v24.x before building."
