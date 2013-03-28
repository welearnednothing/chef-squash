include_recipe "ruby_build"
include_recipe "rbenv::system"

node.default['rbenv']['rubies'] = [ "jruby-1.9" ]

