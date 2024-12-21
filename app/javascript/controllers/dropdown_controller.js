import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dropdown"
export default class extends Controller {
  static targets = ["menu"];

  toggle(e) {
    console.log(this.menuTarget);
    e.preventDefault();
    //this.menuTarget.classList.toggle("hidden");
  }

  closeIfOutside(e) {
    console.log(this.menuTarget);
    // if (!this.element.contains(e.target)) {
    //   if (!this.menuTarget.classList.contains("hidden")) {
    //     this.menuTarget.classList.add("hidden");
    //   }
    // }
  }
}
