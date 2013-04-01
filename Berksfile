metadata

cookbook 'bluebox',           :git => 'git@github.blueboxgrid.com:chef/bluebox.git'
cookbook 'yum'
cookbook 'apt'
cookbook 'git'

# java shtuff
cookbook 'java',              :git => 'git://github.com/opscode-cookbooks/java.git'
# cookbook 'jboss',             :git => 'git://github.com/bryanwb/chef-jboss.git'
cookbook 'jboss',             :git => 'git://github.com/sandfish8/chef-jboss.git', :ref => 'bluebox'
cookbook 'maven',             :git => 'git://github.com/bbg-cookbooks/maven.git'

cookbook 'ruby_build',        :git => 'git://github.com/fnichol/chef-ruby_build.git'
cookbook 'rbenv',             :git => 'git://github.com/fnichol/chef-rbenv.git'

cookbook 'nginx',             :git => 'git://github.com/bbg-cookbooks/nginx.git', :ref => 'bluebox'
cookbook 'unicorn'
cookbook 'postgresql', :git => 'git://github.com/opscode-cookbooks/postgresql.git'

group "bluebox_internal" do
  cookbook 'bbg_repositories', :git => 'git@github.blueboxgrid.com:chef/bbg_repositories.git'
end
