node.default['rbenv']['rubies'] = [ node[:squash][:ruby][:version],
                                    node[:squash][:jruby][:version] ]

node.default['rbenv']['gems'] = {
                   node[:squash][:jruby][:version] => [
                     { "name" => "bundler" },
                     { "name" => "trinidad" },
                     { "name" => "trinidad_init_services" }
                   ]  
}

node.default['rbenv']['user_installs'] = [
  { 'user'    => 'deploy',
    'rubies'  => [ node[:squash][:ruby][:version], node[:squash][:jruby][:version] ],
    'global'  => node[:squash][:ruby][:version],
    'gems'    => {
                   node[:squash][:ruby][:version]    => [ { 'name'    => 'bundler' } ],
                   node[:squash][:jruby][:version] => [
                     { "name" => "bundler" },
                     { "name" => "trinidad" },
                     { "name" => "trinidad_init_services" }
                   ]
                 }
  }               
]

include_recipe "ruby_build"
include_recipe "rbenv::system"
include_recipe "rbenv::user"



