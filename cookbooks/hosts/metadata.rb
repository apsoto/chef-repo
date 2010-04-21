maintainer       "Alex Soto"
maintainer_email "apsoto@gmail.com"
license          "Apache 2.0"
description      "Manage /etc/hosts with databags instead of node attributes so the attribute namespace doesn't get cluttered."
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "default", "Manage /etc/hosts.  Uses databags instead of node attributes."

# needs more documentation
#attribute 'hosts/localhost_aliases'
