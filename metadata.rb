name             'squash'
maintainer       'Blue Box Group, LLC'
maintainer_email 'support@bluebox.net'
license          'Apache 2.0'
description      'Installs/Configures squash'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "yum"
depends "user"
depends "git"
depends "java"
depends "tomcat"
depends "ruby_build"
depends "rbenv"
depends "postgresql"
