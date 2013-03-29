#
# Cookbook Name:: squash
# Recipe:: default
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

include_recipe "user"
include_recipe "squash::_git"
include_recipe "java"
include_recipe "ruby_build"
include_recipe "squash::_rbenv"
include_recipe "squash::_postgresql"

current_dir = node.default.squash.root + "/current"

# deploy_revision node.default.squash.root do
#   migrate false
#   repository node.default.squash.repo
#   revision node.default.squash.commit 
#   user node.default.squash.user
#   group node.default.squash.group
#   before_restart do
#     execute "bundle" do
#       command "jruby -S bundle install"
#       user node.default.squash.user
#       cwd current_dir
#       only_if do
#         File.exists? File.join(current_dir, "Gemfile")
#       end
#    end
#   end
#   notifies :restart, "service[squash_unicorn]"  
# end


