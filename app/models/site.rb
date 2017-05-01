class Site < ApplicationRecord
  has_many :flats
  has_many :booking_details


  mount_uploader :photo_path, ImageUploader
end
