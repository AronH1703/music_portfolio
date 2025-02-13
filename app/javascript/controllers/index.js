import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import NavbarController from "./navbar_controller";
application.register("navbar", NavbarController);

// import SwiperController from "./swiper_controller"; // ✅ Ensure it's imported
// application.register("swiper", SwiperController);
