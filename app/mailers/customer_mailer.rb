class CustomerMailer < ApplicationMailer
  default from: 'uniquesoftdevelopers@gmail.com'

  def welcome_email()
    mail(to: 'abhijitchede777@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
