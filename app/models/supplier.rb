class Supplier < ApplicationRecord

  has_many :materials

  validates :name, :uniqueness => true
end
