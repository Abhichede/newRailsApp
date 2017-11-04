## Customer Booking mailer class
class BookingDetailsMailer < ApplicationMailer
  def booking_details_mail(booking_details, mailing_user)
    @booking_detail = booking_details
    mail(to: mailing_user.email, subject: 'Booking Details')
  end

  def payment_details_mail(payment_details, mailing_user)
    @payment_detail = payment_details
    mail(to: mailing_user.email, subject: 'Payment Details')
  end

  def schedule_next_installment_mail(booking_details, user)
    @booking_detail = booking_details
    mail(to: user.email, subject: 'Payment Details')
  end

  def dummy_mail
    @mailing_users = User.where(role: 'ADMIN')
    @mailing_users.each do |user|
       mail(to: user.email, subject: 'Dummy Mail')
     end
  end
end
