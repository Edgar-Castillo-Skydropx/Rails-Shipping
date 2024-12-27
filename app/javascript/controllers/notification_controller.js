import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["listdown", "dialogContent"];
  dialogController;

  connect() {
    this.dialogController =
      this.application.getControllerForElementAndIdentifier(
        document.querySelector("[data-controller='dialog']"),
        "dialog"
      );
  }

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
      <p><strong>Mensaje:</strong> ${notificationData.content}</p>
      <p><strong>Fecha:</strong> ${notificationData.created_at}</p>
    `;

    // Abrir el diálogo
    this.dialogController?.open();
  }
}
