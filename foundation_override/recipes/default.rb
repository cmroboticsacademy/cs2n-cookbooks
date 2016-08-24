config_dir = "/home/deploy/.bundler/cs2n/ruby/1.9.1/gems/foundation-rails-5.5.0.0/vendor/assets/stylesheets/foundation/"

directory config_dir do
  owner "deploy"
  group "www-data"
  mode 0644
  recursive true
end

cookbook_file value_for_platform([ "centos", "redhat", "fedora", "suse" ] => {"default" => "/home/deploy/.bundler/cs2n/ruby/1.9.1/gems/foundation-rails-5.5.0.0/vendor/assets/stylesheets/foundation/_functions.scss"}, "default" => "/home/deploy/.bundler/cs2n/ruby/1.9.1/gems/foundation-rails-5.5.0.0/vendor/assets/stylesheets/foundation/_functions.scss") do
  source "_functions.scss"
  owner "deploy"
  group "www-data"
  mode 0644
end