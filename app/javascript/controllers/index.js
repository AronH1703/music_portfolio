import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

import NavbarController from "./navbar_controller";
application.register("navbar", NavbarController);

import KassiScrollController from "./kassi_scroll_controller";
application.register("kassi-scroll", KassiScrollController);

import ThreeController from "./three_controller";
application.register("three", ThreeController);

import GsapScrollController from "./gsap_scroll_controller"; // ✅ Import GSAP Controller
application.register("gsap-scroll", GsapScrollController); // ✅ Register GSAP Controller

import ScrollAnimationController from "/scroll_animation_controller";
application.register("scroll-animation", ScrollAnimationController);

// ✅ Make Stimulus available in the browser console for debugging
window.Stimulus = application;
console.log("✅ Stimulus application is now globally accessible!");

// ✅ Manually register controllers if needed
// import SwiperController from "./swiper_controller";
// application.register("swiper", SwiperController);
