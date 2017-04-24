class BookingDetail < ApplicationRecord
  belongs_to :site
  belongs_to :flat
  has_many :payment_details
end
