execute 'rake ' do
  command "sudo bundle exec rake job_processess:summer_of_learning_email[test]"
  cwd node[:deploy]['cs2n'][:deploy_to]
  environment 'RAILS_ENV' => node['deploy']['cs2n']['rails_env']
end