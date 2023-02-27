# Adapted 2020 from https://github.com/gabe-sky/puppet-ansible v1.0.1. 
# Thanks Mr Schuyler!

# Declare this defined type on a target machine and it will be added to a
# group on your controllers.  In fact, the ansible::target class declares this
# defined type to add all targets to the "puppetized" group.
#
# Parameters:
# *groupname*: namevar - name of group to add node to
# *member*: name of node or element to add; defaults to fqdn.
# These are mostly for internal use.

define ansible::add_to_group (
    String $groupname = $name,
    String $member = $facts[networking][fqdn],
) {

    # we use fqdn in the name for the sole purpose of unicity (no duplicate exported resources)

    @@concat::fragment { "ans_inv_add_${member}_to_${groupname}_on_${facts[networking][fqdn]}":
        order   => 5,
        content => "${member}\n",
        target  => "ans_inv_group_${groupname}",
        tag     => "ansible_group",
    }

    # auto create the group

    @@ansible::group { "ans_inv_auto_create_${groupname}_on_${facts[networking][fqdn]}":
        groupname => $groupname,
        tag       => auto_group,
    }
}
