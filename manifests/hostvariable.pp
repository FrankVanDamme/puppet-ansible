define ansible::hostvariable (
    String $variable = $name,
    String $value,
    String $context = '',
){

    $context_ = $context ? {
        ''      => "${::fqdn}",
        default => "$context",
    }
    # $varlist = "$context_:vars"

    # fragment for variable

    @@concat::fragment { "ans_inv_add_${variable}_to_${context}_on_${::fqdn}":
        order     => 5,
        content   => " $variable=$value",
        target    => "ans_inv_host_$context_",
        tag       => "ansible_host",
    }

    # auto create the host

    @@ansible::host { "ans_inv_auto_create_${variable}_in_${context_}_on_${::fqdn}":
        hostname => "${context_}",
        tag      => auto_host,
    }
}
