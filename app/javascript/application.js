import { application } from "controllers/application"; // ✅ Import Stimulus
import "@hotwired/turbo-rails"; // ✅ Turbo should be here
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

console.log("✅ application.js is loaded!"); // ✅ Debugging log
