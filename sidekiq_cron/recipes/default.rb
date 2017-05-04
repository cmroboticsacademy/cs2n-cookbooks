cron "sidekiq_cronjob" do
  minute "*/5"
  command "cd /srv/www/cs2n/current/ && sudo RAILS_ENV=#{node["deploy"]["cs2n"]["rails_env"]} bundle exec rake job_processess:test"
end