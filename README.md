# <a name="title"></a> chef-squash

## <a name="description"></a> Description

Install the [Squash][squash_repo] exception handling tool.  

"Squash is a collection of tools that help engineers find and kill bugs in their code by 
automatically collecting, collating and analyzing run time exceptions."   

Squash is a jruby rails app, so this cookbook is an application style cookbook that provisions squash's dependencies and then squash itself.  
To handle the jruby aspect it uses tomcat and trinidad.  

## <a name="requirements"></a> Requirements


### <a name="requirements-chef"></a> Chef

Chef 10.x (the tomcat cookbook does not work with Chef 11 yet)  

### <a name="requirements-platform"></a> Platform

It currently only works on RHEL platforms (CentOS, Scientific, Amazon, etc.)  

### <a name="requirements-cookbooks"></a> Cookbooks

 - user
 - group
 - sudo
 - yum
 - apt
 - git
 - java
 - tomcat
 - ruby_build
 - rbenv
 - nginx
 - database
 - aws
 - xfs
 - mysql
 - postgresql

## <a name="recipes"></a> Recipes

The default recipe will provision squash.  So just bring the cookbook into your environment and add `recipe[squash]` to your run_list.

Attributes
----------

### <a name="attributes-repo"></a> repo

The Git URL which is used to install squash.

The default is `"git://github.com/blueboxgroup/web.git"`.

### <a name="attributes-revision"></a> revision

The commit or branch which is used to install squash.

The default is `"master`.

### <a name="jruby-version"></a> jruby.version

The version of jruby you would like squash to run under.

The default is `jruby-1.7.3`.

### <a name="jruby-version"></a> ruby.version

The version of ruby you would like squash to run under.

The default is `1.9.3-p392`.


There are also per service attributes within each of the recipes.  For example, the _postgresql recipe sets up the postgres version and defines which packages need to be run.


## <a name="license"></a> License and Author

Copyright 2013, Blue Box Group, LLC  
Copyright 2013, Sam Cooper  

Licensed under the Apache License, Version 2.0 (the "License"); 
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0  

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions ande
limitations under the License.

[squash_repo]:        https://github.com/SquareSquash/web
