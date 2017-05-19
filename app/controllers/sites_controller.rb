class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :show_site_material, :show_supplier_wise_material]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @flats = Flat.all
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
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_site_material
    @material = @site.materials.where(:type_of_material => params[:type_of_material])
  end

  def show_supplier_wise_material
    @material = @site.materials.where(:supplier_id => params[:supplier])
    @outgoing_payment = OutgoingPayment.where(:site_id => @site.id, :payment_to => @material.first.supplier.name)
  end
  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :address, :no_of_units, :site_type,
                                   :project_approved_by, :area_of_plot, :photo_path, :no_of_wings, :type_of_structures=> [])
    end
end
