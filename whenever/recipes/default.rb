# run whenever
execute "whenever --update-crontab" do
  cwd "/srv/www/cs2n/current/"
  command "whenever --update-crontab"
end
