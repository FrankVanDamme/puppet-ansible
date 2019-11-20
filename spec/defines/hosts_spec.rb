require 'spec_helper'

describe 'ansible::hosts' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:title) { 'webservers' }
      let(:facts)  { facts }
      let(:params) { { 'entrys' => ['192.168.0.1', '192.168.0.2'] } }
      let(:pre_condition) { 'include ::ansible' }

      it { is_expected.to contain_concat__fragment('webservers') }

      it { should compile }
    end
  end
end
