class Investor < ApplicationRecord

  has_many :investments


  def self.num_to_lakh(num)
    in_lakh = num.to_f / 100000.0

    return "#{in_lakh} Lakhs"
  end

  def self.update_monthly_interest
    Investor.all.each do |investor|
      investor.investments.each do |investment|
        last_date = Date.parse(investment.investment_monthly_interests.last.month)
        current_date = Date.today
        interest_rate = investment.interest_rate.to_i
        capital_amount = investment.investment_amount.to_f
        last_total_payable = investment.total_payable_amount.to_f

        puts "last Date: #{last_date}"
        puts "current Date: #{current_date}"
        puts "Interest Rate: #{interest_rate}"
        puts "Capital Amount: #{capital_amount}"
        puts "last total payable: #{last_total_payable}"

      end
    end
  end
end
