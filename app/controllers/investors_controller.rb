class InvestorsController < ApplicationController
  before_action :set_investor, only: [:show, :edit, :update, :destroy]

  # GET /investors
  # GET /investors.json
  def index
    @investors = Investor.all.paginate(:page => params[:page], :per_page => 6)
  end

  # GET /investors/1
  # GET /investors/1.json
  def show
    @investment = Investment.new
    @investment_return = InvestmentReturn.new
  end

  # GET /investors/new
  def new
    @investor = Investor.new
  end

  # GET /investors/1/edit
  def edit
  end

  # POST /investors
  # POST /investors.json
  def create
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        format.html { redirect_to @investor, notice: 'Investor was successfully created.' }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investors/1
  # PATCH/PUT /investors/1.json
  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to @investor, notice: 'Investor was successfully updated.' }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  def investment_return
    @investment_return = InvestmentReturn.new(investment_return_params)
    @investment = Investment.find(investment_return_params[:investment_id])
    total_pending_interest = 0
    paying_amount = investment_return_params[:amount].to_f
    @pendings = @investment.investment_monthly_interests.where(' pending_interest > ? ', 0)
    @pendings.each do |pending|
      total_pending_interest += pending.pending_interest.to_f
    end

    respond_to do |format|
      if @investment_return.save
        if total_pending_interest > 0
          @pendings.each do |pending|
            if paying_amount > 0
              if paying_amount >= pending.pending_interest
                current_pending = pending.pending_interest.to_f
                pending.update(:paid_interest => (pending.paid_interest.to_f + pending.pending_interest.to_f),
                        :paid_date => investment_return_params[:date], :paid_by => investment_return_params[:paid_by],
                        :pending_interest => 0)
                total_pending_interest = total_pending_interest - current_pending
                paying_amount = paying_amount - current_pending

              else
                pending.update(:paid_interest => (pending.paid_interest.to_f + paying_amount),
                               :paid_date => investment_return_params[:date], :paid_by => investment_return_params[:paid_by],
                               :pending_interest => (pending.pending_interest.to_f - paying_amount))
                paying_amount = 0
              end
            end
          end
        else
          @investment.update(:investment_amount => (@investment.investment_amount.to_f - paying_amount))
          paying_amount = 0
        end

        if paying_amount > 0
          @investment.update(:investment_amount => (@investment.investment_amount.to_f - paying_amount))
        end

        @investment.update(:last_return_date => investment_return_params[:date],
                           :total_payable_amount => (@investment.total_payable_amount.to_f - investment_return_params[:amount].to_f))

        format.html {}
        format.js {}
      else
        format.html {}
        format.js {}
      end
    end
  end

  # DELETE /investors/1
  # DELETE /investors/1.json
  def destroy
    @investor.destroy
    respond_to do |format|
      format.html { redirect_to investors_url, notice: 'Investor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investor_params
      params.require(:investor).permit(:name, :address, :contact_number, :email, :deleting_status, :created_by)
    end

    def investment_return_params
      params.permit(:date, :investment_id, :amount, :description, :payment_method, :deleting_status, :paid_by)
    end
end
