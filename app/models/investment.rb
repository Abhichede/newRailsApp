class Investment < ApplicationRecord
  belongs_to :investor
  has_many :investment_returns
end
