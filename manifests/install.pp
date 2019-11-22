# @api private
# This class handles ansible packages. Avoid modifying private classes.

class ansible::install {

  case $facts['operatingsystem'] {

    'RedHat', 'CentOS', 'OracleLinux': {

      unless $ansible::use_dist_repo {
        contain ansible::repo::yum
      }

    }

    'Fedora': {

      unless $ansible::use_dist_repo {
        contain ansible::repo::yum
      }

    }

    'Debian', 'Ubuntu': {

      unless $ansible::use_dist_repo {
        contain ansible::repo::apt
      }

    }

    'Archlinux', 'Manjarolinux': {}

    default: { fail("Your operating system \"${facts['operatingsystem']}\"is not supported.") }

  }

  $ensure = $ansible::ensure ? {
    'absent' => 'absent',
    default  => $::ansible::version,
  }

  package { $ansible::package_name:
    ensure => $ensure,
  }
}
