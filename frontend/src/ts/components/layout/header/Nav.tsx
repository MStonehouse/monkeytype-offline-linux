import { JSXElement } from "solid-js";

import { restartTestEvent } from "../../../events/test";
import { getActivePage } from "../../../states/core";
import { getFocus } from "../../../states/test";
import { cn } from "../../../utils/cn";
import { Button } from "../../common/Button";

/**
 * Offline desktop navigation.
 *
 * Monkeytype's typing, settings and theme UI are intentionally preserved.
 * Network/account surfaces are omitted because this build is intended to be
 * useful with no connection and has no login concept.
 */
export function Nav(): JSXElement {
  const buttonClass = () =>
    cn("aspect-square", {
      "opacity-(--nav-focus-opacity)": getFocus(),
    });

  return (
    <nav class={cn("z-5 flex w-full items-center gap-1 md:gap-2")}>
      <Button
        variant="text"
        fa={{ icon: "fa-keyboard", fixedWidth: true }}
        router-link
        href="/"
        class={buttonClass()}
        dataset={{ "data-nav-item": "test" }}
        onClick={() => {
          if (getActivePage() === "test") restartTestEvent.dispatch();
        }}
      />
      <Button
        variant="text"
        fa={{ icon: "fa-info", fixedWidth: true }}
        class={buttonClass()}
        dataset={{ "data-nav-item": "about" }}
        href="/about"
        router-link
      />
      <Button
        variant="text"
        fa={{ icon: "fa-cog", fixedWidth: true }}
        class={buttonClass()}
        dataset={{ "data-nav-item": "settings" }}
        href="/settings"
        router-link
      />
      <div class="grow" />
    </nav>
  );
}
