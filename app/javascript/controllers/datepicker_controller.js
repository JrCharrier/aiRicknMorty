import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["price", "range"];

  connect() {
    console.log(this.priceTarget);
    // Récupère les réservations existantes depuis le dataset
    const bookings = JSON.parse(this.rangeTarget.dataset.datepickerBookings || "[]");

    if (!this.element._flatpickr) {
      flatpickr(this.rangeTarget, {
        dateFormat: "Y-m-d", // Format des dates
        minDate: "today",    // Date minimale sélectionnable
        mode: "range",       // Mode plage de dates
        disable: bookings.map(booking => ({
          from: booking[0],
          to: booking[1],
        })), // Désactive les dates déjà réservées
        onChange: (selectedDates) => {
          this.computeprice(selectedDates); // Calcul du prix lors de la sélection
        },
      });
    }
  }

  // Fonction qui calcule et affiche le prix
  computeprice(selectedDates) {
    if (selectedDates.length === 2) {
      const startDate = new Date(selectedDates[0]);
      const endDate = new Date(selectedDates[1]);
      const price = parseFloat(this.rangeTarget.dataset.datepickerPricePerDay);
      console.log(price);

      const days = Math.ceil((endDate - startDate) / (1000 * 3600 * 24));
      console.log(days);

      const finalPrice = price * days;
      console.log(finalPrice);


      this.priceTarget.textContent = `Estimated Price: ${finalPrice}€`;
    } else {
      this.priceTarget.textContent = "Estimated Price: €0.00";
    }
  }
}
