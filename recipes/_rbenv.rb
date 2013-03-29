node.default['rbenv']['rubies'] = [ "jruby-1.6.5" ]

node.default['rbenv']['gems'] = {
  "jruby-1.6.5" => [
    { "name" => "bundler" }
  ]
}

include_recipe "rbenv::system"
