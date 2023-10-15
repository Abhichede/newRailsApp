class BookingFormsController < ApplicationController
  before_action :set_booking_form, only: [:show, :edit, :update, :destroy]

  # GET /booking_forms
  # GET /booking_forms.json
  def index
    @booking_forms = BookingForm.all
  end

  # GET /booking_forms/1
  # GET /booking_forms/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@booking_form.name}", page_size: "A4"
      end
    end
  end

  # GET /booking_forms/new
  def new
    @booking_form = BookingForm.new
  end

  # GET /booking_forms/1/edit
  def edit
  end

  # POST /booking_forms
  # POST /booking_forms.json
  def create
    @booking_form = BookingForm.new(booking_form_params)

    respond_to do |format|
      if @booking_form.save
        format.html { redirect_to @booking_form, notice: 'Booking form was successfully created.' }
        format.json { render :show, status: :created, location: @booking_form }
      else
        format.html { render :new }
        format.json { render json: @booking_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /booking_forms/1
  # PATCH/PUT /booking_forms/1.json
  def update
    respond_to do |format|
      if @booking_form.update(booking_form_params)
        format.html { redirect_to @booking_form, notice: 'Booking form was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking_form }
      else
        format.html { render :edit }
        format.json { render json: @booking_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /booking_forms/1
  # DELETE /booking_forms/1.json
  def destroy
    @booking_form.destroy
    respond_to do |format|
      format.html { redirect_to booking_forms_url, notice: 'Booking form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking_form
      @booking_form = BookingForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_form_params
      params.require(:booking_form).permit(:date, :name, :address, :phone_number, :adhar, :pan_number, :building_name, :unit_no, :type_of_unit, :area, :floor, :flat_cost, :mseb_and_other_charges, :water_charges, :booking_charges, :balance_amount, :gst, :allotted_parking_charges, :maintenance_charges, :loan_possible, :actual_agreement_cost, :government_consideration, :stamp_duty, :registration_charges, :final_sale_deed_fees, :apartment_declaration, :infrastructure_and_development, :amenities_difference, :terms_and_conditions, :extras, :legal_charges, :package_amount, :booking_cost_type)
    end
end
