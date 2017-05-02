class BookingDetailsMailer < ApplicationMailer
  def booking_details_mail(booking_details)
    @booking_detail = booking_details
    mail(to: 'abhichede777@gmail.com', subject: 'Booking Details')
  end

  def payment_details_mail(payment_details)
    @payment_detail = payment_details
    mail(to: 'abhichede777@gmail.com', subject: 'Payment Details')
  end

  def dummy_mail()
    mail(to: 'abhichede777@gmail.com', subject: 'Dummy Mail')
  end
end
