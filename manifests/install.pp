## Class to install core packages and ansible
class ansible::install {

  if $facts['operatingsystem'] =~ /^(RedHat|CentOS)$/ {

    package { 'epel-release':
      ensure => latest,
    }

    Package['epel-release']
    -> Package[$ansible::package_name]

  }

  elsif $facts['operatingsystem'] =~ /^(Debian|Ubuntu)$/ {

    include ::apt

    package { 'dirmngr':
      ensure => present,
    }

    -> apt::source { 'ansible_repo':
      comment  => 'This is the latest ansible debian/ubuntu mirror',
      location => 'http://ppa.launchpad.net/ansible/ansible/ubuntu',
      release  => 'trusty',
      repos    => 'main',
      key      => {
        'id'     => '93C4A3FD7BB9C367',
        'server' => 'hkp://keyserver.ubuntu.com:80',
      },
      include  => { 'deb' => true },
      notify   => Exec['apt_update']
    }

    Apt::Source['ansible_repo'] 
    -> Package[$ansible::package_name]
  }

  package { $ansible::package_name:
    ensure => $ansible::version,
  }

}
