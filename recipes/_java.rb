# java

include_recipe "java"
include_recipe "tomcat"

directory "/var/log/trinidad/" do
  owner "deploy"
  group "deploy"
end

directory "/var/run/trinidad/" do
  owner "deploy"
  group "deploy"
end

# trinidad_init_services config

init_config = "#{node[:squash][:shared_dir]}/tmp/trinidad_init_defaults.yml"

directory "#{node[:squash][:shared_dir]}/tmp"

template init_config do
  variables :app_path => node[:squash][:root_dir]
end

execute "build_trinidad_init_service" do
  command "RBENV_VERSION=#{node[:squash][:jruby][:version]} jruby -S trinidad_init_service --defaults #{init_config}"
end

service "trinidad" do
  action [ :enable, :start ]
end



