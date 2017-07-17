class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
  end

  # GET /materials/new
  def new
    @material = Material.new
    @site = Site.find(params[:site_id])
    @supplier = Supplier.new
    @material_list = MaterialList.find_by(:material_name => params[:type_of_material])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
  end

  # GET /materials/1/edit
  def edit
    @supplier = Supplier.new
  end

  # POST /materials
  # POST /materials.json
  def create
    @material = Material.new(material_params)
    if !material_params[:challan_item].blank?
      @material.challan_no = material_params[:challan_no] + "-" + material_params[:challan_item]
    end
    @supplier = Supplier.find(material_params[:supplier_id])
    suppliers_total_amount = @supplier.total_amount.to_f
    total_cost = material_params[:amount].to_f
    gst_cost = 0
    if material_params[:is_gst]
      gst_rate = material_params[:gst_rate].to_i
      material_amount = material_params[:amount].to_f
      total_cost = material_amount + (material_amount * gst_rate / 100)
      gst_cost = material_amount * gst_rate / 100
    end
    respond_to do |format|
      if @material.save
        @updating_material = Material.where(:challan_no => material_params[:challan_no])
        @updating_material.update(:gst_cost => gst_cost, :amount => total_cost)
        @supplier.update(:total_amount => (total_cost + suppliers_total_amount))
        format.html { redirect_to session.delete(:return_to),
                                  notice: 'Material was successfully Saved.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { redirect_to session.delete(:return_to),
                                  alert: 'This challan was used before / something went erong.'  }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_material_rates

  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    previous_amount = @material.amount.to_f
    @supplier = Supplier.find(@material.supplier)
    suppliers_total = @supplier.total_amount.to_f
    total_cost = material_params[:amount].to_f

    gst_cost = 0
    if material_params[:is_gst]
      gst_rate = material_params[:gst_rate].to_i
      material_amount = material_params[:amount].to_f
      total_cost = material_amount + (material_amount * gst_rate / 100)
      gst_cost = material_amount * gst_rate / 100
    end
    respond_to do |format|
      if @material.update(material_params)
        if material_params[:amount].to_f != previous_amount
          new_suppliers_total = suppliers_total - previous_amount
          @supplier.update(:total_amount => (material_params[:amount].to_f + new_suppliers_total ))
        end
        @updating_material.update(:gst_cost => gst_cost, :amount => total_cost)
        format.html { redirect_to @material, notice: 'Material was successfully Saved.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'Material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
      params.require(:material).permit(:date, :supplier_id, :site_id, :type_of_material,
                                       :quantity, :unit, :challan_no, :truck_no, :time, :rate,
                                       :amount, :supervisor_name,:challan_item, :description,:bill_no, :is_gst, :gst_rate)
    end
end
