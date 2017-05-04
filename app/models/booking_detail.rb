class BookingDetail < ApplicationRecord
  belongs_to :site
  belongs_to :flat
  has_many :payment_details

  def self.payment_schedule
    BookingDetailsMailer.dummy_mail.deliver
  end

  def self.get_all_charges(booking_detail)

    flat_cost = (booking_detail.flat.flat_cost).to_i
    vat = booking_detail.vat.to_i
    service_tax = booking_detail.service_tax.to_i
    stamp_duty = booking_detail.stamp_duty.to_i
    registration_fees = booking_detail.registration_fees.to_i
    lbt = booking_detail.lbt.to_i
    legal_charges = booking_detail.legal_charges.to_i
    mseb_charges = booking_detail.MSEB_charges.to_i
    water_charges = booking_detail.water_charges.to_i
    parking_charges = booking_detail.parking_charges.to_i
    maintenance_charges = booking_detail.maintenance_charges.to_i
    other_charges = booking_detail.other_charges.to_i
    agreement_cost = booking_detail.agreement_cost.to_i

    all_charges = flat_cost + vat + service_tax + stamp_duty + registration_fees +
        lbt + legal_charges + mseb_charges + water_charges + parking_charges +
        maintenance_charges + other_charges + agreement_cost

    return all_charges

  end
end
