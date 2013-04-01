node.default['rbenv']['rubies'] = [ "1.9.3-p286" ]

node.default['rbenv']['gems'] = {
  "1.9.3-p286" => [
    { "name" => "bundler" },
  ]
}

include_recipe "rbenv::system"
