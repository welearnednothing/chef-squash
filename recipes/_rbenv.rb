# node.default['rbenv']['rubies'] = [ "1.9.3-p286", node[:squash][:jruby][:version] ]
# node.default['rbenv']['global'] = "1.9.3-p286"

node.default['rvm']['user_rubies'] = [ "1.9.3-p286", node[:squash][:jruby][:version] ]

node['rvm']['user_installs'] = [
                                { 'user'          => 'deploy',
                                  'default_ruby'  => '1.9.3-p286',
                                  'rubies'        => ['1.9.3-p286', node[:squash][:jruby][:version]]
                                }
                               ]

node.default['rbenv']['user_gems'] = {
  "1.9.3-p286" => [
    { "name" => "bundler" }
  ], 
   node[:squash][:jruby][:version] => [
    { "name" => "bundler" },
    { "name" => "trinidad" },
    { "name" => "trinidad_init_services" }
  ]
}

include_recipe "ruby_build"
include_recipe "rbenv::user_install"



