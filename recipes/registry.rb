# Encoding: utf-8
#
# Cookbook Name:: dockercon
# Recipe:: registry
#
# Copyright 2014, Paul Czarkowski
#

docker_image 'registry' do
  action [:pull]
end

docker_container 'registry' do
  detach  true
  port    '5000:5000'
  env     ['SETTINGS_FLAVOR=local']
  action [:run]
end

node['dockercon']['images'].each do |image|
  docker_image image do
    action [:pull]
  end
  docker_image image do
    repository "#{node['dockercon']['registry']}/#{image}"
    registry   node['dockercon']['registry']
    action [:tag, :push]
  end
end
