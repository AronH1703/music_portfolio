import { application } from "controllers/application"; // ✅ Import Stimulus
import "@hotwired/turbo-rails"; // ✅ Turbo should be here
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);

// import KassiScrollController from "controllers/kassi_scroll_controller"
// application.register("kassi-scroll", KassiScrollController)





console.log("✅ application.js is loaded!"); // ✅ Debugging log
