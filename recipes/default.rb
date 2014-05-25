# Encoding: utf-8
#
# Cookbook Name:: dockercon
# Recipe:: default
#
# Copyright 2014, Paul Czarkowski
#

include_recipe 'docker::default'

['ubuntu'].each do |img|
  docker_image img do
    action 'pull'
  end
end



git "#{Chef::Config[:file_cache_path]}/acme_application" do
  repository 'git@github.com:acme/application.git'
  notifies :build, 'docker_image[acme/application]', :immediately
end

docker_image 'acme/application' do
  action :pull
end