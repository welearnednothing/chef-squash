# normally repo would be set to square's repo but I'm having this rake gem issue
# https://github.com/SquareSquash/web/issues/71

# node.default.squash.repo = "git://github.com/SquareSquash/web.git"
node.default.squash.repo = "git://github.com/blueboxgroup/web.git"

node.default.squash.revision = "master"
node.default.squash.user = "deploy"
node.default.squash.group = "deploy"
node.default.squash.db.name = "squash"
node.default.squash.db.host = "localhost"
node.default.squash.db.user = "postgres"
node.default.squash.jruby.version = "jruby-1.7.3"
node.default.squash.ruby.version = "1.9.3-p392"
node.default.squash.server_name = "squash.example.com"
node.default.squash.ssl_key_dir = "/etc/nginx/ssl"
node.default.squash.port = "3000"
node.default.squash.root_dir = "/srv/squash"
node.default.squash.current_dir = "/srv/squash/current"
node.default.squash.shared_dir = "/srv/squash/shared"



