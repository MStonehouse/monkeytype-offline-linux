# Monkeytype Offline Desktop

**The Monkeytype typing experience, packaged as a standalone offline Linux desktop application.**

No account • No ads • No analytics • No internet connection required

> **Unofficial community derivative:** This project is not affiliated with, endorsed by, or an official release of Monkeytype or the Monkeytype project.

---

## Screenshot

<!-- Add a screenshot of the application here.

Example:

![Monkeytype Offline Desktop](docs/images/monkeytype-offline.png)

-->

*Screenshot coming soon.*

---

## About

**Monkeytype Offline Desktop** is an offline-focused Linux desktop edition derived from the open-source [Monkeytype](https://github.com/monkeytypegame/monkeytype) project.

It preserves the familiar Monkeytype typing experience while removing or suppressing features that depend on Monkeytype's online services.

The goal is simple: provide a clean, distraction-free version of Monkeytype that can be installed and used locally on a Linux computer without requiring an account, backend server, or internet connection.

---

## Why Offline?

Monkeytype is an excellent browser-based typing application, but not every typing environment needs to be connected to the internet.

Monkeytype Offline Desktop is designed for people who want the core typing experience available as a local desktop application.

### The offline edition

* ✓ Works without an internet connection
* ✓ Requires no Monkeytype account
* ✓ Removes advertising and merch
* ✓ Removes cookie-consent UI
* ✓ Disables analytics
* ✓ Disables Sentry error reporting
* ✓ Removes normal account and profile entry points
* ✓ Removes leaderboard entry points
* ✓ Stores normal settings locally
* ✓ Runs as a native Linux desktop application

---

## What Is Preserved?

The goal of this project is to change as little of the actual typing experience as possible.

The offline edition preserves:

* the core Monkeytype typing engine;
* normal typing test modes;
* built-in themes;
* sounds;
* caret options;
* languages;
* quotes;
* punctuation mode;
* number mode;
* local settings;
* the normal results display.

Some dormant upstream modules remain in the source tree because removing shared modules wholesale could break otherwise-local functionality. They are not exposed through the normal offline interface.

---

# Installation

## Debian / Ubuntu / Linux Mint

Download the latest `.deb` installer from the **GitHub Releases** section of this repository.

Then open a terminal in the directory containing the downloaded file and run:

```bash
sudo apt install ./monkeytype-offline_*.deb
```

After installation, launch **Monkeytype Offline** from your desktop application menu.

### Uninstall

```bash
sudo apt remove monkeytype-offline
```

---

# Privacy and Networking

Monkeytype Offline Desktop is designed for local typing practice.

The offline configuration:

* disables analytics;
* disables Sentry;
* rejects cross-origin HTTP(S) requests;
* rejects cross-origin XHR requests;
* rejects `sendBeacon` traffic;
* does not require a Monkeytype account for the intended desktop workflow.

These protections are implemented through the application's offline defaults and runtime networking guard.

Monkeytype Offline Desktop is an **offline-focused application rather than a formal security sandbox**.

Users requiring strict network isolation can additionally block the application using their operating system or firewall.

---

# Building From Source

The project is packaged as a Linux desktop application using **Tauri 2**.

It uses:

* Node.js
* pnpm
* Rust
* Tauri

For first-time Linux build dependencies, run:

```bash
./INSTALL-LINUX-DEPENDENCIES.sh
```

Then build the Debian package with:

```bash
./BUILD-DEB.sh
```

The build script installs the required JavaScript dependencies, builds the frontend, and asks Tauri to create the Debian package.

The completed package will be written under:

```text
src-tauri/target/release/bundle/deb/
```

Additional Linux desktop build information is available in:

```text
README-LINUX-DESKTOP.txt
```

---

# GitHub Releases

A normal binary release should include:

1. the `.deb` installer;
2. optionally an AppImage;
3. source code corresponding to the tagged revision used to build the binaries.

Keeping the corresponding source available with binary releases is important because this derivative is distributed under the GNU General Public License v3.0.

---

# Upstream Project and Attribution

Monkeytype Offline Desktop is based on the open-source **Monkeytype** project created and maintained by the Monkeytype project and its contributors.

**Upstream project:**
https://github.com/monkeytypegame/monkeytype

**Upstream license:**
GNU General Public License v3.0

**Offline desktop modifications:**
Mike Stonehouse, 2026

The original Monkeytype authors and contributors retain copyright in their respective contributions.

See [`NOTICE.md`](NOTICE.md) for modification and attribution information.

See [`OFFLINE_EDITION.md`](OFFLINE_EDITION.md) for additional information about the offline-specific changes.

---

# License

Monkeytype is distributed under the **GNU General Public License v3.0 (GPL-3.0)**.

This derivative is likewise distributed under GPL-3.0.

The complete license text is available in [`LICENSE`](LICENSE).

If you distribute modified versions or binaries, comply with the GPL-3.0 requirements, including making the corresponding source available under the same license and preserving applicable copyright and license notices.

---

# Name, Logos and Branding

The GNU GPL governs copyright permissions for the software. It does not by itself grant trademark rights.

This repository clearly identifies Monkeytype Offline Desktop as an **unofficial community derivative**.

If you redistribute the project under substantially different branding, review your use of the Monkeytype name, logos, and other brand assets separately.

---

# Credits

A huge thank you to the **Monkeytype maintainers and contributors** for creating Monkeytype and making the project available as open-source software.

Monkeytype Offline Desktop would not exist without their work.

---

## Project Goal

This project isn't intended to replace the official Monkeytype website.

It provides another way to use the open-source Monkeytype typing experience: **locally, offline, and as a Linux desktop application.**
