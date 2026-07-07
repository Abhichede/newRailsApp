# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ALPHANUMERIC_CHARGE_PATTERN = /^[0-9\-().\/\.]*$/

BOOKING_FORM_CHARGE_FIELDS = [
  'flat_cost'
  'government_consideration'
  'actual_agreement_cost'
  'mseb_and_other_charges'
  'water_charges'
  'allotted_parking_charges'
  'maintenance_charges'
  'stamp_duty'
  'registration_charges'
  'gst'
  'legal_charges'
  'apartment_declaration'
  'infrastructure_and_development'
  'other_charges'
  'booking_charges'
  'loan_possible'
]

initBookingFormChargeFields = ->
  $('.booking-form-alphanumeric-charge').off('input.bookingFormCharge').on 'input.bookingFormCharge', ->
    sanitized = @value.replace /[^0-9\-().\/\.]/g, ''
    @value = sanitized if sanitized isnt @value

initBookingFormValidation = ->
  return unless $('form.booking_form').length

  rules = {}
  messages = {}
  chargeFieldMessage = 'Only numbers, -, (), / and . are allowed'

  for field in BOOKING_FORM_CHARGE_FIELDS
    rules["booking_form[#{field}]"] = pattern: ALPHANUMERIC_CHARGE_PATTERN
    messages["booking_form[#{field}]"] = pattern: chargeFieldMessage

  $('form.booking_form').validate
    rules: rules
    messages: messages

$(document).on 'ready turbolinks:load', ->
  initBookingFormChargeFields()
  initBookingFormValidation()
