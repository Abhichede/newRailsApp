class BookingDetail < ApplicationRecord
  belongs_to :site
  belongs_to :flat
  has_many :payment_details

  def payment_schedule
    BookingDetailsMailer.dummy_mail.deliver
  end
end
