node.default.squash.root_dir = "/srv/squash"
node.default.squash.current_dir = "/srv/squash/current"
node.default.squash.shared_dir = "/srv/squash/shared"
node.default.squash.repo = "git://github.com/SquareSquash/web.git"
node.default.squash.commit = "5f7a17a15e84cfe22c0f923107deed6181387daf" # circa April 2013
node.default.squash.user = "deploy"
node.default.squash.group = "deploy"
node.default.squash.db.name = "squash"
node.default.squash.db.host = "localhost"
node.default.squash.db.user = "postgres"
node.default.squash.jruby.version = "jruby-1.7.3"

node.default[:squash][:server_name] = "squash.blueboxgrid.com"
node.default[:squash][:ssl_key_dir] = "/etc/nginx/ssl"
node.default[:squash][:port] = "3000"



