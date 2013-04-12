node.default['rbenv']['user_installs'] = [
  { 'user'    => 'deploy',
    'rubies'  => [ '1.9.3-p286', node[:squash][:jruby][:version] ],
    'global'  => '1.9.3-p286',
    'gems'    => {
                   '1.9.3-p286'    => [ { 'name'    => 'bundler' } ],
                   node[:squash][:jruby][:version] => [
                     { "name" => "bundler" },
                     { "name" => "trinidad" },
                     { "name" => "trinidad_init_services" }
                   ]
                 }
  },
  { 'user'    => 'root',
    'rubies'  => [ '1.9.3-p286', node[:squash][:jruby][:version] ],
    'global'  => '1.9.3-p286',
    'gems'    => {
                   '1.9.3-p286'    => [ { 'name'    => 'bundler' } ],
                   node[:squash][:jruby][:version] => [
                     { "name" => "bundler" },
                     { "name" => "trinidad" },
                     { "name" => "trinidad_init_services" }
                   ]
                 }
  }                                          
]

include_recipe "ruby_build"
include_recipe "rbenv::user"



