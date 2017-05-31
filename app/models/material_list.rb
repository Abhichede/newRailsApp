class MaterialList < ApplicationRecord
  validates :material_name, :uniqueness => true
end
