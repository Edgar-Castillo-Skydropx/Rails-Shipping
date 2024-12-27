import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["listdown", "dialog", "dialogContent", "dialogBox"];

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

  openDialog(e) {
    const notificationData = JSON.parse(e.currentTarget.dataset.notification);

    // Actualizar el contenido del diálogo
    this.dialogContentTarget.innerHTML = `
      <p><strong>Título:</strong> ${notificationData.title}</p>
      <p><strong>Mensaje:</strong> ${notificationData.body}</p>
      <p><strong>Fecha:</strong> ${notificationData.created_at}</p>
    `;

    // Mostrar el diálogo con transiciones
    this.dialogTarget.classList.remove("hidden", "opacity-0");
    this.dialogTarget.classList.add("opacity-100");

    this.dialogBoxTarget.classList.remove("scale-95");
    this.dialogBoxTarget.classList.add("scale-100");
  }

  closeDialog() {
    // Aplicar transiciones de salida
    this.dialogTarget.classList.add("opacity-0");
    this.dialogTarget.classList.remove("opacity-100");

    this.dialogBoxTarget.classList.add("scale-95");
    this.dialogBoxTarget.classList.remove("scale-100");

    // Esconder el diálogo después de la transición
    setTimeout(() => {
      this.dialogTarget.classList.add("hidden");
    }, 300); // Debe coincidir con `duration-300`
  }
}
