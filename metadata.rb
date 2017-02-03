name 'macosx_autologin'
maintainer 'Dennis Hoer'
maintainer_email 'dennis.hoer@gmail.com'
license 'MIT'
description "Configures automatic login using a Gavin Brock's kcpassword"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '4.0.0'

supports 'mac_os_x', '>= 10.7'

source_url 'https://github.com/dhoer/chef-macosx_autologin' if respond_to?(:source_url)
issues_url 'https://github.com/dhoer/chef-macosx_autologin/issues' if respond_to?(:issues_url)
