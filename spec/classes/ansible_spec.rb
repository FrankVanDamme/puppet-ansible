require 'spec_helper'

describe 'ansible' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts)  { facts }

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('ansible') }
      it {
        is_expected.to contain_class('ansible::install')
          .that_comes_before('Class[ansible::config]')
      }
      it { is_expected.to contain_class('ansible::config') }

      describe 'ansible::install' do
        it { is_expected.to contain_package('ansible') }

        case facts[:osfamily]
        when 'RedHat'
          it { is_expected.to contain_class('ansible::repo::yum') }
          it { is_expected.to contain_yumrepo('epel') }
        when 'Debian'
          it { is_expected.to contain_class('ansible::repo::apt') }
          it { is_expected.to contain_apt__source('ansible_repo') }
        end
      end

      describe 'ansible::config' do
        it { is_expected.to contain_file('/etc/ansible').with_ensure('directory') }
        it { is_expected.to contain_file('/etc/ansible').with_mode('0755') }

        it { is_expected.to contain_file('/etc/ansible/ansible.cfg').with_ensure('file') }
        it { is_expected.to contain_file('/etc/ansible/ansible.cfg').with_mode('0644') }

        it { is_expected.to contain_concat('/etc/ansible/hosts').with_ensure('present') }
        it { is_expected.to contain_concat('/etc/ansible/hosts').with_mode('0644') }
        it { is_expected.to contain_concat('/etc/ansible/hosts').with_warn(true) }
      end
    end
  end
end
