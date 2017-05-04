cron "sidekiq_cronjob" do
  minute "*/5"
  command "cd /srv/www/cs2n/current/ && sudo bundle exec rake job_processess:test"
end