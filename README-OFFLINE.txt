MONKEYTYPE OFFLINE - SLIM EDITION

FIRST RUN
1. Extract this ZIP.
2. Open the extracted "Monkeytype-Offline" folder.
3. Open a terminal in that folder.
4. Run:

   chmod +x START-MONKEYTYPE.sh
   ./START-MONKEYTYPE.sh

The first run installs the frontend dependencies. This requires an internet connection once.
After installation, the Monkeytype practice frontend can be started locally.

OPEN IN BROWSER
http://localhost:3000

LATER RUNS
Open a terminal in this folder and run:

   ./START-MONKEYTYPE.sh

OFFLINE CLEANUP INCLUDED
- Online/account navigation removed from normal UI.
- Leaderboard/account/profile command items removed.
- Login tips, daily rank, and advertisements hidden.
- Google reCAPTCHA removed.
- Cross-origin HTTP(S) frontend requests blocked.
- Aether/theme selector and Monkeytype practice functionality retained.


OFFLINE STARTUP WARNINGS
------------------------
This build suppresses only expected network/backend error notifications when
running offline. Genuine application errors and normal notices still appear.
