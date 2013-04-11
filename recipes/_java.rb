# java

include_recipe "java"
include_recipe "tomcat"

directory "/var/log/trinidad/" do
  owner "deploy"
  group "deploy"
end

directory "/var/run/trinidad/" do
  owner "deploy"
  group "deploy"
end




