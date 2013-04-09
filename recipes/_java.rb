directory "/var/log/trinidad/" do
  owner "deploy"
  group "deploy"
end

directory "/var/run/trinidad/" do
  owner "deploy"
  group "deploy"
end

include_recipe "java"
include_recipe "tomcat"
