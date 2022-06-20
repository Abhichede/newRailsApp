class Flat < ApplicationRecord

  belongs_to :site
  has_one :booking_detail, dependent: :destroy

  scope :shops, -> { where("flat_type LIKE lower('%?%')", "shop")}
  scope :booked_shops, -> { where("lower(flat_type) LIKE ? AND booking_status = ?", "%shop%", "1")}
  scope :booked_flats, -> { where(:booking_status => 1) }
end
