import { Controller } from "@hotwired/stimulus"
import * as THREE from "three"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader"

export default class extends Controller {
  static added = false; // Prevent multiple instances

  connect() {
    console.log("Three.js controller connected")

    // Ensure Three.js only loads if the container exists
    const container = this.element;
    if (!container || this.constructor.added) {
      console.log("3D object already added, skipping...");
      return;
    }

    const width = container.clientWidth;
    const height = container.clientHeight;

    // Create Scene, Camera, and Renderer
    const scene = new THREE.Scene();
    scene.background = new THREE.Color(0xffffff);

    const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000);
    camera.position.set(0, 0, 10);

    const renderer = new THREE.WebGLRenderer({ antialias: true });
    renderer.setSize(width, height);

    // Clear previous children to prevent duplicate canvases
    while (container.firstChild) {
      container.removeChild(container.firstChild);
    }
    container.appendChild(renderer.domElement);

    // Lighting
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.8);
    scene.add(ambientLight);

    const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
    directionalLight.position.set(1, 1, 1).normalize();
    scene.add(directionalLight);

    // GLTF Model Loader
    const loader = new GLTFLoader();
    loader.load(
      '/assets/STAR-MASK3.glb', // Make sure this path works in Rails asset pipeline
      (gltf) => {
        console.log('Model loaded:', gltf);

        const starMesh = gltf.scene.getObjectByName('STAR');
        if (!starMesh) {
          console.error('STAR mesh not found in the GLTF file.');
          return;
        }

        starMesh.material.transparent = true;
        starMesh.material.opacity = 0.5;
        starMesh.material.side = THREE.DoubleSide;

        starMesh.position.set(0, 0.065, 0);
        starMesh.scale.set(70, 70, 70);

        if (!scene.getObjectByName('STAR')) {
          scene.add(starMesh);
        }

        this.constructor.added = true; // Prevents duplicate initialization

        // Animation Loop
        const animate = () => {
          requestAnimationFrame(animate);
          starMesh.rotation.y += 0.01;
          renderer.render(scene, camera);
        };
        animate();
      },
      undefined,
      (error) => {
        console.error('Error loading glTF file:', error);
      }
    );

    // Handle window resize
    window.addEventListener("resize", () => {
      camera.aspect = container.clientWidth / container.clientHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(container.clientWidth, container.clientHeight);
    });
  }

  disconnect() {
    console.log("Three.js controller disconnected, cleaning up...");
    this.constructor.added = false; // Allow reloading when navigating back
  }
}
