class CustomerMailer < ApplicationMailer
  default from: 'patilharak@gmail.com'

  def welcome_email()
    mail(to: 'patilharak@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
