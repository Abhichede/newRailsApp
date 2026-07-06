class BookingForm < ApplicationRecord
  ALPHANUMERIC_CHARGE_FORMAT = /\A[0-9\-().\/]*\z/

  validates :apartment_declaration,
            :infrastructure_and_development,
            :other_charges,
            format: {
              with: ALPHANUMERIC_CHARGE_FORMAT,
              message: 'may only contain numbers, -, (), / and .',
              allow_blank: true
            }
end
