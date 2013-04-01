metadata

cookbook 'bluebox',           :git => 'git@github.blueboxgrid.com:chef/bluebox.git'
cookbook 'yum'
cookbook 'apt'
cookbook 'git'

cookbook 'tomcat',            :git => 'git://github.com/bbg-cookbooks/tomcat.git', :ref => 'bluebox'

cookbook 'ruby_build',        :git => 'git://github.com/fnichol/chef-ruby_build.git'
cookbook 'rbenv',             :git => 'git://github.com/fnichol/chef-rbenv.git'

cookbook 'nginx',             :git => 'git://github.com/bbg-cookbooks/nginx.git', :ref => 'bluebox'

cookbook 'postgresql', :git => 'git://github.com/opscode-cookbooks/postgresql.git'

group "bluebox_internal" do
  cookbook 'bbg_repositories', :git => 'git@github.blueboxgrid.com:chef/bbg_repositories.git'
end
