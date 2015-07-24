require 'beaker-rspec/spec_helper'
require 'beaker-rspec/helpers/serverspec'

hosts.each do |host|
  install_puppet
end

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    hosts.each do |host|
      #copy_module_to(host, :source => proj_root, :module_name => 'test')
      puppet_module_install(:source => proj_root, :module_name => 'test')
    end
  end
end
