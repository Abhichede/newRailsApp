class Investment < ApplicationRecord
  belongs_to :investor
  has_many :investment_returns, dependent: :destroy
  has_many :investment_monthly_interests, dependent: :destroy
end
