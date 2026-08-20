Monkeytype Offline - Linux Desktop Test Package
===============================================

This package contains the working Monkeytype Offline v4 source plus a Linux-only Tauri desktop wrapper.

Recommended order:

1. Extract this ZIP.
2. Open a terminal inside the extracted Monkeytype-Offline folder.
3. Run:

   chmod +x INSTALL-LINUX-DEPENDENCIES.sh BUILD-LINUX-DESKTOP.sh RUN-DESKTOP-DEV.sh START-MONKEYTYPE.sh

4. Install the Linux build dependencies:

   ./INSTALL-LINUX-DEPENDENCIES.sh

   If Rust is installed during this step, close and reopen the terminal before continuing.

5. Build the desktop app:

   ./BUILD-LINUX-DESKTOP.sh

6. When the build finishes, check these folders:

   src-tauri/target/release/bundle/appimage/
   src-tauri/target/release/bundle/deb/

7. To test without installing, run the .AppImage file from the appimage folder.

8. To install it system-wide, install the .deb file, for example:

   sudo apt install ./src-tauri/target/release/bundle/deb/*.deb

Notes:
- The first build needs internet access to download JavaScript and Rust dependencies.
- After the app is built, the desktop app itself should run offline.
- The older START-MONKEYTYPE.sh browser-based launcher is still included as a fallback.
- RUN-DESKTOP-DEV.sh is only for quick development testing. The real package is created by BUILD-LINUX-DESKTOP.sh.
