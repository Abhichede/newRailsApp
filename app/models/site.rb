class Site < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :booking_details, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :outgoing_payments, dependent: :destroy
  has_many :departmental_labours, dependent: :destroy
  has_many :contractual_labours, dependent: :destroy
  has_many :contractors, dependent: :destroy
  has_many :office_expences, dependent: :destroy

  validates :name, uniqueness: true
  validates :type_of_structures, presence: true

  before_save do
    self.type_of_structures.gsub!(/[\[\]\"]/, "") if attribute_present?("type_of_structures")
  end


  mount_uploader :photo_path, ImageUploader

  def find_material type
    materials.where(type_of_material: type)
  end
end
