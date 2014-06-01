# Encoding: utf-8

require_relative 'spec_helper'

describe 'dockercon::registry' do
  describe 'ubuntu' do
    let(:runner) { ChefSpec::Runner.new(::UBUNTU_OPTS) }
    let(:node) { runner.node }
    let(:chef_run) do
      runner.node.set['dockercon']['images'] = ['loltest']
      runner.node.set['dockercon']['registry'] = '66.66.66.66:5000'
      runner.converge(described_recipe)
    end

    it 'pulls and runs registry image' do
      expect(chef_run).to pull_docker_image('registry')
      expect(chef_run).to run_docker_container('registry').with(
        detach:  true,
        port:    '5000:5000',
        env:     ['SETTINGS_FLAVOR=local']
      )
    end

    it 'pulls tags and pushes loltest container' do
      expect(chef_run).to pull_docker_image('loltest')
      expect(chef_run).to tag_docker_image('loltest').with(
        repository: '66.66.66.66:5000/loltest'
      )
      expect(chef_run).to push_docker_image('loltest').with(
        registry: '66.66.66.66:5000'
      )
    end

  end
end
