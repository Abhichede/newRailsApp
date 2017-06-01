class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy, :update_supplier_payment]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @material = @supplier.materials.all
    @sites = Site.all

  end

  # GET /suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @supplier = Supplier.new(supplier_params)
    session[:return_to] ||= request.referer
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to session.delete(:return_to),notice: 'Supplier was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # *********************************************************** #
  def update_supplier_payment
    paid_amount = @supplier.paid_amount.to_f

    if (@supplier.total_amount.to_f - @supplier.paid_amount.to_f) >= params[:amount].to_f && params[:amount].to_f <= params[:max_payable_amount].to_f

      @outgoing_payment = OutgoingPayment.new(:payment_for => params[:payment_for], :amount => params[:amount],:payment_method => params[:payment_method],
                                              :payment_description => params[:payment_desc], :site_id => params[:site_id],:paid_by => params[:paid_by],
                                              :date => params[:payment_date], :payment_to => @supplier.name)

      if @outgoing_payment.save
        @supplier.update(:paid_amount => (params[:amount].to_f + paid_amount))

        #BookingDetailsMailer.payment_details_mail(@payment_detail).deliver
        respond_to do |format|
          format.html { redirect_to controller: 'sites', action: 'show_supplier_wise_material',id: params[:site_id],
                                    supplier: @supplier.id, notice: "Rs.#{params[:amount]} Amount paid." }
          format.json { render json: @supplier }
        end
      else
        respond_to do |format|
          format.html { redirect_to controller: 'sites', action: 'show_supplier_wise_material',id: params[:site_id],
                                    supplier: @supplier.id, alert: "Something went wrong." }
          format.json { render json: @supplierl.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to controller: 'sites', action: 'show_supplier_wise_material',id: params[:site_id],
                                  supplier: @supplier.id, alert: "You can't pay this amount." }
        format.json { render json: @supplierl.errors, status: :unprocessable_entity }
      end
    end

  end
  # *********************************************************** #

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    #@supplier.destroy
    @supplier.update(:deleting_status=>'true')
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :email, :contact_number,
                                       :contact_person, :deleting_status, :total_amount,
                                       :paid_amount)
    end
end
