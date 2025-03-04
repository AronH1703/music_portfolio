// app/javascript/controllers/three_controller.js
import { Controller } from "@hotwired/stimulus"
import * as THREE from "three"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader"

export default class extends Controller {
  static added = false; // Static flag to track if the object has been added

  connect() {
    if (this.constructor.added) {
      console.log("3D object already added, skipping...");
      return;
    }

    console.log("three_controller connected")
    // Use the element with the ID 'three-container' as the container
    const container = document.getElementById('three-container')
    const width = container.clientWidth
    const height = container.clientHeight

    // Set up a basic scene
    const scene = new THREE.Scene()
    scene.background = new THREE.Color(0xffffff) // Set background color to blue

    // Set up the camera
    const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000)
    camera.position.set(0, 0, 10)

    // Set up the renderer and append it to the container
    const renderer = new THREE.WebGLRenderer({ antialias: true })
    renderer.setSize(width, height)
    container.appendChild(renderer.domElement)

    // Add some basic lighting
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.8)
    scene.add(ambientLight)
    const directionalLight = new THREE.DirectionalLight(0xffffff, 1)
    directionalLight.position.set(1, 1, 1).normalize()
    scene.add(directionalLight)

    // Add a helper grid to visualize the scene
    const gridHelper = new THREE.GridHelper(100, 10)
    scene.add(gridHelper)

    // Instantiate the GLTFLoader
    const loader = new GLTFLoader()
    loader.load(
      // Path to your glTF file in app/assets/images; asset pipeline will serve it at /assets/STAR-MASK3.glb
      'assets/STAR-MASK3.glb',
      (gltf) => {
        // When loaded, add the model to the scene
        console.log('Model loaded:', gltf)

        // Extract the mesh from the loaded glTF
        const starMesh = gltf.scene.getObjectByName('STAR')
        if (!starMesh) {
          console.error('STAR mesh not found in the GLTF file.')
          return
        }

        // Ensure the material is transparent to achieve the glass effect
        starMesh.material.transparent = true
        starMesh.material.opacity = 0.5 // Adjust the opacity as needed
        starMesh.material.side = THREE.DoubleSide // Render both sides of the material

        starMesh.position.set(0, 0.065, 0) // Adjust the model position
        starMesh.scale.set(70, 70, 70) // Scale the model up

        // Check if the object is already in the scene
        if (!scene.getObjectByName('STAR')) {
          scene.add(starMesh)
        }

        // Set the flag to true to indicate the object has been added
        this.constructor.added = true;

        // Simple render loop with rotation animation
        const animate = () => {
          requestAnimationFrame(animate)
          starMesh.rotation.y += 0.01 // Rotate the model on the y-axis
          renderer.render(scene, camera)
        }
        animate()
      },
      undefined,
      (error) => {
        console.error('Error loading glTF file:', error)
      }
    )
  }
}
