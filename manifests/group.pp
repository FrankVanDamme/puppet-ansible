
# ansible::group is either created or realized on the node where the inventory
# files are generated.

# *child_of*
# The current group will be added as a member of a group <parent>:children,
# where "parent" is one element in $child_of.
# As such it is possible to create a hierarchy of groups as documented in
# https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#hosts-in-multiple-groups
#
# if a group does not exist, it will be auto-created; the same goes for the
# groups that group groups ( "foo:children" type).

define ansible::group (
    Array $child_of = [],
    String $groupname = $title,
){
    # per group, only one header and concat target is needed, and in case the
    # group is a child of another, we need to create all the auto-parents only
    # once
    if ( ! defined(Concat["ans_inv_group_$groupname"])){

        # The concat target;
        # One file per group is the easiest to manage.
        # Members are exported resources (ansible::add_to_group) and realized
        # in main manifest.

        concat { "ans_inv_group_$groupname":
            path    => "${ansible::confdir}/groups/$groupname",
            # possibly sensitive data; this resource can also be used to define variables
            show_diff => false,
        }

        # the group section heading

        concat::fragment { "ans_inv_group_$groupname":
            order   => 01,
            content => "[$groupname]\n",
            target  => "ans_inv_group_$groupname",
        }

        # is this group the child of another? add it and auto create the parent

        $child_of.each | $index, String $parent |{

            # group with name foo:children
            # this should run only once

            if ( ! defined ( Ansible::Add_to_group["${groupname}_to_$parent:children"])){
                @@ansible::group { "$parent:children_created_by_${groupname}":
                    groupname => "$parent:children",
                    tag       => auto_group,
                }

                # add the groupname of this group to the group that serves to collect child groups

                ansible::add_to_group { "${groupname}_to_$parent:children":
                    groupname => "$parent:children",
                    member    => $groupname,
                }
            }
        }
    }
}
