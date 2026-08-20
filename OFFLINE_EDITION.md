# Monkeytype Offline Desktop – frontend cleanup pass

This pass intentionally preserves Monkeytype's practice frontend and themes while removing obvious online/account entry points.

## Changed
- Startup merch banner removed.
- Web cookie-consent UI and settings entry removed; offline defaults keep analytics and Sentry disabled.
- Header navigation now contains only typing, About, and Settings.
- Command palette no longer offers leaderboards, account, or profile search.
- Login tips, daily leaderboard rank, and advertisement containers are hidden.
- Google reCAPTCHA is no longer loaded.
- A small runtime guard rejects cross-origin HTTP(S) fetch/XHR and `sendBeacon` calls.

## Intentionally unchanged
- Typing engine and test modes
- Built-in themes and theme CSS
- Caret, blind/confidence, tape, sound, font, language, punctuation/number settings
- Current-test result UI and graphs
- Existing local configuration behavior

## Test
From repository root:

    pnpm dev-fe

Test with networking enabled and disabled. The practice experience should behave the same in both cases.

## Packaging
The offline edition is packaged with Tauri 2. The repository includes `BUILD-DEB.sh` for producing the Debian installer and `BUILD-LINUX-DESKTOP.sh` for producing the configured Linux bundles.

The Debian package includes the GPL-3.0 license, README and attribution notice under `/usr/share/doc/monkeytype-offline/`.

## Notes
Some dormant account/backend modules remain in source because deleting them prematurely risks breaking shared frontend imports. They are inaccessible from the normal offline UI and external HTTP(S) calls are blocked by the runtime guard.
