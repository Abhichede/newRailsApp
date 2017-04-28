# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    CustomerMailer.welcome_email(User.first)
  end
end
