class Flat < ApplicationRecord

  belongs_to :site
  has_one :booking_detail, dependent: :destroy
end
