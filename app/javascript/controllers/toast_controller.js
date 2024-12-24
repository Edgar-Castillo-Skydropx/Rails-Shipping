// app/javascript/controllers/toast_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["container", "title", "body", "created_at"];

  connect() {
    document.body.addEventListener(
      "notification:received",
      this.show.bind(this)
    );
  }

  disconnect() {
    document.body.removeEventListener(
      "notification:received",
      this.show.bind(this)
    );
  }

  show(event) {
    const { title, body, created_at } = event.detail;
    this.titleTarget.textContent = title;
    this.bodyTarget.textContent = body;
    this.created_atTarget.textContent = created_at;

    this.containerTarget.classList.remove("hidden");
    this.containerTarget.classList.add("fade-in");

    // Ocultar automáticamente después de 5 segundos
    setTimeout(() => {
      this.hide();
    }, 5000);
  }

  hide() {
    this.containerTarget.classList.add("fade-out");
    setTimeout(() => {
      this.containerTarget.classList.add("hidden");
      this.containerTarget.classList.remove("fade-out");
    }, 1000);
  }
}
