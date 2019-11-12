class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    @user = user
    # BookingDetailsMailer.schedule_next_installment_mail(@user).deliver_later
  end
end