#!/usr/bin/env bash
set -euo pipefail

echo "Installing Linux packages commonly required for Tauri on Linux Mint / Ubuntu."
echo "You may be asked for your password for sudo."

sudo apt update

if apt-cache show libwebkit2gtk-4.1-dev >/dev/null 2>&1; then
  WEBKIT_PACKAGE="libwebkit2gtk-4.1-dev"
else
  WEBKIT_PACKAGE="libwebkit2gtk-4.0-dev"
fi

sudo apt install -y \
  build-essential \
  curl \
  wget \
  file \
  libssl-dev \
  libgtk-3-dev \
  libayatana-appindicator3-dev \
  librsvg2-dev \
  patchelf \
  "$WEBKIT_PACKAGE"

if ! command -v rustc >/dev/null 2>&1; then
  echo "Rust was not found. Installing Rust with rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  echo "Rust installed. Close and reopen your terminal, or run: source \"$HOME/.cargo/env\""
else
  echo "Rust is already installed."
fi

echo "Dependency install step finished."
