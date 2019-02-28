import flatpickr from "flatpickr";
require("flatpickr/dist/themes/material_blue.css");


const initFlatpickr = () => {
  const schedule = document.querySelector('#event_schedule')
  flatpickr(schedule, {
    enableTime: true,
    altInput: true,
    // dateFormat: "Y-m-d H:i",
  });
}

export { initFlatpickr };
