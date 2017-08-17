class Investor < ApplicationRecord

  has_many :investments


  def self.num_to_lakh(num)
    in_lakh = num.to_f / 100000.0

    return "#{in_lakh} Lakhs"
  end
end
