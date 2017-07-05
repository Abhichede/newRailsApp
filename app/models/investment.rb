class Investment < ApplicationRecord
  belongs_to :investor
  has_many :investment_returns
  has_many :investment_monthly_interests
end
