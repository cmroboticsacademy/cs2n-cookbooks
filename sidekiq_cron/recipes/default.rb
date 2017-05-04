cron "sidekiq" do
  minute "*/1"
  command "cd /srv/www/cs2n/current/ && sudo bundle exec rake job_processess:test"
  environment(  { 'RAILS_ENV' => node[:deploy]['cs2n'][:rails_env] } )
end