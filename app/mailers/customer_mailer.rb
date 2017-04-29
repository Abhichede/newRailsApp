class CustomerMailer < ApplicationMailer
  default from: 'abhichede777@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: 'abhijitchede777@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
