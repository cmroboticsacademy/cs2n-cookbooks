script 'Run Test Newsletter' do
  interpreter "ruby"
  cwd node[:deploy]['cs2n'][:deploy_to]
  code <<-EOH
    sudo bundle exec rails console
    WannaShareEmailsWorker.perform_async(:summer_of_learning,:test)
  EOH
end