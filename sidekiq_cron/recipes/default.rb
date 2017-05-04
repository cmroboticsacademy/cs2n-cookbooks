cron "sidekiq" do
  minute "*/1"
  command %Q{
    cd /srv/www/cs2n/current/ && 
    sudo RAILS_ENV=#{node["deploy"]["cs2n"]["rails_env"]} bundle exec rake job_processess:test
  }
end