import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["section"];

  connect() {
    console.log("FullpageScrollController connected");
    // Set initial section index to 0 (first section)
    this.currentSectionIndex = 0;
    // Get all sections defined as Stimulus targets
    this.sections = this.sectionTargets;
    // Get the about section element by its ID
    this.aboutSection = document.getElementById("about");
    // Find the index of the section with the "threejs-section" class
    this.threejsSectionIndex = this.sections.findIndex(
      section => section.classList.contains("threejs-section")
    );
    // Custom flag to lock scrolling when needed
    this.isAnimating = false;
    // Bind event handlers to ensure "this" refers to our controller
    this.boundHandleScroll = this.handleScroll.bind(this);
    this.boundHandleWheel = this.handleWheel.bind(this);
    // Start listening for scroll events
    this.setupScrollListener();
  }

  setupScrollListener() {
    window.addEventListener("scroll", this.boundHandleScroll);
  }

  // Called on scroll events until the About section's bottom reaches the viewport
  handleScroll(event) {
    const aboutSectionBottom = this.aboutSection.getBoundingClientRect().bottom;
    const viewportHeight = window.innerHeight;
    console.log("About section bottom:", aboutSectionBottom);
    console.log("Viewport height:", viewportHeight);

    // When the bottom of the About section is at or above the bottom of the viewport:
    if (aboutSectionBottom <= viewportHeight) {
      // Stop listening to further scroll events
      window.removeEventListener("scroll", this.boundHandleScroll);
      // Force the scroll to the three.js section by setting the current index
      this.currentSectionIndex = this.threejsSectionIndex;
      this.scrollToSection(this.currentSectionIndex);
      // Lock further wheel events immediately
      this.isAnimating = true;

      // Poll until the three.js section is fully in view
      const checkThreejsInView = () => {
        const threejsRect = this.sections[this.threejsSectionIndex].getBoundingClientRect();
        console.log("Checking threejs section, top:", threejsRect.top);
        // Increase tolerance as needed; here we use 1000 (adjust if needed)
        if (Math.abs(threejsRect.top) < 1000) {
          console.log("Threejs section aligned. Pausing for 1.5 seconds...");
          setTimeout(() => {
            // Unlock scrolling and start listening to wheel events again
            this.isAnimating = false;
            window.addEventListener("wheel", this.boundHandleWheel);
          }, 1500);
        } else {
          requestAnimationFrame(checkThreejsInView);
        }
      };
      requestAnimationFrame(checkThreejsInView);
    }
  }

  // Called on wheel events after the three.js section is in view
  handleWheel(event) {
    // Ignore small scroll movements below the threshold
    const threshold = 50;
    if (Math.abs(event.deltaY) < threshold) return;

    if (this.isAnimating) return;
    this.isAnimating = true;

    console.log("Wheel event detected:", event.deltaY);
    console.log("Current section index before scroll:", this.currentSectionIndex);

    // Scrolling down: move to the next section if available
    if (event.deltaY > 0) {
      if (this.currentSectionIndex < this.sections.length - 1) {
        this.currentSectionIndex++;
        this.scrollToSection(this.currentSectionIndex);
      }
    } else {
      // Scrolling up: move to the previous section if available
      if (this.currentSectionIndex > 0) {
        this.currentSectionIndex--;
        this.scrollToSection(this.currentSectionIndex);
      }
    }
    console.log("Current section index after scroll:", this.currentSectionIndex);

    // Unlock wheel events after 1 second to prevent rapid scrolling
    setTimeout(() => {
      this.isAnimating = false;
    }, 1000);
  }

  // Smoothly scroll to the section at the given index
  scrollToSection(index) {
    console.log("Scrolling to section", index);
    console.log("Section element:", this.sections[index]);
    this.sections[index].scrollIntoView({ behavior: "smooth" });
  }
}
