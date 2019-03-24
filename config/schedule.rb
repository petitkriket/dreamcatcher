# Use this file to easily define all of your cron jobs.
# http://en.wikipedia.org/wiki/Cron
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
# Learn more: http://github.com/javan/whenever

every 1.minute do # 1.minute 1.day 1.week 1.month 1.year
	command "echo 'llamas can run command too'"
end
