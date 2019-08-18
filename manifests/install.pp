# @api private
# This class handles ansible packages. Avoid modifying private classes.

class ansible::install {

  case $facts['operatingsystem'] {

    'RedHat', 'CentOS', 'OracleLinux', 'Fedora': {

      contain ansible::repo::yum

    }

    'Debian', 'Ubuntu': {

      contain ansible::repo::apt

    }

    'Archlinux': { }

    default: { fail('Your operating system is not supported.') }

  }

  $ensure = $ansible::ensure ? {
    'absent' => 'absent',
    default  => $::ansible::version,
  }

  package { $ansible::package_name:
    ensure => $ensure,
  }
}
