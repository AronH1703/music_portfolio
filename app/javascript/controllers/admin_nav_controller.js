import { Controller } from "@hotwired/stimulus";

// Toggles the admin navigation on small screens
export default class extends Controller {
  static targets = ["menu"];

  connect() {
    // Ensure collapsed by default on small screens
    this.setExpanded(false);
  }

  toggle(event) {
    event.preventDefault();
    const expanded = this.element.classList.toggle("open");
    this.setExpanded(expanded);
  }

  setExpanded(expanded) {
    const button = this.menuToggleButton();
    if (button) button.setAttribute("aria-expanded", expanded ? "true" : "false");
  }

  menuToggleButton() {
    return this.element.querySelector(".menu-toggle");
  }
}

