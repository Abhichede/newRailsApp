# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ALPHANUMERIC_CHARGE_PATTERN = /^[0-9\-().\/\.]*$/

initBookingFormChargeFields = ->
  $('.booking-form-alphanumeric-charge').off('input.bookingFormCharge').on 'input.bookingFormCharge', ->
    sanitized = @value.replace /[^0-9\-().\/\.]/g, ''
    @value = sanitized if sanitized isnt @value

initBookingFormValidation = ->
  return unless $('form.booking_form').length

  $('form.booking_form').validate
    rules:
      'booking_form[apartment_declaration]':
        pattern: ALPHANUMERIC_CHARGE_PATTERN
      'booking_form[infrastructure_and_development]':
        pattern: ALPHANUMERIC_CHARGE_PATTERN
      'booking_form[other_charges]':
        pattern: ALPHANUMERIC_CHARGE_PATTERN
    messages:
      'booking_form[apartment_declaration]':
        pattern: 'Only numbers, -, (), / and . are allowed'
      'booking_form[infrastructure_and_development]':
        pattern: 'Only numbers, -, (), / and . are allowed'
      'booking_form[other_charges]':
        pattern: 'Only numbers, -, (), / and . are allowed'

$(document).on 'ready turbolinks:load', ->
  initBookingFormChargeFields()
  initBookingFormValidation()
