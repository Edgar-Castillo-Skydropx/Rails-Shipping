import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["listdown"];

  toggle(e) {
    e.preventDefault();
    this.listdownTarget.classList.toggle("hidden");
  }

  closeIfOutside(e) {
    if (
      !this.element.contains(e.target) &&
      !this.listdownTarget.classList.contains("hidden")
    ) {
      this.listdownTarget.classList.add("hidden");
    }
  }
}
