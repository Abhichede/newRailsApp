desc "Heroku scheduler tasks"
task :dummy_testing => :environment do
  puts "testing tasks before scheduling."
  Investor.update_monthly_interest
  puts "success !!!!"
end