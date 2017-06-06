execute 'Running rake job_processess:summer_of_learning_email[test]' do
  cwd "#{node[:deploy]['cs2n'][:deploy_to]}/current"
  environment ({"RAILS_ENV" => node[:deploy]['cs2n'][:rails_env]}) 
  command "/usr/local/bin/bundle exec rake job_processess:summer_of_learning_email[test] #{node[:deploy]['cs2n'][:rails_env]}"
end