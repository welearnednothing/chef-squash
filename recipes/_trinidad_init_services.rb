# trinidad_init_services

init_config = "#{node[:squash][:shared_dir]}/tmp/trinidad_init_defaults.yml"

directory "#{node[:squash][:shared_dir]}/tmp" do
  recursive true
end

directory "/var/log/trinidad/" do
  owner "deploy"
  group "deploy"
end

directory "/var/run/trinidad/" do
  owner "deploy"
  group "deploy"
end

template init_config do
  variables :app_path => node[:squash][:current_dir]
end

# build config file for trinidad_init_service
execute "build_trinidad_init_service" do
  command "RBENV_VERSION=#{node[:squash][:jruby][:version]} jruby -S trinidad_init_service --no-ask --defaults #{init_config} > /dev/null 2>&1"
end

# jsvc gets used to build the init script
execute "compile_jsvc" do
  command "RBENV_VERSION=jruby-1.7.3 jruby -e \"require 'trinidad_init_services'; _c = Trinidad::InitServices::Configuration.new; _c.send(:compile_jsvc, '/usr/local/src')\""
end

# the init script buiilder always fails when we try to set run_user to something
# so set it to nothing and set the value in the init file
execute "add_deploy_user_to_init" do
  command "sed -i'' s/RUN_USER=\\\"\\\"/RUN_USER=\\\"deploy\\\"/ /etc/init.d/trinidad"
end

service "trinidad" do
  action [ :enable, :start ]
end
