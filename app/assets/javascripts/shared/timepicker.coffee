$(document).on 'turbolinks:load', ->
  $('.timepicker').pickatime({
    default: 'now',          # Set default time: 'now', '1:30AM', '16:30'
    fromNow: 0,              # set default time to * milliseconds from now (using with default = 'now')
    twelveHour: false,       # Use AM/PM or 24-hour format
    doneText: 'OK',          # text for done-button
    cancelText: 'Cancelar',    # Text for cancel-button
    autoClose: true,        # automatic close timepicker
    ampmClickable: false,     # make AM PM clickable
    format: 'hh:mm',
    formatSubmit: 'hh:mm'
  });
  return