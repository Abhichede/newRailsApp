class CustomerDocument < ApplicationRecord
  belongs_to :booking_detail, optional: true
  belongs_to :contractor, foreign_key: "contractor_id", optional: true
  has_many :documents
  mount_uploader :path, DocumentUploader
end
