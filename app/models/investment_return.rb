class InvestmentReturn < ApplicationRecord
  has_many :investment_return_metums
  belongs_to :investment
end
