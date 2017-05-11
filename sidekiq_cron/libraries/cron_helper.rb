class Chef
  class Recipe
    def cron_rake_script(task, opts={})
    	opts = {
    	  :dir => "/srv/www/cs2n",
    	  :user => "deploy",
    	  :group => "deploy",
    	  :env => "production",
    	  :minute => "*",
    	  :hour => "*",
    	  :day => "*",
    	  :weekday => "*",
    	  :month => "*"
    	}.merge(opts)
    	pretty_task = task.gsub(':','_')
 
    	directory "#{opts[:dir]}/shared/scripts/cron" do
    	  owner opts[:user]
    	  group opts[:group]
    	  mode 0755
    	  action :create
    	end
 
    	template "#{opts[:dir]}/shared/scripts/cron/#{pretty_task}" do
    	      backup 0
    	      source "cron_task.erb"
    	      owner opts[:user]
    	      group opts[:group]
    	      mode 0755
    	      variables({
    	      :dir => "#{opts[:dir]}/current",
    	      :task => "rake #{task}",
    	      :env => opts[:env]
    	      })
    	end
 
    	cron pretty_task do
    	      user opts[:user]
    	      minute opts[:minute]
    	      hour opts[:hour]
    	      day opts[:day]
    	      month opts[:month]
    	      weekday opts[:weekday]
    	      command "#{opts[:dir]}/shared/scripts/cron/#{pretty_task}"
    	      path "/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/aws/bin:/home/ec2-user/bin:/opt/aws/bin"
    	      action :create
    	end
    end
  end
end