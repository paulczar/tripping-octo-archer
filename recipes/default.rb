# Encoding: utf-8
#
# Cookbook Name:: dockercon
# Recipe:: default
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'docker::default'

docker_image 'busybox' do
  action 'pull'
end
