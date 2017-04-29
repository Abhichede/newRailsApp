class BookingDetailsMailer < ApplicationMailer
  def booking_details_mail(booking_details)
    @booking_detail = booking_details
    mail(to: 'abhichede777@gmail.com', subject: 'Booking Details')
  end
end
