import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.observeSections();
  }

  observeSections() {
    const sections = document.querySelectorAll('.scroll-selection');

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('active');
        } else {
          entry.target.classList.remove('active');
        }
      });
    }, {
      threshold: 0.1
    });

    sections.forEach(section => {
      observer.observe(section);
    });
  }
}
