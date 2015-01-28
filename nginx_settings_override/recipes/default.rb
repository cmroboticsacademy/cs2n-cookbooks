file "/etc/sysctl.conf" do
  content <<-EOH
  fs.file-max = 120000 
  EOH
end

bash "run sysctl command" do
  code "sysctl -p"
end