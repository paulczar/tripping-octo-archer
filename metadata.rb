# Encoding: utf-8
name             'dockercon'
maintainer       'Paul Czarkowski'
maintainer_email 'paul.czarkowski@rackspace.com'
license          'Apache2'
description      'dockercon example cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w(ubuntu).each do |os|
  supports os
end

%w(docker).each do |ckbk|
  depends ckbk
end
