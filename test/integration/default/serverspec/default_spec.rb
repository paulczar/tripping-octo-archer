# Encoding: utf-8

require_relative 'spec_helper'

describe service('docker') do
  it { should be_enabled }
  it { should be_running }
end
