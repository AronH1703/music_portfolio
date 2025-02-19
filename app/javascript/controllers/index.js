import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import NavbarController from "./navbar_controller";
application.register("navbar", NavbarController);

import KassiScrollController from "./kassi_scroll_controller"

application.register("kassi-scroll", KassiScrollController)

// ✅ Manually register controllers if needed
import SwiperController from "./swiper_controller";
application.register("swiper", SwiperController);

