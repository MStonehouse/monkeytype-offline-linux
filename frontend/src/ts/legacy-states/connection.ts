import { debounce } from "throttle-debounce";
import { showSuccessNotification } from "../states/notifications";
import { connectionEvent } from "../events/connection";
import { onDOMReady } from "../utils/dom";
import { removeBanner } from "../states/banners";
import { isTestActive } from "../states/test";

let state = navigator.onLine;

export function get(): boolean {
  return state;
}

let noInternetBannerId: number | undefined = undefined;


export function showOfflineBanner(): void {
  // Offline edition: being disconnected is expected, so do not show a banner.
  return;
}

const throttledHandleState = debounce(5000, () => {
  if (state) {
    if (noInternetBannerId !== undefined) {
      showSuccessNotification("You're back online", {
        customTitle: "Connection",
      });
      removeBanner(noInternetBannerId);
      noInternetBannerId = undefined;
    }
  } else if (!isTestActive()) {
    showOfflineBanner();
  }
});

connectionEvent.subscribe((newState) => {
  state = newState;
  throttledHandleState();
});

onDOMReady(() => {
  state = navigator.onLine;
  if (!state) {
    showOfflineBanner();
  }
});
