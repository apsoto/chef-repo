maintainer       "Alex Soto"
maintainer_email "apsoto@gmail.com"
license          "Apache 2.0"
description      "Extra recipes for managing nodes on ec2"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.1"

recipe "utilities", "Installs helpful command line utilities"
recipe "swap", "Adds swap to instances that don't already have swap"

attribute "ec2opts/swapfile", 
  :display_name => "swapfile",
  :description => "Fully qualified path to swapfile",
  :multiple_values => false,
  :type => "string",
  :required => true,
  :recipes => [ 'ec2_extra::swap' ],
  :default => "/mnt/swapfile"

