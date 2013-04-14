node.default[:nginx][:worker_processes] = 2
node.default['nginx']['default_site_enabled'] = false

include_recipe "nginx"

directory node[:squash][:ssl_key_dir] do
  owner "root"
  group "root"
  mode 00600
  action :create
  recursive true
end

# place keys
cookbook_file "#{node[:squash][:ssl_key_dir]}/squash.blueboxgrid.com.key" do
  mode "600"
end

cookbook_file "#{node[:squash][:ssl_key_dir]}/squash.blueboxgrid.com.crt" do
  mode "755"
end

template "/etc/nginx/sites-available/squash.conf" do
  source "squash_nginx_conf.erb"
  variables  :server_name => node[:squash][:server_name],
  :port => node[:squash][:port],
  :ssl_certificate => "#{node[:squash][:ssl_key_dir]}/squash.blueboxgrid.com.crt",
  :ssl_certificate_key => "#{node[:squash][:ssl_key_dir]}/squash.blueboxgrid.com.key"
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/squash.conf" do
  to "/etc/nginx/sites-available/squash.conf"
end
