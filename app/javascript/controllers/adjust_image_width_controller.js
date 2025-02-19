import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("✅ AdjustImageWidthController connected!");
    this.adjustImageAndTextWidth(); // ✅ Run when the controller connects

    // ✅ Recheck when window resizes
    window.addEventListener("resize", this.adjustImageAndTextWidth);
  }

  disconnect() {
    window.removeEventListener("resize", this.adjustImageAndTextWidth);
  }

  adjustImageAndTextWidth() {
    this.element.querySelectorAll("img").forEach((img) => {
      const byElement = img.closest(".swiper-slide")?.querySelector(".by"); // ✅ Get corresponding .by class

      if (img.clientHeight > 900) {
        img.style.width = "40%"; // ✅ Shrinks image width
        if (byElement) {
          byElement.style.width = "40%"; // ✅ Shrinks .by width to match
        }
      } else {
        img.style.width = "60%"; // ✅ Default image width
        if (byElement) {
          byElement.style.width = "60%"; // ✅ Default .by width
        }
      }
    });
  }
}
