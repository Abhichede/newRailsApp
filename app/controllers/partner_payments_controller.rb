class PartnerPaymentsController < ApplicationController
  before_action :set_partner_payment, only: [:show, :edit, :update, :destroy]

  # GET /partner_payments
  # GET /partner_payments.json
  def index
    @partner_payments = PartnerPayment.all
  end

  # GET /partner_payments/1
  # GET /partner_payments/1.json
  def show
  end

  # GET /partner_payments/new
  def new
    @partner_payment = PartnerPayment.new
  end

  # GET /partner_payments/1/edit
  def edit
  end

  # POST /partner_payments
  # POST /partner_payments.json
  def create
    @partner_payment = PartnerPayment.new(partner_payment_params)
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @partner_payment.save
        format.html { redirect_to session.delete(:return_to), notice: 'Partner payment was successfully Added.' }
        format.json { render :show, status: :created, location: @partner_payment }
      else
        format.html { render :new }
        format.json { render json: @partner_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partner_payments/1
  # PATCH/PUT /partner_payments/1.json
  def update
    respond_to do |format|
      if @partner_payment.update(partner_payment_params)
        format.html { redirect_to @partner_payment, notice: 'Partner payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @partner_payment }
      else
        format.html { render :edit }
        format.json { render json: @partner_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partner_payments/1
  # DELETE /partner_payments/1.json
  def destroy
    @partner_payment.destroy
    respond_to do |format|
      format.html { redirect_to partner_payments_url, notice: 'Partner payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner_payment
      @partner_payment = PartnerPayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_payment_params
      params.require(:partner_payment).permit(:payment_type, :date, :amount, :payment_method, :payment_desc, :partner_id)
    end
end
