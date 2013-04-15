#
# Cookbook Name:: squash
# Recipe:: _rbenv
# Author:: Sam Cooper <scooper@bluebox.net>
#
# Copyright 2013, Blue Box Group, LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


node.default['rbenv']['rubies'] = [ node[:squash][:ruby][:version],
                                    node[:squash][:jruby][:version] ]

node.default['rbenv']['gems'] = {
                   node[:squash][:ruby][:version] => [ { "name" => "bundler" } ],
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



