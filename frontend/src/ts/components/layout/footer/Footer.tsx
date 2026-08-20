import { JSXElement } from "solid-js";

import { getIsScreenshotting } from "../../../states/core";
import { getFocus } from "../../../states/test";
import { cn } from "../../../utils/cn";
import { Keytips } from "./Keytips";
import { ThemeIndicator } from "./ThemeIndicator";

export function Footer(): JSXElement {
  return (
    <footer
      class={cn("mx-auto flex w-full max-w-[1536px] flex-col gap-4 px-8 py-6")}
      classList={{
        "opacity-0": getIsScreenshotting(),
      }}
    >
      <Keytips />

      <div
        class="-m-2 flex justify-end transition-opacity"
        classList={{
          "opacity-0": getFocus(),
        }}
      >
        <ThemeIndicator />
      </div>
    </footer>
  );
}
