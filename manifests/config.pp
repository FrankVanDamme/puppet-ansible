# @api private
# This class handles the configuration file. Avoid modifying private classes.

class ansible::config {

  File {
    owner  => $ansible::user,
    group  => $ansible::group,
  }

  file { $ansible::confdir:
    ensure => 'directory',
    mode   => '0755',
  }

  $ansible_dirs = [ "${ansible::confdir}/inventories", "${ansible::confdir}/roles", 
  "${ansible::confdir}/playbooks", "${ansible::confdir}/cicd"
  ]

  file { $ansible_dirs:
    ensure => 'directory',
    mode   => '0755',
  }

  file { "${ansible::confdir}/ansible.cfg":
    ensure  => 'file',
    mode    => '0644',
    content => epp('ansible/ansible.cfg.epp'),
  }

  concat { "${ansible::confdir}/hosts":
    ensure => present,
    mode   => '0644',
    owner  => $ansible::user,
    group  => $ansible::group,
    warn   => true,
  }

}
