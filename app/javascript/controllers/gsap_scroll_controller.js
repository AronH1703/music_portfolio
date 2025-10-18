import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("✅ GSAP ScrollTrigger Controller Connected!");

    // ✅ Register Plugin
    gsap.registerPlugin(ScrollTrigger);

    // ✅ Apply GSAP animation
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
