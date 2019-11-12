desc "Heroku scheduler tasks"
task :daily_interest_check => :environment do
  puts "checking for month complete to update."
  Investor.update_monthly_interest
  puts "success !!!!"
end

task :testing_task => :environment do
  puts "testing scheduler and mailers"

  # BookingDetailsMailer.dummy_mail.deliver
end