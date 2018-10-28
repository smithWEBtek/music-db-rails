namespace :db do
  desc 'heroku pg:reset, migrate, seed'
  task hdcms: :environment do
    exec('heroku pg:reset --app music-db-rails --confirm music-db-rails
      heroku run rake db:migrate --app music-db-rails
      heroku run rake db:seed --app music-db-rails')	
  end
end
