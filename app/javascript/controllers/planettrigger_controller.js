import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="planettrigger"
export default class extends Controller {
  static targets = ["image"]
  connect() { 
    console.log(this.imageTarget)
  }
  showplanet() {
    this.imageTarget.classList.toggle("d-none");
    
  }
}
