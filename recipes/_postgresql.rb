node.override.postgresql.version = "9.2"
node.override.postgresql.dir = "/var/lib/pgsql/9.2/data"
node.override.postgresql.enable_pgdg_yum = true
node.override.postgresql.client.packages = [ "postgresql92" ]
node.override.postgresql.server.packages = [ "postgresql92-server", "postgresql92-devel" ]
node.override.postgresql.server.service_name = "postgresql-9.2"
node.override.postgresql.password.postgres = "esker1[BASIC"
node.override.postgresql.config_pgtune.db_type = "web"
node.override.postgresql.config_pgtune.total_memory = "2097152kB"

include_recipe "postgresql::server"

