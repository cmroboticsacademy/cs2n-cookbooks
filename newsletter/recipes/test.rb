execute 'rake ' do
  cwd "#{node[:deploy]['cs2n'][:deploy_to]}/current"
  user "deploy"
  environment ({"RAILS_ENV" => node[:deploy]['cs2n'][:rails_env]}) 
  command "sudo /usr/local/bin/bundle exec rake job_processess:summer_of_learning_email[test]"
end