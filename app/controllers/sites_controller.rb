class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :show_site_material,
                                  :show_supplier_wise_material,:show_departmental_labours, 
                                  :print_all_customer_details, :print_all_supplier_details]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.order('created_at DESC')
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @flats = Flat.all
    @materials = @site.materials.all
    @outgoing_payment = @site.outgoing_payments.all
    @contract_list = ContractList.new
    @pie_size = {
        :height => 500,
        :width => 500
    }

    @pie_data = [
        [ 'red', 300 ],
        [ 'red', 50 ],
        [ 'red', 40 ],
        [ 'red', 40 ],
        [ 'red', 60 ]
    ].to_ary
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        #CustomerMailer.welcome_email().deliver_later
        format.html { redirect_to @site, notice: 'Site was successfully Created.'}
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_site_material
    @material = @site.materials.where(type_of_material: params[:type_of_material])
    @material = @material.where(supplier_id: params[:supplier_id]) if params[:supplier_id].present?
    @material = @material.where('type_of_material = ? AND (challan_no LIKE ? OR bill_no LIKE ?)', params[:type_of_material], "%#{params[:filter_query ]}%", "%#{params[:filter_query ]}%") if params[:filter_query].present?
    @material = @material.where('date = ?', params[:filter_date]) if params[:filter_date].present?
    @material = @material.order("date DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def show_supplier_wise_material
    @material = @site.materials.where(:supplier_id => params[:supplier]).paginate(:page => params[:page], :per_page => 10).order("#{:date} DESC")
    @supplier = Supplier.find(params[:supplier])
    # @outgoing_payment = OutgoingPayment.where(:site_id => @site.id, :payment_to => @supplier.name)
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully Updated.' }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url, notice: 'Site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # print customer details
  def print_all_customer_details
    respond_to do |format|
      format.pdf do
        render pdf: "booking_details"   # Excluding ".pdf" extension.
      end
    end
  end
  # print supplier details
  def print_all_supplier_details
    @materials = @site.materials.all
    @outgoing_payment = @site.outgoing_payments.all
    respond_to do |format|
      format.pdf do
        render pdf: "booking_details"   # Excluding ".pdf" extension.
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :address, :no_of_flats, :no_of_shops, :site_type,
                                   :project_approved_by, :area_of_plot, :photo_path, :no_of_wings, :type_of_structures=> [])
    end
end
