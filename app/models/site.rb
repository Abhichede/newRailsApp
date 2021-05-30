class Site < ApplicationRecord
  has_many :flats, dependent: :destroy
  has_many :booking_details, dependent: :destroy
  has_many :materials, dependent: :destroy
  has_many :outgoing_payments, dependent: :destroy
  has_many :departmental_labours
  has_many :contractual_labours
  has_many :contractors
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

  def materials_remaining_rate
    self.materials.where("CAST(amount as float) = 0.0")
  end

  def contractual_labours_grouped_by_contractor
    grouped_contractors = self.contractual_labours.group_by {|labour|  labour.contractor}
    agregated_hash = []
    grouped_contractors.each_pair do |contractor, labours|
      grouped_contracts = labours.group_by {|labour| labour.contract_name}
      grouped_contracts.each_pair do |contract, labours|
        total_amount = labours.sum {|labour| labour.amount.to_f }
        total_paid = labours.sum {|labour| labour.paid_amount.to_f }
        agregated_hash.push({
          contractor_name: contractor.name,
          contract_name: contract,
          total_amount: total_amount,
          total_paid: total_paid,
          remaining_amount: total_amount - total_paid
        })
      end
    end
    agregated_hash
  end
end
