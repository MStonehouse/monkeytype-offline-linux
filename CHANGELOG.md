# Changelog

All notable changes to Monkeytype Offline Desktop will be documented here.

## 1.0.2 - 2026-08-20

### Changed

- Replaced the original Monkeytype header mark with a keyboard-based offline desktop mark.
- Changed the in-app header branding to `monkeytype offline`.
- Replaced Linux/Tauri application icons and browser/PWA icons with the new keyboard branding.
- Updated offline page metadata and removed unnecessary web preconnect branding.
- Added Tabler Icons MIT attribution to `NOTICE.md`.

## 1.0.1 - 2026-08-19

### Fixed

- Replaced the server-dependent About page with a fully local offline About page.
- Removed About-page prefetching so the information button no longer initiates server-dependent work.

### Changed

- Removed the unavailable Custom Text test mode from the desktop and mobile mode selectors.

## 1.0.0 - 2026-08-19

### Added

- Tauri 2 Linux desktop wrapper.
- Debian (`.deb`) and AppImage bundle configuration.
- One-command Debian build helper (`BUILD-DEB.sh`).
- GitHub Actions workflow for producing the Debian installer.
- GPL-3.0 and attribution documentation included in the Debian package.

### Changed

- Adapted the normal Monkeytype interface for offline desktop use.
- Removed normal account, profile and leaderboard entry points.
- Removed advertising-related UI, startup merch banner and cookie-consent UI.
- Disabled analytics and Sentry through offline defaults.
- Suppressed expected backend/network errors in the intended offline workflow.
- Prevented Google reCAPTCHA from loading.
- Added a runtime guard against cross-origin HTTP(S), XHR and beacon requests.

### Preserved

- Core typing modes and typing engine behavior.
- Themes, fonts, sounds and caret options.
- Languages, quotes, punctuation and number modes.
- Local settings and results display.
