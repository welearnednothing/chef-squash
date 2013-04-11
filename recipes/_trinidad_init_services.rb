# trinidad_init_services

init_config = "#{node[:squash][:shared_dir]}/tmp/trinidad_init_defaults.yml"

directory "#{node[:squash][:shared_dir]}/tmp" do
  recursive true
end

template init_config do
  variables :app_path => node[:squash][:root_dir]
end

execute "build_trinidad_init_service" do
  command "RBENV_VERSION=#{node[:squash][:jruby][:version]} jruby -S trinidad_init_service --no-ask --defaults #{init_config}"
end

service "trinidad" do
  action [ :enable, :start ]
end
