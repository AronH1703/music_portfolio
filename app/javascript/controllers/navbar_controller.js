import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "links"];

  connect() {
    console.log("✅ NavbarController is connected!");
  }

  toggle() {
    console.log("🔄 Toggling menu...");

    if (this.hasMenuTarget) {
      this.menuTarget.classList.toggle("show");

      // Apply animation class
      this.menuTarget.classList.toggle("fade-in");
      this.menuTarget.classList.toggle("slide-down");
    } else {
      console.error("❌ Menu target not found!");
    }
  }
}
