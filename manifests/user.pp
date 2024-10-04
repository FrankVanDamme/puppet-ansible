# @api private
#
#
class ansible::user (
){
    # Create an 'ansible' user
    user { 'ansible':
        ensure     => present,
        comment    => 'ansible',
        managehome => true,
        shell      => '/bin/bash',
        home       => '/home/ansible',
    }

    if ( defined('$ansible::sudo_user') ){
        $sudo_user=$ansible::sudo_user
    } else {
        $sudo_user = "ALL"
    }

    # if Ansible configuration is set to use sudo, we need a sudo rule to allow access
    if ( ! defined('$ansible::become_method' ) or $ansible::become_method == 'sudo' ) {
        sudo::conf { 'ansible':
            priority => 20,
            content  => "ansible ALL=( ${sudo_user} ) NOPASSWD: ALL\n",
        }
    }

}
