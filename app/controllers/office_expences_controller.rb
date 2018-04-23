class OfficeExpencesController < ApplicationController
  before_action :set_office_expence, only: [:show, :edit, :update, :destroy]
  before_action :authorised?

  # GET /office_expences
  # GET /office_expences.json
  def index
    # if params[:filter_query]
    #   @site = Site.where('lower(name) LIKE ?', "%#{params[:filter_query].downcase}%").first
    #   if !@site.blank?
    #     @office_expences = OfficeExpence.where('lower(description) LIKE ? OR site_id = ?', "%#{params[:filter_query].downcase}%", "#{@site.id}").paginate(:page => params[:page], :per_page => 10).order('date DESC')
    #   else
    #     if params[:filter_query].downcase === 'other'
    #       @office_expences = OfficeExpence.where('lower(description) LIKE ? OR site_id = 0', "%#{params[:filter_query].downcase}%").paginate(:page => params[:page], :per_page => 10).order('date DESC')
    #     else
    #       @office_expences = OfficeExpence.where('lower(description) LIKE ?', "%#{params[:filter_query].downcase}%").paginate(:page => params[:page], :per_page => 10).order('date DESC')
    #     end
    #
    #   end
    #
    # else
    #   @office_expences = OfficeExpence.paginate(:page => params[:page], :per_page => 10).order('date DESC')
    # end

    @office_expences = OfficeExpence.all

  end

  # GET /office_expences/1
  # GET /office_expences/1.json
  def show
  end

  # GET /office_expences/new
  def new
    @office_expence = OfficeExpence.new
    @office_expences = OfficeExpence.all
    @sites = Site.all
  end

  # GET /office_expences/1/edit
  def edit
    @sites = Site.all
  end

  # POST /office_expences
  # POST /office_expences.json
  def create
    @office_expence = OfficeExpence.new(office_expence_params)

    respond_to do |format|
      if @office_expence.save
        @outgoing_payment = OutgoingPayment.new(:payment_for => 'OFFICE-EXPENCE', :amount => office_expence_params[:amount],:payment_method => office_expence_params[:payment_method],
                                                :payment_description => office_expence_params[:payment_desc], :site_id => office_expence_params[:site_id],:paid_by => office_expence_params[:paid_by],
                                                :date => office_expence_params[:date], :payment_to => office_expence_params[:payment_to], :payment_for_id => @office_expence.id)
        @outgoing_payment.save

        format.html { redirect_to @office_expence, notice: 'Office expense was successfully Saved.' }
        format.json { render :show, status: :created, location: @office_expence }
      else
        format.html { render :new }
        format.json { render json: @office_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_expences/1
  # PATCH/PUT /office_expences/1.json
  def update
    @outgoing_payment = OutgoingPayment.where(:payment_for => 'OFFICE-EXPENCE', :payment_for_id => @office_expence)
    respond_to do |format|
      if @office_expence.update(office_expence_params)
        @outgoing_payment.update(:amount => office_expence_params[:amount],:payment_method => office_expence_params[:payment_method],
                                 :payment_description => office_expence_params[:payment_desc], :site_id => office_expence_params[:site_id],:paid_by => office_expence_params[:paid_by],
                                 :date => office_expence_params[:date], :payment_to => office_expence_params[:payment_to])

        format.html { redirect_to @office_expence, notice: 'Office expense was successfully Save.' }
        format.json { render :show, status: :ok, location: @office_expence }
      else
        format.html { render :edit }
        format.json { render json: @office_expence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_expences/1
  # DELETE /office_expences/1.json
  def destroy
    @office_expence.destroy
    respond_to do |format|
      format.html { redirect_to office_expences_url, notice: 'Office expence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_expence
      @office_expence = OfficeExpence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_expence_params
      params.require(:office_expence).permit(:date, :description, :amount, :payment_to, :payment_method, :payment_desc, :paid_by, :deleting_status, :site_id)
    end
end
