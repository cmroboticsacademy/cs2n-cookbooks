cron "sidekiq" do
  minute "*/1"
  command "cd /srv/www/cs2n/current/"
  command "sudo bundle exec rake job_processess:test"
end