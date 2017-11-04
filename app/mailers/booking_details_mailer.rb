## Customer Booking mailer class
class BookingDetailsMailer < ApplicationMailer
  def booking_details_mail(booking_details)
    @booking_detail = booking_details
    @users = User.where(role: 'ADMIN')
    @users.each do |user|
      mail(to: user.email, subject: 'Booking Details')
    end
  end

  def payment_details_mail(payment_details)
    @payment_detail = payment_details
    @users = User.where(role: 'ADMIN')
    @users.each do |user|
      mail(to: user.email, subject: 'Payment Details')
    end
  end

  def schedule_next_installment_mail(booking_details)
    @booking_detail = booking_details
    @users = User.where(role: 'ADMIN')
    @users.each do |user|
      mail(to: user.email, subject: 'Payment Details')
    end
  end

  def dummy_mail
    @users = User.where(role: 'ADMIN')
    @users.each do |user|
       mail(to: user.email, subject: 'Dummy Mail')
     end
  end
end
