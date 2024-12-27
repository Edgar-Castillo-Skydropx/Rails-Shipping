import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="dialog"
export default class extends Controller {
  static targets = ["container", "content"];

  open() {
    this.containerTarget.classList.remove("hidden");
    requestAnimationFrame(() => {
      this.containerTarget.classList.remove("opacity-0");
      this.containerTarget.classList.add("opacity-100");

      this.contentTarget.classList.remove("scale-95");
      this.contentTarget.classList.add("scale-100");
    });
  }

  close() {
    this.containerTarget.classList.add("opacity-0");
    this.containerTarget.classList.remove("opacity-100");

    this.contentTarget.classList.add("scale-95");
    this.contentTarget.classList.remove("scale-100");

    setTimeout(() => {
      this.containerTarget.classList.add("hidden");
    }, 300); // Debe coincidir con `duration-300`
  }
}
