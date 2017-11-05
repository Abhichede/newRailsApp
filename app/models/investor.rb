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
        interest_rate = investment.interest_rate.to_f.round(2)
        capital_amount = investment.investment_amount.to_f.round(2)
        last_total_payable = investment.total_payable_amount.to_f.round(2)

        puts "checking for new month..."

        interest_amount = (capital_amount * interest_rate / 100)
        if (last_date + 30) <= current_date
          @investment_monthly = InvestmentMonthlyInterest.new(:investment_id => investment.id,
                                                              :month => (last_date  + 30),
                                                              :interest_rate => interest_rate,
                                                              :interest => interest_amount, :pending_interest => interest_amount)
          @investment_monthly.save
          investment.update(:current_month_interest => interest_amount, :total_payable_amount => (last_total_payable + interest_amount))

          puts "next month interest updated successfully"
        end

        puts "interest_rate: "+ interest_rate.to_s
        puts "Capital Amount: "+ capital_amount.to_s

      end
    end
  end
end
