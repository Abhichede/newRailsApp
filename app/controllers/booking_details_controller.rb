class BookingDetailsController < ApplicationController
  before_action :set_booking_detail, only: [:show, :edit, :update, :destroy]

  # GET /booking_details.js
  # GET /booking_details.js.json
  def index
    @booking_details = BookingDetail.all
  end

  # GET /booking_details.js/1
  # GET /booking_details.js/1.json
  def show
  end

  # GET /booking_details.js/new
  def new
    @booking_detail = BookingDetail.new
  end

  # GET /booking_details.js/1/edit
  def edit
  end

  # POST /booking_details.js
  # POST /booking_details.js.json
  def create
    @booking_detail = BookingDetail.new(booking_detail_params)

    respond_to do |format|
      if @booking_detail.save
        @flat = Flat.find(@booking_detail.flat_id)
        @flat.update(:booking_status=> 1, :booking_date=> Time.current)
        format.html { redirect_to @booking_detail, notice: 'Booking detail was successfully created.' }
        format.json { render :show, status: :created, location: @booking_detail }
      else
        format.html { render :new }
        format.json { render json: @booking_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_details.js/1
  # PATCH/PUT /booking_details.js/1.json
  def update
    respond_to do |format|
      if @booking_detail.update(booking_detail_params)
        format.html { redirect_to @booking_detail, notice: 'Booking detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_detail }
      else
        format.html { render :edit }
        format.json { render json: @booking_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_paid_amount

    @booking_detail = BookingDetail.find(params[:booking_id])
    if params[:search].blank?
        respond_to do |format|
          format.html { redirect_to @booking_detail, alert: "Blank Amount" }
          format.json { render json: @booking_detail.errors, status: :unprocessable_entity }
        end
      return
    end
    if @booking_detail.update(:paid_amount=> (params[:search].to_i + @booking_detail.paid_amount.to_i).to_s )

      respond_to do |format|
        format.html { redirect_to @booking_detail, notice: "Rs.#{params[:search]} Amount paid." }
        format.json { render json: @booking_detail }
      end

    end

  end

  # DELETE /booking_details.js/1
  # DELETE /booking_details.js/1.json
  def destroy
    @booking_detail.destroy
    @flat = Flat.find(@booking_detail.flat_id)
    @flat.update(:booking_status=> 0, :booking_date=> nil)
    respond_to do |format|
      format.html { redirect_to booking_details_url, notice: 'Booking detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_detail
      @booking_detail = BookingDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_detail_params
      params.require(:booking_detail).permit(:customer_name, :customer_address, :customer_contact, :customer_pan, :customer_adhar, :site_id, :flat_id, :booking_charges, :vat, :service_tax, :loan_possible, :agreement_cost, :registration_fees, :final_sale_deed_fees, :stamp_duty, :other_charges)
    end
end
