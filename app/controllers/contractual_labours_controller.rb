class ContractualLaboursController < ApplicationController
  before_action :set_contractual_labour, only: [:show, :edit, :update, :destroy]
  before_action :authorised?

  # GET /contractual_labours
  # GET /contractual_labours.json
  def index
    @contractual_labours = ContractualLabour.all
  end

  # GET /contractual_labours/1
  # GET /contractual_labours/1.json
  def show
  end

  # GET /contractual_labours/new
  def new
    @contractual_labour = ContractualLabour.new
    @contract_list = ContractList.where(:name => params[:contract_name])
    @contractor = Contractor.new

    session.delete(:return_to)
    session[:return_to] ||= request.referer
  end

  # GET /contractual_labours/1/edit
  def edit
    @contract_list = ContractList.where(:name => params[:contract_name])
    @contractor = Contractor.new

    session.delete(:return_to)
    session[:return_to] ||= request.referer
  end

  # POST /contractual_labours
  # POST /contractual_labours.json
  def create
    @contractual_labour = ContractualLabour.new(contractual_labour_params)
    gst_cost = contractual_labour_params[:gst_cost].to_f
    tds_cost = contractual_labour_params[:tds_cost].to_f
    total_amount = contractual_labour_params[:amount].to_f + gst_cost - tds_cost

    @contractor = Contractor.find(contractual_labour_params[:contractor_id])
    contractor_total = @contractor.total_amount.to_f

    respond_to do |format|
      if @contractual_labour.save
        @contractual_labour.update(:amount => total_amount)
        @contractor.update(:total_amount => contractor_total + total_amount)
        format.html { redirect_to session.delete(:return_to), notice: "Contract was successfully allocated to #{@contractor.name}." }
        format.json { render :show, status: :created, location: @contractual_labour }
      else
        format.html { render :new }
        format.json { render json: @contractual_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contractual_labours/1
  # PATCH/PUT /contractual_labours/1.json
  def update

    gst_cost = contractual_labour_params[:gst_cost].to_f
    tds_cost = contractual_labour_params[:tds_cost].to_f
    total_amount = contractual_labour_params[:amount].to_f + gst_cost - tds_cost

    @previous_contractor = Contractor.find(@contractual_labour.contractor_id)
    @new_contractor = Contractor.find(contractual_labour_params[:contractor_id])
    previous_contractor_total = @previous_contractor.total_amount.to_f

    @previous_contractor.update(:total_amount => previous_contractor_total - total_amount)

    new_contractor_total = @new_contractor.total_amount.to_f

    respond_to do |format|
      if @contractual_labour.update(contractual_labour_params)
        @contractual_labour.update(:amount => total_amount)
        @new_contractor.update(:total_amount => new_contractor_total + total_amount)
        format.html { redirect_to session.delete(:return_to), notice: 'Contractual labour was successfully updated.' }
        format.json { render :show, status: :ok, location: @contractual_labour }
      else
        format.html { render :edit }
        format.json { render json: @contractual_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contractual_labours/1
  # DELETE /contractual_labours/1.json
  def destroy
    @contractual_labour.destroy
    respond_to do |format|
      format.html { redirect_to contractual_labours_url, notice: 'Contractual labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_contractual_labours
    @site = Site.find(params[:id])
    @contractual_labours = @site.contractual_labours.where(:contract_name => params[:contract_name]).paginate(:page => params[:page], :per_page => 10).order("#{:date} DESC")
  end

  def update_contractual_labour_payment
    @contractor = Contractor.find(params[:contractor_id])

    @single_labour = ContractualLabour.find(params[:id])
    paid_amount = @single_labour.paid_amount.to_f
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    if (@single_labour.amount.to_f - paid_amount) >= params[:amount].to_f && params[:amount].to_f <= params[:max_payable_amount].to_f

      @outgoing_payment = OutgoingPayment.new(:payment_for => params[:payment_for], :amount => params[:amount],:payment_method => params[:payment_method],
                                              :payment_description => params[:payment_desc], :site_id => params[:site_id],:paid_by => params[:paid_by],
                                              :date => params[:payment_date], :payment_to => @contractor.name, :payment_for_id => params[:id])

      if @outgoing_payment.save
        @contractor.update(:paid_amount => (params[:amount].to_f + paid_amount))
        @single_labour.update(:paid_amount => (params[:amount].to_f + paid_amount))

        #BookingDetailsMailer.payment_details_mail(@payment_detail).deliver
        respond_to do |format|
          format.html { redirect_to session.delete(:return_to),notice: "Rs. #{params[:amount]} Amount paid." }
          format.json { render json: @single_labour }
        end
      else
        respond_to do |format|
          format.html { redirect_to session.delete(:return_to), alert: "Something went wrong." }
          format.json { render json: @single_labour.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to session.delete(:return_to),
                                  alert: 'You can not pay this amount, Amount should not be greater than balance amount' }
        format.json { render json: @single_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  def contractual_labour_payment_details

    @contr_lab = ContractualLabour.find(params[:id])
    @contr_lab_outgoing_payment = OutgoingPayment.where(:payment_for => 'CONTRACTOR', :site_id => @contr_lab.site_id,
                                                        payment_to: @contr_lab.contractor.name, :payment_for_id => params[:id]).order("#{:date} ASC")
    @site = Site.find(@contr_lab.site_id)
    if @contr_lab_outgoing_payment.blank?
      render status: :not_found
    else

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contractual_labour
      @contractual_labour = ContractualLabour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contractual_labour_params
      params.require(:contractual_labour).permit(:date, :contract_name, :contractor_id, :site_id, :quantity, :unit, :rate, :amount, :gst_rate, :gst_cost, :tds_rate, :tds_cost, :created_by)
    end
end
