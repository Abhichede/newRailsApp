class ContractorDocumentsController < ApplicationController
  before_action :authorised?

  def index
    @customer_documents = contractor.customer_documents
  end

  def show
  end

  def new
    @customer_document = CustomerDocument.new
  end

  def create
    @customer_document = contractor.customer_documents.build(customer_document_params)
      respond_to do |format|
        if @customer_document.save!
          build_images(@customer_document)
          format.html { redirect_to contractor_contractor_documents_path, notice: 'Created successfully.' }
        else
          format.html { render :new }
        end
      end
  end

  private

  def contractor
    @contractor ||= Contractor.find(params[:contractor_id])
  end

  def customer_document_params
    params.require(:customer_document).permit(:name, :description)
  end

  def build_images(object)
    (params[:customer_document][:documents] || []).each do |img|
      document = object.documents.build(path: img)
      document.save
    end
  end
end
