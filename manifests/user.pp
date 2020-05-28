# @api private


class ansible::user (
){
    # Create an 'ansible' user
    user { 'ansible':
        ensure     => present,
        comment    => 'ansible',
        managehome => true,
        shell      => '/bin/bash',
        home       => '/home/ansible',
        password   => $ansible::user::password
    }
    
    $sudo_user = $ansible::sudo_user ? {
        undef   => "ALL",
        default => "${ansible::sudo_user}",
    }
    
    # if Ansible configuration is set to use sudo, we need a sudo rule to allow access
    if ( $ansible::become_method == 'sudo' or $ansible::become_method == undef ) {
        sudo::conf { 'ansible':
            priority => 20,
            content  => "ansible ALL=( $sudo_user ) NOPASSWD: ALL\n",
        }
    }

}
