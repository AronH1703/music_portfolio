import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu"];

  connect() {
    console.log("✅ NavbarController is connected!");

    // Wait until the DOM is fully loaded
    setTimeout(() => {
      if (this.hasMenuTarget) {
        console.log("🔍 Menu Target Found!", this.menuTarget);
      } else {
        console.error("❌ Menu target not found! Check HTML.");
      }
    }, 500); // Small delay
  }

  toggle() {
  console.log("🔄 Toggling menu...");

    if (this.hasMenuTarget) {
      this.menuTarget.classList.toggle("show"); // ✅ Use `show` instead of `hidden`
      console.log("📌 Menu classes after toggle:", this.menuTarget.classList);
    } else {
      console.error("❌ Menu target not found!");
    }
  }
}
