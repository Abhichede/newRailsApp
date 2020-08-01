# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
 every 2.minutes do
   # runner "BookingDetail.payment_schedule"
   rake 'testing_task'
 end

 every 1.day, at: '6:00 pm' do
  rake 'daily_interest_check'
end

# Learn more: http://github.com/javan/whenever