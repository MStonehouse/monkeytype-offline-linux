import { JSXElement } from "solid-js";

import { restartTestEvent } from "../../../events/test";
import { getActivePage } from "../../../states/core";
import { getFocus } from "../../../states/test";
import { cn } from "../../../utils/cn";

export function Logo(): JSXElement {
  return (
    <a
      href={`${location.origin}/`}
      class="-m-2 flex h-6 w-max shrink-0 gap-2 rounded-[0.8rem] p-2 focus-visible:**:data-[ui-element='logoSubtext']:text-transparent"
      aria-label="Monkeytype Offline Home"
      router-link
      style={{
        "box-sizing": "content-box",
        "font-family": "Lexend Deca ,sans-serif",
      }}
      data-ui-element="logo"
      onClick={() => {
        if (getActivePage() === "test") restartTestEvent.dispatch();
      }}
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 24 24"
        class={cn("h-full fill-none stroke-[currentColor] text-main transition-colors", {
          "text-sub": getFocus(),
        })}
        stroke-width="1.8"
        stroke-linecap="round"
        stroke-linejoin="round"
        aria-hidden="true"
      >
        <rect x="2.5" y="5" width="19" height="14" rx="2.5" />
        <path d="M6 9h.01M9 9h.01M12 9h.01M15 9h.01M18 9h.01M6 12h.01M9 12h.01M12 12h.01M15 12h.01M18 12h.01" stroke-width="2.5" />
        <path d="M6 15h9M18 15h.01" />
      </svg>
      <div class="hidden h-6 place-content-center text-[2rem] leading-0 sm:grid">
        <h1
          class={cn("-mt-[0.11em] text-text transition-colors duration-250", {
            "text-sub": getFocus(),
          })}
          data-ui-element="logoText"
        >
          monkeytype offline
        </h1>
      </div>
    </a>
  );
}
