# heroku have it's own Scheduler
# delete TODO
namespace :production do
  desc "Scrap classfields from MM, triggered with Heroku Scheduler."
  task scrap_mm_classfields: :environment do
  end

end
