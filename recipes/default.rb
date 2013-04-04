#
# Cookbook Name:: squash
# Recipe:: default
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

directory "/var/cache/kitchen-solo"

include_recipe "squash::_user"
include_recipe "squash::_git"
include_recipe "tomcat"
include_recipe "squash::_rbenv"
include_recipe "squash::_postgresql"

current_dir = node.squash.root + "/current"
shared_dir = node.squash.root + "/shared"

directory "#{shared_dir}/config"

template "#{shared_dir}/config/database.yml" do
  owner "deploy"
  group "deploy"
  mode "00600"
  variables :db_host => node.squash.db.host,
  :db_user => node.squash.db.user,
  :db_password => node.postgresql.password.postgres,
  :db_name => node.squash.db.name
end

deploy_revision node.squash.root do
  migrate true
  repository node.squash.repo
  revision node.squash.commit 
  user node.squash.user
  group node.squash.group
  before_restart do
    execute "bundle" do
      command "bundle config build.pg --with-pg-config=/usr/pgsql-9.2/bin/pg_config && bundle install"
      user node.squash.user
      cwd current_dir
_if do
        File.exists? File.join(current_dir, "Gemfile")
      end
   end
  end
end


