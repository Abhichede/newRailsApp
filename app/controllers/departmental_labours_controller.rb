class DepartmentalLaboursController < ApplicationController
  before_action :set_departmental_labour, only: [:show, :edit, :update, :destroy]
  before_action :authorised?

  # GET /departmental_labours
  # GET /departmental_labours.json
  def index
    @departmental_labours = DepartmentalLabour.all
  end

  # GET /departmental_labours/1
  # GET /departmental_labours/1.json
  def show
  end

  # GET /departmental_labours/new
  def new
    @departmental_labour = DepartmentalLabour.new
  end

  # GET /departmental_labours/1/edit
  def edit
  end

  # POST /departmental_labours
  # POST /departmental_labours.json
  def create
    @departmental_labour = DepartmentalLabour.new(departmental_labour_params)
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    respond_to do |format|
      if @departmental_labour.save
        format.html { redirect_to session.delete(:return_to), notice: 'Departmental labour was successfully created.' }
      else
        format.html { render session.delete(:return_to),alert: 'Something went wrong.' }
        format.json { render json: @departmental_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departmental_labours/1
  # PATCH/PUT /departmental_labours/1.json
  def update
    respond_to do |format|
      if @departmental_labour.update(departmental_labour_params)
        format.html { redirect_to @departmental_labour, notice: 'Departmental labour was successfully updated.' }
        format.json { render :show, status: :ok, location: @departmental_labour }
      else
        format.html { render :edit }
        format.json { render json: @departmental_labour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departmental_labours/1
  # DELETE /departmental_labours/1.json
  def destroy
    @departmental_labour.destroy
    respond_to do |format|
      format.html { redirect_to departmental_labours_url, notice: 'Departmental labour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_departmental_labour_payment
    @single_labour = DepartmentalLabour.find(params[:id])
    paid_amount = @single_labour.paid_amount.to_f
    session.delete(:return_to)
    session[:return_to] ||= request.referer

    if (@single_labour.amount.to_f - @single_labour.paid_amount.to_f) >= params[:amount].to_f && params[:amount].to_f <= params[:max_payable_amount].to_f

      @outgoing_payment = OutgoingPayment.new(:payment_for => params[:payment_for], :amount => params[:amount],:payment_method => params[:payment_method],
                                              :payment_description => params[:payment_desc], :site_id => params[:site_id],:paid_by => params[:paid_by],
                                              :date => params[:payment_date], :payment_to => params[:payment_to], :payment_for_id => params[:id])

      if @outgoing_payment.save
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
                                  alert: "You can't pay this amount, Amount should not be greater than balance amount" }
        format.json { render json: @single_labour.errors, status: :unprocessable_entity }
      end
    end

  end

  def show_departmental_labours
    @departmental_labour = DepartmentalLabour.new
    @site = Site.find(params[:id])
    @departmental_labours = @site.departmental_labours.paginate(:page => params[:page], :per_page => 10).order("#{:date} DESC")
  end

  def departmental_labour_payment_details
    @dept_lab = DepartmentalLabour.find(params[:id])
    @dept_lab_outgoing_payment = OutgoingPayment.where(:payment_for => 'DEPARTMENTAL_LABOURS-'+params[:id], :site_id => @dept_lab.site_id).order("#{:date} ASC")
    @site = Site.find(@dept_lab.site_id)
    if @dept_lab_outgoing_payment.blank?
      render status: :not_found
    else

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departmental_labour
      @departmental_labour = DepartmentalLabour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def departmental_labour_params
      params.require(:departmental_labour).permit(:date, :type_of_work, :amount, :paid_amount, :site_id)
    end
end
