class CustomerDocument < ApplicationRecord
  belongs_to :booking_detail

  mount_uploader :path, DocumentUploader
end
