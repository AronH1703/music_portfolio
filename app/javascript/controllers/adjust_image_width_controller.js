// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   connect() {
//     console.log("✅ AdjustImageWidthController connected!");

//     this.resetImageStyles(); // Reset styles before recalculating

//     // Ensure images are loaded and properly resized
//     this.waitForImagesToLoad().then(() => {
//       this.adjustImageAndTextWidth();
//     });

//     // Event listeners
//     window.addEventListener("resize", this.adjustImageAndTextWidth);
//     document.addEventListener("turbo:visit", this.forceResetOnTurbo);
//     document.addEventListener("turbo:load", this.forceReevaluate);
//   }

//   disconnect() {
//     window.removeEventListener("resize", this.adjustImageAndTextWidth);
//     document.removeEventListener("turbo:visit", this.forceResetOnTurbo);
//     document.removeEventListener("turbo:load", this.forceReevaluate);
//   }

//   resetImageStyles() {
//     this.element.querySelectorAll("img").forEach((img) => {
//       img.style.width = ""; // Reset to default
//     });
//   }

//   async waitForImagesToLoad() {
//     const images = this.element.querySelectorAll("img");

//     await Promise.all([...images].map(img => {
//       return new Promise(resolve => {
//         if (img.complete && img.clientHeight > 0) {
//           resolve(); // Already loaded with valid height
//         } else {
//           img.onload = () => {
//             if (img.clientHeight > 0) resolve(); // Wait for valid height
//           };
//         }
//       });
//     }));

//     console.log("✅ All images fully loaded with correct heights.");
//   }

//   adjustImageAndTextWidth() {
//     requestAnimationFrame(() => { // Prevents incorrect calculations
//       this.element.querySelectorAll("img").forEach((img) => {
//         const byElement = img.closest(".swiper-slide")?.querySelector(".by");

//         if (img.clientHeight > 900) {
//           img.style.width = "40%";
//           if (byElement) byElement.style.width = "40%";
//         } else {
//           img.style.width = "60%";
//           if (byElement) byElement.style.width = "60%";
//         }
//       });

//       // Ensure pagination position updates correctly
//       setTimeout(() => {
//         const swiper = document.querySelector(".mySwiper")?.swiper;
//         if (swiper) adjustButtonPositions(swiper);
//       }, 500);
//     });
//   }

//   forceResetOnTurbo = () => {
//     console.log("🔄 Turbo visit detected, resetting images...");
//     this.resetImageStyles();
//   };

//   forceReevaluate = () => {
//     console.log("🔄 Turbo loaded, rechecking images...");
//     setTimeout(() => {
//       this.waitForImagesToLoad().then(() => {
//         this.adjustImageAndTextWidth();
//       });
//     }, 500); // Ensures everything is properly reloaded
//   };
// }
