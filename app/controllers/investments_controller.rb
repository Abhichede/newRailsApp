# sdf
class InvestmentsController < ApplicationController

  def index
  end

  def edit
  end

  def create
    @investment = Investment.new(investment_params)
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @investment.save
        interest = investment_params[:investment_amount].to_f * (investment_params[:interest_rate].to_f / 100)
        @investment_monthly = InvestmentMonthlyInterest.new(:investment_id => @investment.id,
                                                            :month => Time.parse(investment_params[:investment_date]).month,
                                                            :interest_rate => investment_params[:interest_rate],
                                                            :interest => interest, :pending_interest => interest)
        if @investment_monthly.save
          format.html { redirect_to session.delete(:return_to), notice: 'Investment was successfully added.' }
          format.json { render 'investors/show', status: :ok, location: @investment }
        else
          format.html { redirect_to session.delete(:return_to),
                                    alert: 'something went wrong.'  }
          format.json { render json: @investment_monthly.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to session.delete(:return_to),
                                  alert: 'something went wrong.'  }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end

  end

  def investment_details
    @investment = Investment.find(params[:id])
    @inv_monthly_interest = InvestmentMonthlyInterest.where(:investment_id => @investment.id)

    if @inv_monthly_interest.blank?
      render status: :not_found
      puts 'error: Not found'
    else

    end
  end

  def investment_payment_details
    @investment = Investment.find(params[:id])

    if @investment.blank? || @investment.nil?
      render status: :not_found
      puts 'error: Not found'
    else

    end
  end

  def update
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def investment_params
    params.require(:investment).permit(:investor_id, :investment_date, :investment_amount,
                                       :interest_rate, :created_by, :last_month_interest,
                                       :current_month_interest, :total_payable_amount,
                                       :last_return_date, :is_monthly, :returning_date )
  end
end
