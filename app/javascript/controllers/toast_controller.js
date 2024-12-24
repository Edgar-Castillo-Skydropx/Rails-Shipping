import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["toast"];

  connect() {
    // Elimina el toast después de 5 segundos
    setTimeout(() => {
      this.remove();
    }, 5000); // 5000 ms = 5 segundos
  }

  remove() {
    this.element.remove(); // Elimina el elemento del DOM
  }
}
