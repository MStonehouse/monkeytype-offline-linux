# Changelog

All notable changes to Monkeytype Offline Desktop will be documented here.

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
