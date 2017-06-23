class Contractor < ApplicationRecord
  belongs_to :site
  has_many :contractual_labours
end
