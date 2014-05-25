# Encoding: utf-8
name             'dockercon'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'none'
license          ''
description      'Installs/Configures dockercon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(ubuntu).each do |os|
  supports os
end

%w(docker).each do |ckbk|
  depends ckbk
end
