# Attribution and Modification Notice

This software is an unofficial derivative of **Monkeytype**, the open-source typing test maintained by the Monkeytype project and its contributors.

Upstream source:
https://github.com/monkeytypegame/monkeytype

Upstream license:
GNU General Public License v3.0 (GPL-3.0)

The complete GPL-3.0 license text is included in this repository as `LICENSE` and is also included with the Linux Debian package.

## Modifications

Offline desktop modifications were made by **Mike Stonehouse in 2026**. They include, among other changes:

- Tauri 2 Linux desktop packaging;
- Debian (`.deb`) and AppImage build support;
- removal or suppression of account, profile and leaderboard entry points from the normal offline interface;
- removal of advertising-related UI, the startup merch banner and web cookie-consent UI;
- disabling analytics and Sentry through offline defaults;
- suppression of expected backend/network errors in the offline workflow;
- removal of Google reCAPTCHA loading;
- an offline runtime guard that rejects cross-origin HTTP(S), XHR and `sendBeacon` traffic;
- preservation of local typing-practice features, themes and settings wherever practical.

The original Monkeytype authors and contributors retain copyright in their respective contributions. Mike Stonehouse claims copyright only in original modifications and additions contributed to this derivative, not in the upstream Monkeytype code.

This derivative remains licensed under GPL-3.0.

## No upstream endorsement

This is not an official Monkeytype release. It is not affiliated with, sponsored by, endorsed by, or maintained by the upstream Monkeytype project.

The GPL grants copyright permissions for the software but does not itself grant trademark rights in names, logos or other branding.
