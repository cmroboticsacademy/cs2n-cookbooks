cron "sidekiq" do
  minute "*/1"
  command "cd /srv/www/cs2n/current/"
  command "rake job_processes:test"
end