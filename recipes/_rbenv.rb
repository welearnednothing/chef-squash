node.default['rbenv']['rubies'] = [ "1.9.3-p286", "jruby-1.6.5" ]
node.default['rbenv']['global'] = "1.9.3-p286"

node.default['rbenv']['gems'] = {
  "1.9.3-p286" => [
    { "name" => "bundler" },
    { "name" => "trinidad" }
  ],  
  "jruby-1.6.5" => [
    { "name" => "bundler" },
    { "name" => "trinidad" }
  ]
}

include_recipe "ruby_build"
include_recipe "rbenv::system"


