# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@fortawesome/fontawesome-free", to: "@fortawesome--fontawesome-free.js" # @6.7.2
pin "three", to: "https://cdn.jsdelivr.net/npm/three@0.150.1/build/three.module.js"
pin "three/examples/jsm/loaders/GLTFLoader", to: "https://cdn.jsdelivr.net/npm/three@0.150.1/examples/jsm/loaders/GLTFLoader.js"

pin_all_from "app/javascript/controllers", under: "controllers"
# pin "gsap" # @3.12.7
# pin "gsap/ScrollTrigger", to: "gsap--ScrollTrigger.js" # @3.12.7
