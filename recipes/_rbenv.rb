node.default['rbenv']['rubies'] = [ "jruby-1.6.5", "1.9.3-p286" ]

node.default['rbenv']['gems'] = {
  "jruby-1.6.5" => [
    { "name" => "bundler" },
    { "name" => "trinidad" }
  ]
}

include_recipe "rbenv::system"
