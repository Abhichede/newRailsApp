class PaymentDetailsController < ApplicationController
  def show
  end

  def destroy
    @payment_detail = PaymentDetail.find(params[:id])
    if @payment_detail.destroy
      paid_amount = @payment_detail.booking_detail.paid_amount.to_i
      @payment_detail.booking_detail.update(:paid_amount=>(paid_amount - @payment_detail.payable_amount.to_i))
    end
    respond_to do |format|
      format.html { redirect_to controller: 'payment_details', action: 'show', :booking_id=> @payment_detail.booking_detail.id, notice: 'Payment entry was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_payment_detail
    @payment_detail = PaymentDetail.find(params[:id])
  end
end