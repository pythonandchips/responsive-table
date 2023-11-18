import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="frame-scroll-on-load"
export default class extends Controller {
  scrollIntoView() {
    this.element.scrollIntoView()
  }
}
