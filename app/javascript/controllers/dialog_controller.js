import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["dialog"];

  close() {
    this.element.remove();
  }

  closeIfOutside(e) {
    if (!this.element.querySelector(".rounded-lg").contains(e.target)) {
      this.close();
    }
  }
}
