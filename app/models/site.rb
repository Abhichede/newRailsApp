class Site < ApplicationRecord
  has_many :flats
  has_many :booking_details
  has_many :materials

  before_save do
    self.type_of_structures.gsub!(/[\[\]\"]/, "") if attribute_present?("type_of_structures")
  end


  mount_uploader :photo_path, ImageUploader
end
