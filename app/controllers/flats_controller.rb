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
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    if flat_params[:flat_type].include?('SHOP') || flat_params[:flat_type].include?('shop')
      @flats = Flat.where(site_id: flat_params[:site_id], flat_number: flat_params[:flat_number], :flat_type => flat_params[:flat_type])
      respond_to do |format|
        if !@flats.blank?
          format.html { redirect_to session[:return_to] ||= request.referer, alert: 'Shop number already available' }
          format.json { render json: @flat.errors, status: 'Shop number already available' }
        else
          if @flat.save
            format.html { redirect_to @flat, notice: 'Shop was successfully Saved.' }
            format.json { render :show, status: :created, location: @flat }
          else
            format.html { render :new }
            format.json { render json: @flat.errors, status: :unprocessable_entity }
          end
        end

      end
    else
      @flats = Flat.where("site_id = ? AND flat_number = ? AND flat_type NOT LIKE %?%", flat_params[:site_id], flat_params[:flat_number], 'SHOP')
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
    if @flat.booking_status
      @flat.booking_detail.payment_details.each do |payments|
        payments.destroy
      end

      @flat.booking_detail.destroy
    end

    @flat.destroy

    respond_to do |format|
      format.html { redirect_to site_path(@flat.site_id), notice: 'Flat was successfully deleted.' }
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
