# Release Checklist

Use this checklist when publishing a GitHub release of Monkeytype Offline Desktop.

- [ ] Build from a clean checkout of the release commit/tag.
- [ ] Run `./BUILD-DEB.sh` and confirm the `.deb` is produced.
- [ ] Install the `.deb` on a Debian-based test system with `sudo apt install ./<package>.deb`.
- [ ] Confirm the app launches from the application menu.
- [ ] Confirm typing tests, settings, themes and results work without an internet connection.
- [ ] Confirm account/leaderboard UI, cookie prompts, advertisements and the merch banner are absent.
- [ ] Confirm `LICENSE` and `NOTICE.md` are present in the repository and Debian package.
- [ ] Tag the exact source revision used for the binary build.
- [ ] Create a GitHub Release from that tag.
- [ ] Attach the `.deb` installer and, if desired, the AppImage.
- [ ] Keep the corresponding source for that tag publicly available under GPL-3.0.
