class Site < ApplicationRecord
  has_many :flats
  has_many :booking_details
  has_many :materials
  has_many :outgoing_payments
  has_many :departmental_labours
  has_many :contractual_labours
  has_many :contractors
  has_many :office_expences

  validates :name, uniqueness: true
  validates :type_of_structures, presence: true

  before_save do
    self.type_of_structures.gsub!(/[\[\]\"]/, "") if attribute_present?("type_of_structures")
  end


  mount_uploader :photo_path, ImageUploader
end
