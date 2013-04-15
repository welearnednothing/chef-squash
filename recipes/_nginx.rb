#
# Cookbook Name:: squash
# Recipe:: _nginx
# Author:: Sam Cooper <scooper@bluebox.net>
#
# Copyright 2013, Blue Box Group, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


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
cookbook_file "#{node[:squash][:ssl_key_dir]}/squash.key" do
  mode "600"
end

cookbook_file "#{node[:squash][:ssl_key_dir]}/squash.crt" do
  mode "755"
end

template "/etc/nginx/sites-available/squash.conf" do
  source "squash_nginx_conf.erb"
  variables  :server_name => node[:squash][:server_name],
  :port => node[:squash][:port],
  :ssl_certificate => "#{node[:squash][:ssl_key_dir]}/squash.crt",
  :ssl_certificate_key => "#{node[:squash][:ssl_key_dir]}/squash.key"
  notifies :restart, "service[nginx]"
end

link "/etc/nginx/sites-enabled/squash.conf" do
  to "/etc/nginx/sites-available/squash.conf"
end
