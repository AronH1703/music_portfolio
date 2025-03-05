import { Controller } from "@hotwired/stimulus";
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";

gsap.registerPlugin(ScrollTrigger);

export default class extends Controller {
  connect() {
    console.log("✅ GSAP ScrollTrigger Controller Connected!");

    gsap.to(this.element, {
      scrollTrigger: {
        trigger: this.element,
        start: "top 80%",
        end: "top 30%",
        scrub: true,
      },
      x: 300,
      rotation: 360,
      duration: 2,
    });
  }
}
