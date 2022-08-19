define ansible::variable (
    String $variable = $name,
    String $value,
    String $context = '',
){

    $varlist = $context ? {
        ''      => "${::fqdn}:vars",
        default => "$varlist:vars",
    }

    @@concat::fragment { "ans_inv_add_${variable}_to_${varlist}_on_${::fqdn}":
        order     => 5,
        content   => "$variable = $value\n",
        target    => "ans_inv_group_$varlist",
        tag       => "ansible_group",
    }

    # auto create the group

    @@ansible::group { "ans_inv_auto_create_${variable}_in_${varlist}_on_${::fqdn}":
        groupname => "${varlist}",
        tag       => auto_group,
    }
}
