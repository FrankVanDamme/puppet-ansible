# Adapted 2020 from https://github.com/gabe-sky/puppet-ansible v1.0.1. 
# Thanks Mr Schuyler!

# Apply this class to the target nodes in your infrastructure.   It's quite
# simple -- mostly just making sure that the key that the controller is using
# for ssh is an allowed key for logging in as root.
#
# As a convenience, it also adds each node to a group on the controllers called
# "puppetized" so you can issue plays to all the nodes with Puppet on them.
#
# Finally, if needed it will add in libselinux for Python.  Some systems don't
# install this as part of their base.

class ansible::target {

  # Add this target to the "puppetized" inventory group on controllers.
  ansible::add_to_group { 'puppetized': }

  # Make sure python is installed, or it's going to be a really short trip.
  ensure_packages('python')

  # If I'm using SELinux on Redhat, make sure the python binding is here.
  if ( ( $::selinux ) and ( $::os['family'] == 'RedHat' ) ) {
    ensure_packages('libselinux-python', { 'ensure' => 'present' })
  }
}
