# trinidad_init_services

# the trinidad_init_services gem creates a trinidad init script for you:
# https://github.com/trinidad/trinidad_init_services

# This recipe used that gem to create an initial /etc/init.d/trinidad
# that was then templatized
# It doesn't run the  trinidad_init_service command on it's own.

# it also uses the embedded source to build the jsvc binary

node.default.trinidad.log_dir = "/var/log/trinidad/"
node.default.trinidad.pid_dir = "/var/run/trinidad/"

directory node.trinidad.log_dir do
  owner node.squash.user
  group node.squash.group
end

directory node.trinidad.pid_dir do
  owner node.squash.user
  group node.squash.group
end

# jsvc gets used by the init script
execute "compile_jsvc" do
   command "RBENV_VERSION=#{node.squash.jruby.version} jruby -e \"require 'trinidad_init_services'; _c = Trinidad::InitServices::Configuration.new; _c.send(:compile_jsvc, '/usr/local/src')\""
  environment ({ 'HOME' => '/root' })
  creates "/usr/bin/jsvc"
end

template "/etc/init.d/trinidad" do
  source "trinidad_init"
  mode "0755"
  variables :run_user => node.squash.user,
            :app_path => node.squash.current_dir,
            :pid_file => "#{node.default.trinidad.pid_dir}/trinidad.pid",
            :log_file => "#{node.default.trinidad.log_dir}/trinidad.log",
            :jruby => node.squash.jruby.version
end

service "trinidad" do
  action [ :enable, :start ]
end
