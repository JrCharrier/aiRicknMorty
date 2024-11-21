import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";


// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    const bookings = JSON.parse(this.element.dataset.datepickerBookings || "[]");
    console.log(bookings)
    flatpickr(this.element, {
      dateFormat: "Y-m-d",
      minDate: "today",
      mode: "range",
      disable: bookings.map(booking => {
        return { from: booking[0], to: booking[1] };
      }),
    });
  }
}
