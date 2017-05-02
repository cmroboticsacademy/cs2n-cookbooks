# run whenever
execute "whenever --update-crontab" do
  cd "/srv/www/cs2n/current/"
  command "whenever --update-crontab"
end
