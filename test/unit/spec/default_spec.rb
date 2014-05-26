# Encoding: utf-8

require_relative 'spec_helper'

describe 'dockercon::default' do
  describe 'ubuntu' do
    let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

    it 'installs docker' do
      expect(chef_run).to include_recipe('docker::default')
    end

    it 'pulls the busybox image' do
      expect(chef_run).to pull_docker_image('busybox')
    end

  end
end
