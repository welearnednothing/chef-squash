#
# Cookbook Name:: squash
# Recipe:: _postgresql
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


node.override.postgresql.version = "9.2"
node.override.postgresql.dir = "/var/lib/pgsql/9.2/data"
node.override.postgresql.enable_pgdg_yum = true
node.override.postgresql.client.packages = [ "postgresql92" ]
node.override.postgresql.server.packages = [ "postgresql92-server", "postgresql92-devel" ]
node.override.postgresql.server.service_name = "postgresql-9.2"
node.override.postgresql.password.postgres = "esker1[BASIC"
node.override.postgresql.config_pgtune.db_type = "web"
node.override.postgresql.config_pgtune.total_memory = "2097152kB"

execute "add_postgres_repo" do
  command "rpm -Uhv http://yum.postgresql.org/9.2/redhat/rhel-6-x86_64/pgdg-sl92-9.2-8.noarch.rpm"
  not_if "ls /etc/yum.repos.d | grep pgdg-92-sl"
end

include_recipe "postgresql::server"

# postgres needs to build from source b/c of issue w/ omnibus
# http://lists.opscode.com/sympa/arc/chef/2012-10/msg00133.html

# this link is probably necessary only on rhel (not sure though)
link "/usr/bin/pg_config" do
  to "/usr/pgsql-9.2/bin/pg_config"
end

# this is the work around for pg gem not installing into omnibus
# but it's evaling before my postgres packages have been pulled down
# so had to wrap in this guard
# now you fail later in the run when the below postgres lwrp's get ran
# at that point just reconverge and then the pg gem will install and converge should finish
if `rpm -qa`.include?('postgresql92')
  include_recipe "postgresql::ruby"
end

postgresql_connection_info = {
  :host => "127.0.0.1",
  :port => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database node['squash']['db']['name'] do
  connection postgresql_connection_info
  action :create
end



