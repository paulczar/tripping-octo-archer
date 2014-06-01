# Encoding: utf-8

require_relative 'spec_helper'

describe command('docker images registry') do
  it { should return_stdout(/^registry/) }
end

describe command('docker ps registry') do
  it { should return_stdout(/registry/) }
end

describe command('docker images busybox') do
  it { should return_stdout(/^busybox/) }
end

describe command('docker images 127.0.0.1:5000/busybox') do
  it { should return_stdout(/^127\.0\.0\.1:5000\/busybox/) }
end
