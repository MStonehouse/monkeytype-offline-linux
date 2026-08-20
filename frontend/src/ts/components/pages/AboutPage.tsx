import { JSXElement } from "solid-js";

import { H2, H3 } from "../common/Headers";
import { Page } from "../common/Page";

/** Offline-only About page. No queries, prefetching, or remote assets. */
export function AboutPage(): JSXElement {
  return (
    <Page id="about">
      <div class="content-grid grid gap-8">
        <section class="text-center text-sub">
          Monkeytype Offline Desktop
          <br />
          Version 1.0.1
        </section>
        <section>
          <H2 fa={{ icon: "fa-info-circle" }} text="about" />
          <p>
            Monkeytype Offline Desktop is an unofficial, offline-focused Linux
            desktop edition derived from the open-source Monkeytype typing test.
            It is designed to provide local typing practice without requiring a
            Monkeytype account or a connection to Monkeytype servers.
          </p>
        </section>
        <section>
          <H3 fa={{ icon: "fa-keyboard" }} text="offline edition" />
          <p>
            Core typing practice, themes, fonts, sounds, languages, quotes,
            punctuation, number modes, settings, and local results display are
            retained. Online account, profile, leaderboard, advertising,
            analytics, and other server-dependent features are intentionally
            unavailable in this edition.
          </p>
        </section>
        <section>
          <H3 fa={{ icon: "fa-code" }} text="license and attribution" />
          <p>
            This application is distributed under the GNU General Public
            License v3.0 (GPL-3.0). Monkeytype was created by Miodec and
            expanded by the Monkeytype contributors. This offline desktop
            edition contains modifications for standalone Linux use and is not
            affiliated with or endorsed by the official Monkeytype project.
          </p>
        </section>
      </div>
    </Page>
  );
}
