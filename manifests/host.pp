define ansible::host (
    String $hostname = $title,
){
    # code is analogue to ansible::group

    # per host, we need 1 file with 1 line where the host name is leading

    if ( ! defined(Concat["ans_inv_host_$hostname"])){
        concat { "ans_inv_host_$hostname":
            path      => "${ansible::confdir}/inventories/hosts.d/$hostname",
            show_diff => false,
        }

        # the host name 

        concat::fragment { "ans_inv_host_$hostname":
            order   => 01,
            content => "$hostname",
            target  => "ans_inv_host_$hostname",
        }
    }
}
