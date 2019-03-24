# Use this file to easily define all of your cron jobs.
# http://en.wikipedia.org/wiki/Cron
# Learn more: http://github.com/javan/whenever

# update cron list with  $ bundle exec whenever -i
# list tasks wtih $ crontab -l, -r to reset
require 'rails'

set :output, {:error => 'log/mm_immo_scrap.error.log', :standard => 'log/mm_immo_scrap.success.log'}

# every 1.minute do # 1.minute 1.day 1.week 1.month 1.year
# 	command "echo 'llamas can run command too'"
# end

every 1.minute do 	
	#command "echo 'db seed has been ran and will be ran again in 5 mins'", , environment: Rails.env
	#rake 'classfield:mm_scraper', environment: Rails.env # not working
	#	command "../../lib/tasks/mm_immo_scrap.rb"
	command "lib/tasks/mm_immo_scrap.rb"

 end
