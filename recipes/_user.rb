#
# Cookbook Name:: squash
# Recipe:: _user
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

node.default.users = ['deploy', 'blueboxadmin']
node.default.authoration.sudo.users = ['deploy','blueboxadmin' ]
node.default.authoration.sudo.passwordless = true
node.default.groups = ["blueboxadmin", "deploy"]

include_recipe "group::data_bag"
include_recipe "user::data_bag"
include_recipe "sudo"

  
