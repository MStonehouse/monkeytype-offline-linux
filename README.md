# Monkeytype Offline Desktop

An unofficial, offline-focused Linux desktop edition derived from the open-source [Monkeytype](https://github.com/monkeytypegame/monkeytype) project.

> **Unofficial community derivative:** This project is not affiliated with, endorsed by, or an official release of Monkeytype or the Monkeytype project.

## What this edition does

Monkeytype Offline Desktop keeps the core typing-practice experience local while removing or suppressing features that depend on Monkeytype's hosted services.

The offline edition currently:

- preserves the core typing engine and test modes;
- preserves built-in themes, sounds, caret options, languages, quotes, punctuation and number modes;
- preserves local settings and the normal results display;
- removes normal account, profile and leaderboard entry points;
- removes advertising, merch and cookie-consent UI from the desktop experience;
- disables analytics and Sentry through the offline defaults;
- blocks cross-origin HTTP(S), XHR and beacon traffic through an offline runtime guard;
- packages the frontend as a native Linux desktop application with Tauri 2.

Some dormant upstream modules remain in the source tree because removing shared modules wholesale could break otherwise-local functionality. They are not exposed through the normal offline interface.

## Linux installation

### Debian / Ubuntu / Linux Mint and derivatives

Download the `.deb` file from the matching GitHub Release, then install it with:

```bash
sudo apt install ./monkeytype-offline_*.deb
```

After installation, launch **Monkeytype Offline** from your desktop application menu.

To uninstall:

```bash
sudo apt remove monkeytype-offline
```

## Building the Debian package from source

The included helper script installs JavaScript dependencies, builds the frontend, and asks Tauri to create a Debian package:

```bash
./BUILD-DEB.sh
```

The finished package will be written under:

```text
src-tauri/target/release/bundle/deb/
```

For first-time Linux build dependencies, run:

```bash
./INSTALL-LINUX-DEPENDENCIES.sh
```

The project uses pnpm and Rust/Tauri. See `README-LINUX-DESKTOP.txt` for additional build notes.

## GitHub releases

A normal release should include:

1. the `.deb` installer;
2. optionally the AppImage;
3. the source code for the exact tagged revision used to build those binaries.

Keeping the corresponding source available with binary releases is important because this derivative is distributed under GPL-3.0.

## Privacy and networking

This edition is designed for local practice. Analytics and Sentry are disabled by the offline defaults, and an offline runtime guard rejects cross-origin HTTP(S), XHR and `sendBeacon` requests. No Monkeytype account is required for the intended desktop workflow.

This is an offline-focused derivative rather than a formal security sandbox. Users who require strict network isolation can additionally block the application at the operating-system or firewall level.

## Upstream project and attribution

This project is based on **Monkeytype**, created and maintained by the Monkeytype project and its contributors.

- Upstream source: https://github.com/monkeytypegame/monkeytype
- Upstream license: GNU General Public License v3.0
- Offline desktop modifications: Mike Stonehouse, 2026

The original Monkeytype authors and contributors retain copyright in their respective contributions. See [`NOTICE.md`](./NOTICE.md) for the modification and attribution notice and [`OFFLINE_EDITION.md`](./OFFLINE_EDITION.md) for a summary of the offline-specific changes.

## License

Monkeytype is distributed under the **GNU General Public License v3.0 (GPL-3.0)**. This derivative is likewise distributed under GPL-3.0. The complete license text is provided in [`LICENSE`](./LICENSE).

If you distribute modified versions or binaries, comply with the GPL-3.0 requirements, including making the corresponding source available under the same license and preserving applicable copyright and license notices.

## Name, logos and branding

The GPL governs copyright permissions for the software; it does not by itself grant trademark rights. This repository clearly identifies itself as an unofficial derivative. If you redistribute it under substantially different branding, review your use of the Monkeytype name, logos and other brand assets separately.

## Credits

Thank you to the Monkeytype maintainers and contributors for making the project available as open-source software.
