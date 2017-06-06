script 'Run Test Newsletter' do
  interpreter "ruby"
  cwd node[:deploy]['cs2n'][:deploy_to]
  code <<-EOH
    sudo RAILS_ENV=#{node[:deploy]['cs2n']["rails_env"]} bundle exec rails console
    WannaShareEmailsWorker.perform_async(:summer_of_learning,:test)
  EOH
end