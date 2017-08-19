desc "Heroku scheduler tasks"
task :daily_interest_check => :environment do
  puts "checking for month complete to update."
  Investor.update_monthly_interest
  puts "success !!!!"
end