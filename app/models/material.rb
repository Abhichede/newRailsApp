class Material < ApplicationRecord
  belongs_to :site
  belongs_to :supplier

 # validates :challan_no, :uniqueness => true, presence: true
  mount_uploaders :challan_photos, ChallanUploader
end
