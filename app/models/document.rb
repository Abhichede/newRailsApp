class Document < ApplicationRecord
  belongs_to :customer_document

  mount_uploader :path, DocumentUploader
end
