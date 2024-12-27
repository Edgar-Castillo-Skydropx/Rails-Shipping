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

  openDialog(e) {
    const notificationData = JSON.parse(e.currentTarget.dataset.notification);

    // Crear el HTML del dialog
    const dialogHTML = this.createDialog(notificationData);

    // Insertar el dialog en el DOM
    const dialogContainer = document.createElement("div");
    dialogContainer.innerHTML = dialogHTML;

    console.info(dialogContainer.innerHTML);
    document.body.appendChild(dialogContainer);
  }

  createDialog(notification) {
    return `
      <div 
        class="fixed inset-0 flex items-center justify-center bg-black bg-opacity-50 z-50"
        data-controller="dialog"
      >
        <div 
          class="bg-white rounded-lg shadow-lg max-w-lg w-full transform transition duration-300 scale-95"
          data-action="click@window->dialog#closeIfOutside"
        >
          <!-- Header del Dialog -->
          <div class="flex justify-between items-center p-4 border-b">
            <h2 class="text-lg font-bold text-gray-800">Detalles de la notificación</h2>
            <button 
              class="text-gray-500 hover:text-gray-800" 
              data-action="dialog#close"
            >
              &times;
            </button>
          </div>

          <!-- Contenido del Dialog -->
          <div class="p-4 text-gray-700">
            <p><strong>Título:</strong> ${notification.title}</p>
            <p><strong>Mensaje:</strong> ${notification.content}</p>
            <p><strong>Fecha:</strong> ${new Date(
              notification.created_at
            ).toLocaleString()}</p>
          </div>
        </div>
      </div>
    `;
  }
}
