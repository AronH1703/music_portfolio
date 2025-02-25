// app/javascript/controllers/three_controller.js
import { Controller } from "@hotwired/stimulus"
import * as THREE from "three"
import { GLTFLoader } from "three/examples/jsm/loaders/GLTFLoader"

export default class extends Controller {
  connect() {
    console.log("three_controller connected")
    // Use the element this controller is attached to as the container
    const container = this.element
    const width = container.clientWidth
    const height = container.clientHeight

    // Set up a basic scene
    const scene = new THREE.Scene()
    scene.background = new THREE.Color(0x0000ff) // Set background color to blue

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
      // Path to your glTF file in app/assets/images; asset pipeline will serve it at /assets/Star-Mask.gltf
      'assets/Star-Mask.gltf',
      (gltf) => {
        // When loaded, add the model to the scene
        console.log('Model loaded:', gltf)
        gltf.scene.position.set(0, 0, 0) // Adjust the model position
        gltf.scene.scale.set(85, 85, 85) // Adjust the model scale if necessary
        scene.add(gltf.scene)
        animate()
      },
      undefined,
      (error) => {
        console.error('Error loading glTF file:', error)
      }
    )

    // Simple render loop
    const animate = () => {
      requestAnimationFrame(animate)
      renderer.render(scene, camera)
    }
  }
}
