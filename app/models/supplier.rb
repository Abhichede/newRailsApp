class Supplier < ApplicationRecord

  has_many :materials, dependent: :destroy

  validates :name, :uniqueness => true
end
