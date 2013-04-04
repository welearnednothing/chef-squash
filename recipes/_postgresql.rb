node.override.postgresql.version = "9.2"
node.override.postgresql.dir = "/var/lib/pgsql/9.2/data"
node.override.postgresql.enable_pgdg_yum = true
node.override.postgresql.client.packages = [ "postgresql92" ]
node.override.postgresql.server.packages = [ "postgresql92-server", "postgresql92-devel" ]
node.override.postgresql.server.service_name = "postgresql-9.2"
node.override.postgresql.password = "esker1[BASIC"
node.override.postgresql.config_pgtune.db_type = "web"
node.override.postgresql.config_pgtune.total_memory = "2097152kB"

include_recipe "postgresql::server"

# postgres needs to build from source b/c of issue w/ omnibus
# http://lists.opscode.com/sympa/arc/chef/2012-10/msg00133.html
link "/usr/bin/pg_config" do
  to "/usr/pgsql-9.2/bin/pg_config"
end

include_recipe "postgresql::ruby"


postgresql_connection_info = {
  :host => "127.0.0.1",
  :port => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']
}

postgresql_database node['squash']['db']['name'] do
  connection postgresql_connection_info
  action :create
end



