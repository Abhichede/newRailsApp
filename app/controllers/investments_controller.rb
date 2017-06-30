# sdf
class InvestmentsController < ApplicationController

  def index
  end

  def edit
  end

  def create
    @investment = Investment.new(investment_params)

    respond_to do |format|
      if @investment.save
        format.html
        format.js
      else
        format.html
        format.js
      end
    end

  end

  def update
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def investment_params
    params.require(:investment).permit(:investor_id, :investment_date, :investment_amount,
                                       :interest_rate, :created_by, :last_month_interest, :current_month_interest, :total_payable_amount, :last_return_date )
  end
end
