require 'beaker-rspec'
require 'beaker-puppet'
require 'beaker-pe'
#require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

UNSUPPORTED_PLATFORMS = ['windows', 'Darwin']

#run_puppet_install_helper
install_puppet_on(hosts)
install_ca_certs unless ENV['PUPPET_INSTALL_TYPE'] =~ %r{/pe/i}
install_module_on(hosts)
install_module_dependencies_on(hosts)

RSpec.configure do |c|
  c.before :suite do
    hosts.each do |host|
      copy_module_to(host, source: PROJECT_ROOT, module_name: 'ansible')
    end
  end
end
