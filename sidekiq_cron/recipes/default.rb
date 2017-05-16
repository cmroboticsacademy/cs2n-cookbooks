#cron "sidekiq_cronjob" do
#  minute "*/5"
#  command "cd /srv/www/cs2n/current/ && sudo RAILS_ENV=#{node["deploy"]["cs2n"]["rails_env"]} bundle exec rake job_processess:test"
#  mailto "vnguyen@nrec.ri.cmu.edu"
#  user "deploy"
#end

env = node[:deploy]['cs2n'][:rails_env]
 
default_opts = {
  :env => env,
  :dir => node[:deploy]['cs2n'][:deploy_to],
  :user => node[:deploy]['cs2n'][:user],
  :group => node[:deploy]['cs2n'][:group]
}

#execute 'start_sidekiq' do
#  cwd "#{node[:deploy]['cs2n'][:deploy_to]}/current/"
#  command "sudo bundle exec sidekiq"
#end
 
cron_rake_script "job_processess:test", {
  :minute => "*/5"
}.merge(default_opts)