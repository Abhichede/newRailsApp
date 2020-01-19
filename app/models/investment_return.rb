class InvestmentReturn < ApplicationRecord
  has_many :investment_return_metums, dependent: :destroy
  belongs_to :investment
end
