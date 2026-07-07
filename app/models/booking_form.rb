class BookingForm < ApplicationRecord
  ALPHANUMERIC_CHARGE_FORMAT = /\A[0-9\-().\/]*\z/

  CHARGE_FIELDS = %i[
    flat_cost
    government_consideration
    actual_agreement_cost
    mseb_and_other_charges
    water_charges
    allotted_parking_charges
    maintenance_charges
    stamp_duty
    registration_charges
    gst
    legal_charges
    apartment_declaration
    infrastructure_and_development
    other_charges
    booking_charges
    loan_possible
    balance_amount
    package_amount
  ].freeze

  validates(*CHARGE_FIELDS,
            format: {
              with: ALPHANUMERIC_CHARGE_FORMAT,
              message: 'may only contain numbers, -, (), / and .',
              allow_blank: true
            })
end
