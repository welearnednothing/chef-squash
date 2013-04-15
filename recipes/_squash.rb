#
# Cookbook Name:: squash
# Recipe:: _squash
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

# database.yml
template "#{node[:squash][:shared_dir]}/config/database.yml" do
  owner "deploy"
  group "deploy"
  mode "00600"
  variables :db_host => node.squash.db.host,
  :db_user => node.squash.db.user,
  :db_password => node.postgresql.password.postgres,
  :db_name => node.squash.db.name
end

# secret_token
template "#{node[:squash][:shared_dir]}/secret_token.rb" do
  action :create_if_missing
  owner "deploy"
  group "deploy"
  mode "00600"
  variables :secret => SecureRandom.hex
end

# authentication.yml
template "#{node[:squash][:shared_dir]}/authentication.yml" do
  action :create_if_missing
  owner "deploy"
  group "deploy"
  mode "00600"
  variables :salt => SecureRandom.base64
end

deploy_revision node[:squash][:root_dir] do
  migrate true
  migration_command "bundle exec rake db:migrate --trace"
  environment "RAILS_ENV" => "production"
  repository node.squash.repo
  revision node.squash.revision
  user node[:squash][:user]
  group node[:squash][:group]
  create_dirs_before_symlink [ "log" ]
  symlinks ({ "secret_token.rb"     => "config/initializers/secret_token.rb",
              "authentication.yml"  => "config/environments/common/authentication.yml" })

  before_migrate do

    # vendor for jruby
    # (this will fail when bundler calls git if there is not enough memory available)
    # try 'service trinidad stop' if that happens
    execute "bundle_jruby" do
      command "jruby -S bundle config build.pg --with-pg-config=/usr/pgsql-9.2/bin/pg_config &&  jruby -S bundle install --deployment"
      user node[:squash][:user]
      cwd release_path
      environment ({ 'RBENV_VERSION' => node.squash.jruby.version })
    end

    # vendor for ruby - needed to be able to migrate
    execute "bundle_ruby" do
      command "bundle config build.pg --with-pg-config=/usr/pgsql-9.2/bin/pg_config &&  bundle install --deployment"
      user node[:squash][:user]
      cwd release_path
      environment ({ 'HOME' => '/home/deploy' })
    end
  end

  before_restart do
    execute "precompile_assets" do
      command "bundle exec rake assets:precompile"
      user node[:squash][:user]
      cwd release_path
      environment ({ 'RAILS_ENV' => 'production' })
    end
  end

end
