import { Application } from "@hotwired/stimulus";

const application = Application.start();
window.Stimulus = application; // ✅ This ensures Stimulus is available in the browser console

console.log("✅ Stimulus is now loaded!"); // ✅ Debugging Stimulus

export { application };
