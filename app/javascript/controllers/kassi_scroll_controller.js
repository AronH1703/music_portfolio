import { Controller } from "@hotwired/stimulus"; // Import Stimulus controller

export default class extends Controller {
  // **Step 1: When the controller connects**
  connect() {
    console.log("✅ KassiScrollController connected!"); // Debugging message

    // **Step 2: Bind the scroll function to this instance**
    this.boundScrollEffect = this.scrollEffect.bind(this);

    // **Step 3: Add the scroll event listener**
    window.addEventListener("scroll", this.boundScrollEffect);
  }

  // **Step 4: When the controller disconnects**
  disconnect() {
    // Remove the scroll event listener to prevent memory leaks
    window.removeEventListener("scroll", this.boundScrollEffect);
  }

  // **Step 5: Function triggered when scrolling**
  scrollEffect() {
    console.log("Scrolling..."); // Debugging message

    // **Step 6: Get current scroll position**
    let scrollPosition = window.scrollY;

    // **Step 7: Calculate movement amount**
    let movement = scrollPosition * 0.6; // Adjust speed by changing multiplier

    console.log("this.element:", this.element); // Log the Stimulus parent element

    // **Step 8: Select the image inside the container**
    let image = this.element.querySelector(".kassi-image");

    if (image) {
      // **Step 9: Move the image upward based on scroll**
      console.log(`✅ Moving image up: -${movement}px`);
      image.style.transform = `translateY(-${movement}px)`;
    } else {
      console.warn("⚠️ .kassi-image NOT FOUND inside .kassi-container!"); // Debug if image is missing
    }

    // **Step 2: Move `.backdrop-title` background (ONLY if this element is `.backdrop-title`)**
    if (this.element.classList.contains("backdrop-title")) {
      let bgMovement = scrollPosition * 0.1; // Adjust speed for backdrop-title background
      console.log(`✅ Moving .backdrop-title background: ${bgMovement}%`);
      this.element.style.backgroundPosition = `90% ${60 - bgMovement}%`;
    }
  }
}
