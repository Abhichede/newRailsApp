class CustomerDocumentsController < ApplicationController
  before_action :authorised?

  def index
    @customer_documents = booking_details.customer_documents
  end

  def show
  end

  def new
    @customer_document = CustomerDocument.new
  end

  def create
    @customer_document = booking_details.customer_documents.build(customer_document_params)
      respond_to do |format|
        if @customer_document.save!
          format.html { redirect_to booking_detail_customer_documents_path, notice: 'Created successfully.' }
        else
          format.html { render :new }
        end
      end
  end

  private

  def booking_details
    @booking_details ||= BookingDetail.find(params[:booking_detail_id])
  end

  def customer_document_params
    params.require(:customer_document).permit(:name, :description, :path)
  end
end
