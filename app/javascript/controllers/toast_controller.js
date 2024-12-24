import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = { duration: Number };

  connect() {
    // Configurar el timeout para eliminar el toast después de la duración especificada
    this.timeout = setTimeout(
      () => this.removeWithAnimation(),
      this.durationValue || 5000
    );
  }

  removeWithAnimation() {
    // Remover la clase de entrada y añadir la clase de salida para animación
    this.element.classList.remove("animate-fade-in");
    this.element.classList.add("animate-fade-out");

    // Escuchar el final de la animación antes de remover del DOM
    this.element.addEventListener(
      "animationend",
      () => {
        this.element.remove(); // Eliminar el elemento del DOM
      },
      { once: true }
    );
  }

  removeAfterDelay() {
    // Método para eliminar manualmente, útil si se llama desde Turbo o eventos
    this.removeWithAnimation();
  }

  disconnect() {
    // Limpiar el timeout al desconectarse
    clearTimeout(this.timeout);
  }
}
