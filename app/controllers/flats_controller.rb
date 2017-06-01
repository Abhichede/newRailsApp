class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # GET /flats
  # GET /flats.json
  def index
    @flats = Flat.all
  end

  # GET /flats/1
  # GET /flats/1.json
  def show
  end

  # GET /flats/new
  def new
    @flat = Flat.new
    @site = Site.find(params[:site_id])
  end

  # GET /flats/1/edit
  def edit
    @site = Site.find(params[:site_id])
  end

  # POST /flats
  # POST /flats.json
  def create
    @flat = Flat.new(flat_params)
    session[:return_to] ||= request.referer
    @flats = Flat.where(site_id: flat_params[:site_id], flat_number: flat_params[:flat_number])
    flat_type = 'FLAT'
    if flat_params[:flat_type] === 'SHOP'
      flat_type = 'SHOP'
    end
    respond_to do |format|

      if !@flats.blank?
        format.html { redirect_to session[:return_to] ||= request.referer, alert: 'Flat number already available' }
        format.json { render json: @flat.errors, status: 'Flat number already available' }
      else
        if @flat.save
          format.html { redirect_to @flat, notice: 'Flat was successfully Saved.' }
          format.json { render :show, status: :created, location: @flat }
        else
          format.html { render :new }
          format.json { render json: @flat.errors, status: :unprocessable_entity }
        end
      end

    end
  end

  # PATCH/PUT /flats/1
  # PATCH/PUT /flats/1.json
  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to @flat, notice: 'Flat was successfully Saved.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1
  # DELETE /flats/1.json
  def destroy
    @flat.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flat_params
      params.require(:flat).permit(:flat_number, :area, :floor, :flat_cost,:govt_rate, :govt_value,:flat_type, :wing, :amenities,:flat_rate, :site_id)
    end
end
