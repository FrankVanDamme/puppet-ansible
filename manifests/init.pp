#  Class: ansible
#  ===========================
#
#  This module install and configure Ansible.
#
#  Parameters
#  -----------
#  @param [Integer] gather_timeout - Some hardware related facts are collected
#with a maximum timeout of 10 seconds. This option lets you
#  increase or decrease that timeout to something more suitable for the
#environment.
#  @param [Integer] accelerate_timeout - This setting controls the timeout for #receiving data from a client. If no data is received during
#    this time, the socket connection will be closed. A keepalive packet is
#sent back to the controller every 15 seconds, so this timeout
#    should not be set lower than 15 (by default, the timeout is 30 seconds)
#  @param [Integer] accelerate_port - This is the port to use for accelerated
#mode.
#  @param [Integer] command_timeout - The command timeout value defines the
#amount of time to wait for a command or RPC call before timing out. The value
#for the command timeout must be less than the value of the persistent
#connection idle timeout (connect_timeout).
#  @param [Integer] connect_retry_timeout - Configures the persistent #
#connection retry timeout. This value configures the retry timeout that
#ansible-connection will wait to connect to the local domain socket. This value
#must be larger than the ssh timeout (timeout) and less than persistent #
#connection idle timeout (connect_timeout). The default value is 15 seconds.
#  @param [Integer] connect_timeout - Configures the persistent connection
#timeout value in seconds.  This value is how long the persistent connection
#will remain idle before it is destroyed. If the connection doesn't receive a
#request before the timeout value expires, the connection is shutdown. The
#default value is 30 seconds.
#  @param [Integer] context - Set how many context lines to show in diff
#  @param [Integer] forks - This is the default number of parallel processes to
#spawn when communicating with remote hosts. Since Ansible 1.3, the fork number
#is automatically limited to the number of possible hosts at runtime, so this #
#is really a limit of how much network and CPU load you think you can handle.
#Many users may set this to 50, some set it to 500 or more. If you have a large
#number of hosts, higher values will make actions across all of those hosts
#complete faster.
#  @param [Integer] poll_interval - For asynchronous tasks in Ansible (covered
#in Asynchronous Actions and Polling), this is how often to check back on the
#status of those tasks when an explicit poll interval is not supplied. The
#default is a reasonably moderate 15 seconds which is a tradeoff between
#checking in frequently and providing a quick turnaround when something may
#have completed.
#  @param [Integer] remote_port - This sets the default SSH port on all of your
#systems, for systems that didn’t specify an alternative value in inventory.
#The default is the standard 22.
#  @param [Integer] timeout - This is the default SSH timeout to use on
#connection attempts.
#  @param [Integer] max_diff_size - This controls the cutoff point (in bytes)
#on --diff for files set to 0 for unlimited (RAM may suffer!).
#  @param [Integer] nocows - By default, Ansible will take advantage of Cowsay
#if installed to create / usr / bin / ansible-playbook is more exciting.
#Because? We believe that systems management should be a happy experience. If
# You do not like cows, you can turn them off by setting 'nocows' to 1.
#  @param [Integer] nocolor - By default ansible will try to colorize output to
#give a better indication of failure and status information. If you dislike
#this behavior you can turn it off by setting nocolor to 1.
#  @param [Integer] var_compression_level - Controls the compression level of
#variables sent to worker processes. At the default of 0, no compression is
#used. This value must be an integer from 0 to 9.
#  @param [String] sudo_flags - Additional flags to pass to sudo when engaging
#sudo support. The default is ‘-H -S -n’ which sets the HOME environment
#variable, prompts for passwords via STDIN, and avoids prompting the user for
#input of any kind. Note that ‘-n’ will conflict with using password-less sudo
#auth, such as pam_ssh_agent_auth. In some situations you may wish to add or
#remove flags, but in general most users will not need to change this setting.
#  @param [String] cow_selection - Set which cowsay stencil you'd like to use
#by default. When set to 'random', a random stencil will be selected for each
#task. The selection will be filtered against the `cow_whitelist` option below.
#  @param [String] cow_whitelist - When using the 'random' option for cowsay,
#stencils will be restricted to this list. it should be formatted as a
#comma-separated list with no spaces between names. NOTE: line continuations
#here are for formatting purposes only, as the INI parser in python does not
#support them.
#  @param [String] action_plugins - Actions are pieces of code in ansible that
#enable things like module execution, templating, and so forth.
#  @param [String] cache_plugins - Set plugin path directories here, separate
#with colons.
#  @param [String] callback_plugins - Set plugin path directories here,
#separate with colons.
#  @param [String] diff_add - Parameter to change output color.
#  @param [String] special_context_filesystems - File systems that require
#special treatment when dealing with security context the default behaviour
#that copies the existing context or uses the user default needs to be changed
#to use the file system dependent context.
#  @param [String] changed - Parameter to change output color.
#  @param [String] unreachable - Parameter to change output color.
#  @param [String] debug - Parameter to change output color.
#  @param [String] version - Version of the ansible instalation.
#  @param [String] confdir - Directory of configuration file.
#  @param [String] package_name - The name of package.
#  @param [String] group - Default group to ansible user
#  @param [String] user - Default user to ansible.
#  @param [String] error - Parameter to change output color.
#  @param [String] warn - Parameter to change output color.
#  @param [String] verbose - Parameter to change output color.
#  @param [String] highlight - Parameter to change output color.
#  @param [String] deprecate - Parameter to change output color.
#  @param [String] skip - Parameter to change output color.
#  @param [String] connection_plugins - Set plugin path directories here, separate with colons.
#  @param [String] lookup_plugins - Set plugin path directories here, separate with colons.
#  @param [String] inventory_plugins - Set plugin path directories here, separate with colons.
#  @param [String] vars_plugins - Set plugin path directories here, separate with colons.
#  @param [String] filter_plugins - Set plugin path directories here, separate with colons.
#  @param [String] diff_lines - Parameter to change output color.
#  @param [String] diff_remove - Parameter to change output color.
#  @param [String] test_plugins - Set plugin path directories here, separate with colons.
#  @param [String] terminal_plugins - Set plugin path directories here, separate with colons.
#  @param [String] strategy_plugins - Set plugin path directories here, separate with colons.
#  @param [String] strategy - By default, ansible will use the 'linear' strategy but you may want to try another one
#  @param [String] ask_sudo_pass - Similar to ask_pass, this controls whether
#an Ansible playbook should prompt for a sudo password by default when sudoing.
#The default behavior is also no.
#  @param [String] remote_user - This is the default username ansible will
#connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will
#always default to the current user if this is not defined.
#  @param [String] ok - Parameter to change output color.
#  @param [String] log_path - If present and configured in ansible.cfg, Ansible
#will log information about executions at the designated location. Be sure the
#user running Ansible has permissions on the logfile.
#  @param [String] name_module - This is the default module name (-m) value for
#/usr/bin/ansible. The default is the ‘command’ module. Remember the command
#module doesn’t support shell variables, pipes, or quotes, so you might wish to
#change it to ‘shell’.
#  @param [String] jinja2_extensions - This is a developer-specific feature #
#that allows enabling additional Jinja2 extensions.
#  @param [String] vault_password_file - Configures the path to the Vault
#password file as an alternative to specifying --vault-password-file on the
#command line.
#  @param [String] module_utils - The module_utils are python modules that
#Ansible is able to combine with Ansible modules when sending them to the
#remote machine. Having custom module_utils is useful for extracting common
#code when developing a set of site-specific modules. Ansible can look in
#multiple locations if you feed it a colon separated path, and it also will
#look for modules in the ./module_utils directory alongside a playbook.
#  @param [String] ansible_managed - This string can be helpful to indicate
#that a file should not be directly edited because Ansible may overwrite the
#contents of the file.
#  @param [String] sudo_user - This is the default user to sudo to if
#--sudo-user is not specified or ‘sudo_user’ is not specified in an Ansible
#playbook. The default is the most logical: ‘root’.
#  @param [String] inventory_ignore_extensions - Coma-separated list of file
#extension patterns to ignore when Ansible inventory is a directory with
#multiple sources (static and dynamic).
#  @param [String] transfer_method - Control the mechanism for transferring
#files (new). If set, this will override the scp_if_ssh option
#  @param [String] transport - Some basic default values.
#  @param [String] gather_subset - This only affects the gathering done by a
#play's gather_facts directive, by default gathering retrieves all facts
#subsets, all - gather all subsets, network - gather min and network facts,
#hardware - gather hardware facts (longest facts to retrieve), virtual - gather
#min and virtual facts, facter - import facts from facter, ohai - import facts
#from ohai, you can combine them using comma (ex: network,virtual), you can
#negate them using ! (ex: !hardware,!facter,!ohai), a minimal set of facts is
#always gathered.
#  @param [String] module_set_locale - This boolean value controls whether or
#not Ansible will prepend locale-specific environment variables (as specified
#via the module_lang configuration option). If enabled, it results in the LANG,
#LC_MESSAGES, and LC_ALL being set when the module is executed on the given
#remote system. By default this is disabled.
#  @param [String] host_key_checking - As described in Getting Started, host
#key checking is on by default in Ansible 1.3 and later. If you understand the
#implications and wish to disable it, you may do so here by setting the value
#to False.
#  @param [String] stdout_callback - This setting allows you to override the
#default stdout callback for ansible-playbook.
#  @param [String] gathering - The value ‘implicit’ is the default, which means
#that the fact cache will be ignored and facts will be gathered per play unless
#‘gather_facts: False’ is set. The value ‘explicit’ is the inverse, facts will
#not be gathered unless directly requested in the play. The value ‘smart’ means
#each new host that has no facts discovered will be scanned, but if the same
#host is addressed in multiple plays it will not be contacted again in the
#playbook run. This option can be useful for those wishing to save fact
#gathering time. Both ‘smart’ and ‘explicit’ will use the fact cache.
#  @param [String] roles_path - The roles path indicate additional directories
#beyond the ‘roles/’ subdirectory of a playbook project to search to find
#Ansible roles. For instance, if there was a source control repository of
#common roles and a different repository of playbooks, you might choose to
#establish a convention to checkout roles in /opt/mysite/roles like so.
#  @param [String] ask_pass - Ask for privilege escalation password, the
#default is False.
#  @param [String] executable - This is the location of the ssh binary. It
#defaults to ssh which will use the first ssh binary available in $PATH. This
#config can also be overridden with ansible_ssh_executable inventory variable.
#  @param [String] sudo_exe - If using an alternative sudo implementation on
#remote machines, the path to sudo can be replaced here provided the sudo
#implementation is matching CLI flags with the standard sudo.
#  @param [String] control_path - This is the location to save ControlPath
#sockets. This defaults to.
#  @param [String] retry_files_save_path - The retry files save path is where
#Ansible will save .retry files when a playbook fails and retry_files_enabled
#is True (the default). The default location is adjacent to the play (~/ in
#versions older than 2.0) and can be changed to any writeable path.
#  @param [String] squash_actions - Ansible can optimise actions that call
#modules that support list parameters when using with_ looping. Instead of
#calling the module once for each item, the module is called once with the full
#list.
#  @param [String] become_method - Set the privilege escalation method. The
#default is sudo, other options are su, pbrun, pfexec, doas, ksu.
#  @param [String] remote_tmp - Ansible works by transferring modules to your
#remote machines, running them, and then cleaning up after itself. In some
#cases, you may not wish to use the default location and would like to change
#the path. You can do so by altering this setting.
#  @param [String] control_path_dir - This is the base directory of the
#ControlPath sockets. It is the %(directory)s part of the control_path option.
#This defaults to.
#  @param [String] ssh_args - If set, this will pass a specific set of options
#to Ansible rather than Ansible’s usual defaults.
#  @param [String] module_compression - Controls what compression method is
#used for new-style ansible modules when they are sent to the remote system.
#The compression types depend on having support compiled into both the
#controller's python and the client's python. The names should match with the
#python Zipfile compression types: ZIP_STORED (no compression. available
#everywhere), ZIP_DEFLATED (uses zlib, the default) These values may be set per
#host via the ansible_module_compression inventory variable
#  @param [String] local_tmp - When Ansible gets ready to send a module to a
#remote machine it usually has to add a few things to the module: Some
#boilerplate code, the module’s parameters, and a few constants from the config
#file. This combination of things gets stored in a temporary file until ansible
#exits and cleans up after itself. The default location is a subdirectory of
#the user’s home directory. If you’d like to change that, you can do so by
#altering this setting.
#  @param [String] module_lang - This is to set the default language to
#communicate between the module and the system. By default, the value is value
#LANG on the controller or, if unset, en_US.UTF-8 (it used to be C in previous
#versions).
#  @param [String] inventory - Enable inventory plugins, default: 'host_list',
#'script', 'yaml', 'ini'.
#  @param [String] hash_behaviour - If inventory variables overlap, does the
#higher precedence one win or are hash values merged together?  The default is
#'replace' but this can also be set to 'merge'.
#  @param [String] library - Some basic default values.
#  @param [String] private_key_file - If set, always use this private key file
#for authentication, same as if passing --private-key to ansible or
#ansible-playbook
#  @param [String] callback_whitelist - Enable callback plugins, they can
#output to stdout but cannot be 'stdout' type.
#  @param [String] become_user - Ansible can use existing privilege escalation
#systems to allow a user to execute tasks as another. As of 1.9 ‘become’
#supersedes the old sudo/su, while still being backwards compatible. Settings
#live under the [privilege_escalation] header.
#  @param [String] inventory_enabled - Enable inventory plugins, default:
#'host_list', 'script', 'yaml', 'ini'.
#  @param [String] fact_caching - If set to a persistent type (not 'memory',
#for example 'redis') fact values from previous runs in Ansible will be stored.
# This may be useful when wanting to use, for example, IP information from one
#group of servers without having to talk to them in the same playbook run to
#get their current IP information.
#  @param [String] scp_if_ssh - Control the mechanism for transferring files
#(old).
#  @param [Boolean] display_skipped_hosts - By default, ansible-playbook will
#display "Skipping [host]" if it determines a task should not be run on a host.
# Set this to "False" if you don't want to see these "Skipping" messages. NOTE:
#the task header will still be shown regardless of whether or not the task is
#skipped.
#  @param [Boolean] retry_files_enabled - Retry files. When a playbook fails by
#default a .retry file will be created in ~/. You can disable this feature by
#setting retry_files_enabled to False and you can change the location of the
#files by setting retry_files_save_path.
#  @param [Boolean] command_warnings - Ansible can optionally warn when usage
#of the shell and command module appear to be simplified by using a default
#Ansible module instead.  These warnings can be silenced by adjusting the
#following setting or adding warn=yes or warn=no to the end of the command line
#parameter string.  This will for example suggest using the git module instead
#of shelling out to the git command.
#  @param [Boolean] bin_ansible_callbacks - By default callbacks are not loaded
#for /bin/ansible, enable this if you want, for example, a notification or
#logging callback to also apply to /bin/ansible runs
#  @param [Boolean] become - The equivalent of adding sudo: or su: to a play or
#task, set to true/yes to activate privilege escalation. The default behavior
#is no.
#  @param [Boolean] allow_world_readable_tmpfiles - This makes the temporary
#files created on the machine to be world readable and will issue a warning
#instead of failing the task.
#  @param [Boolean] system_warnings - Allows disabling of warnings related to
#potential issues on the system running ansible itself (not on the managed
#hosts).
#  @param [Boolean] display_args_to_stdout - By default, ansible-playbook will
#print a header for each task that is run to stdout. These headers will contain
#the name: field from the task if you specified one. If you didn’t then
#ansible-playbook uses the task’s action to help you tell which task is
#presently running. Sometimes you run many of the same action and so you want
#more information about the task to differentiate it from others of the same
#action. If you set this variable to True in the config then ansible-playbook
#will also include the task’s arguments in the header.
#  @param [Boolean] pipelining - Enabling pipelining reduces the number of SSH
#operations required to execute a module on the remote server, by executing
#many ansible modules without actual file transfer. This can result in a very
#significant performance improvement when enabled, however when using “sudo:”
#operations you must first disable ‘requiretty’ in /etc/sudoers on all managed
#hosts.
#  @param [Boolean] sftp_batch_mode - If False, sftp will not use batch mode to
#transfer files. This may cause some types of file transfer failures impossible
#to catch however, and should only be disabled if your sftp version has
#problems with batch mode
#  @param [Boolean] allow_unsafe_lookups - When enabled, this option allows
#lookups (via variables like {{lookup('foo')}} or when used as a loop with
#`with_foo`) to return data that is not marked "unsafe". This means the data
#may contain jinja2 templating language which will be run through the
#templating engine. ENABLING THIS COULD BE A SECURITY RISK
#  @param [Boolean] accelerate_multi_key - If set to yes, accelerate_multi_key
#will allow multiple private keys to be uploaded to it, though each user must
#have access to the system via SSH to add a new key. The default is "no".
#  @param [Boolean] no_target_syslog - Prevents logging of tasks, but only on
#the targets, data is still logged on the master/controller.
#  @param [Boolean] merge_multiple_cli_flags - This controls how ansible
#handles multiple --tags and --skip-tags arguments on the CLI.  If this is True
#then multiple arguments are merged together.  If it is False, then the last
#specified argument is used and the others are ignored. This option will be
#removed in 2.8.
#  @param [Boolean] become_ask_pass - Ask for privilege escalation password,
#the default is False.
#  @param [Boolean] pty - By default, Ansible requests a pseudo-terminal for
#commands executed under sudo. Uncomment this line to disable this behaviour.
#  @param [Boolean] always - Always print diff when running ( same as always
#running with -D/--diff )
#  @param [Boolean] record_host_keys - Uncomment this line to cause the
#paramiko connection plugin to not record new host keys encountered.  Increases
#performance on new host additions.  Setting works independently of the host
#key checking setting above.
#  @param [Boolean] show_custom_stats - Controls showing custom stats at the
#end, off by default
#  @param [Boolean] any_errors_fatal - Set default errors for all plays.
#  @param [Boolean] host_key_auto_add - When using persistent connections with
#Paramiko, the connection runs in a background process.  If the host doesn't
#already have a valid SSH key, by default Ansible will prompt to add the host
#key.  This will cause connections running in background processes to fail.
#Uncomment this line to have Paramiko automatically add host keys.
#  @param [Boolean] libvirt_lxc_noseclabel - Set this to yes to allow
#libvirt_lxc connections to work without SELinux.
#  @param [Boolean] look_for_keys - Paramiko will default to looking for SSH
#keys initially when trying to authenticate to remote devices.  This is a
#problem for some network devices that close the connection after a key
#failure.  Uncomment this line to disable the Paramiko look for keys function
#  @param [Boolean] task_includes_static - Determine whether includes in tasks
#and handlers are "static" by default. As of 2.0, includes are dynamic by
#default. Setting these values to True will make includes behave more like they
#did in the 1.x versions.
#  @param [Boolean] handler_includes_static - Determine whether includes in
#tasks and handlers are "static" by default. As of 2.0, includes are dynamic by
#default. Setting these values to True will make includes behave more like they
#did in the 1.x versions.
#  @param [Boolean] private_role_vars - By default, variables from roles will
#be visible in the global variable scope. To prevent this, the following option
#can be enabled, and only tasks and handlers within the role will see the
#variables there
#  @param [Boolean] error_on_missing_handler - Controls if a missing handler
#for a notification event is an error or a warning.
#  @param [Boolean] error_on_undefined_vars - By default (as of 1.3), Ansible
#will raise errors when attempting to dereference Jinja2 variables that are not
#set in templates or action lines. Uncomment this line to revert the behavior
#to pre-1.3.
#  @param [Boolean] no_log - Prevents logging of task data, off by default.
#  @param [Boolean] restrict_facts_namespace - This keeps facts from polluting
#the main namespace as variables. Setting to True keeps them under the
#ansible_facts namespace, the default is False.
#  @param [Boolean] deprecation_warnings - Ansible may display deprecation
#warnings for language features that should no longer be used and will be
#removed in future versions.To disable these warnings, set the following value
#to False.
#  @param [Boolean] network_group_modules - This family of modules use an
#alternative execution path optimized for network appliances only update this
#setting if you know how this works, otherwise it can break module execution.
#  @param [Float] accelerate_connect_timeout - This setting controls the
#timeout for the socket connect call, and should be kept relatively low. The
#connection to the accelerate_port will be attempted 3 times before Ansible
#will fall back to ssh or paramiko (depending on your default connection
#setting) to try and start the accelerate daemon remotely. The default setting
#is 1.0 seconds.
#  @param [Boolean] use_dist_repo - defaults to false for backward compatability.
#When true does not manage any special repos.
#
#  Variables
#  ----------
#
#  Not included variables.
#
#  Examples
#  --------
#
#  class { 'ansible':
#    roles_path       => '/srv/roles',
#    timeout          => 30,
#    log_path         => '/var/log/ansible.log',
#    private_key_file => '/etc/keys',
#  }
#
#  ansible::hosts { 'databases':
#    entrys => [
#      '172.16.0.30',
#      '172.16.0.40',
#    ]
#  }
#
#  Authors
#  -------
#
#  [Edgar Silva] <edgarsilva948@gmail.com>
#  [Vincius Xavier] <viniciusxavierbove@gmail.com>
#
#  Copyright
#  ---------
#
#  Copyright 2017 - Otherskins, Inc.
#
class ansible (
Optional[Integer[1,10]] $gather_timeout,
Optional[Integer] $accelerate_timeout,
Optional[Integer[1,65535]] $accelerate_port,
Optional[Integer] $command_timeout,
Optional[Integer] $connect_retry_timeout,
Optional[Integer] $connect_timeout,
Optional[Integer] $context,
Optional[Integer] $forks,
Optional[Integer] $poll_interval,
Optional[Integer[1,65535]] $remote_port,
Optional[Integer] $timeout,
Optional[Integer] $max_diff_size,
Optional[Integer[0,1]] $nocows,
Optional[Integer[0,1]] $nocolor,
Optional[Integer[0,9]] $var_compression_level,
Optional[Enum['-H', '-S', '-n']] $sudo_flags,
Optional[Enum['default', 'random']] $cow_selection,
Optional[Enum[
  'bud-frogs',
  'bunny',
  'cheese',
  'daemon',
  'default',
  'dragon',
  'elephant-in-snake',
  'elephant',
  'eyes',
  'hellokitty',
  'kitty',
  'luke-koala',
  'meow',
  'milk',
  'moofasa',
  'moose',
  'ren',
  'sheep',
  'small',
  'stegosaurus',
  'stimpy',
  'supermilker',
  'three-eyes',
  'turkey',
  'turtle',
  'tux',
  'udder',
  'vader-koala',
  'vader',
  'www'
]] $cow_whitelist,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan'
]] $diff_add,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $special_context_filesystems,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $changed,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $unreachable,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $debug,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $error,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $warn,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $verbose,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $highlight,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $deprecate,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $skip,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $diff_lines,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan',
]] $diff_remove,
Optional[Enum[
  'white',
  'blue',
  'bright purple',
  'red',
  'dark gray',
  'purple',
  'cyan',
  'red',
  'green',
  'yellow',
  'green',
  'red',
  'cyan'
]] $ok,
Optional[Stdlib::Absolutepath] $action_plugins,
Optional[Stdlib::Absolutepath] $cache_plugins,
Optional[Stdlib::Absolutepath] $callback_plugins,
Optional[Stdlib::Absolutepath] $connection_plugins,
Optional[Stdlib::Absolutepath] $lookup_plugins,
Optional[Stdlib::Absolutepath] $inventory_plugins,
Optional[Stdlib::Absolutepath] $vars_plugins,
Optional[Stdlib::Absolutepath] $filter_plugins,
Optional[Stdlib::Absolutepath] $test_plugins,
Optional[Stdlib::Absolutepath] $terminal_plugins,
Optional[Stdlib::Absolutepath] $strategy_plugins,
Optional[Stdlib::Absolutepath] $log_path,
Optional[Stdlib::Absolutepath] $executable,
Optional[Stdlib::Absolutepath] $private_key_file,
Optional[Stdlib::Absolutepath] $vault_password_file,
Optional[Stdlib::Absolutepath] $inventory,
Optional[Stdlib::Absolutepath] $library,
Optional[Stdlib::Absolutepath] $module_utils,
Optional[Stdlib::Absolutepath] $local_tmp,
Optional[Enum['linear', 'free']] $strategy,
Optional[Boolean] $ask_sudo_pass,
Optional[String] $remote_user,
Optional[String] $name_module,
Optional[Enum['replace', 'merge']] $hash_behaviour,
Optional[Enum['jinja2.ext.do', 'jinja2.ext.i18n']] $jinja2_extensions,
Optional[String] $ansible_managed,
Optional[String] $scp_if_ssh,
Optional[Enum['smart', 'piped', 'scp', 'sftp']] $transfer_method,
Optional[String] $sudo_user,
Optional[Enum['~', '.orig', '.bak', '.ini', '.cfg', '.retry', '.pyc', '.pyo']] $inventory_ignore_extensions,
Optional[Enum['local', 'chroot', 'jail', 'paramiko']] $transport,
Optional[String] $module_lang,
Optional[Enum['explicit', 'implicit', 'smart']] $gathering,
Optional[Enum['all', 'network', 'hardware', 'virtual', 'facter', 'ohai']] $gather_subset,
Optional[Boolean] $host_key_checking,
Optional[Boolean] $module_set_locale,
Optional[Stdlib::Absolutepath] $roles_path,
Optional[Boolean] $ask_pass,
Optional[String] $stdout_callback,
Optional[Enum['timer', 'mail']] $callback_whitelist,
Optional[Enum['host_list', 'script', 'yaml', 'ini', 'virtualbox', 'yaml', 'constructed']] $inventory_enabled,
Optional[String] $sudo_exe,
Optional[Stdlib::Absolutepath] $retry_files_save_path,
Optional[String] $control_path,
Optional[String] $become_user,
Optional[Enum['apk', 'apt', 'dnf', 'homebrew', 'pacman', 'pkgng', 'yum','zypper']] $squash_actions,
Optional[Enum['sudo', 'su', 'pbrun', 'pfexec', 'doas', 'ks']] $become_method,
Optional[Stdlib::Absolutepath] $control_path_dir,
Optional[Stdlib::Absolutepath] $remote_tmp,
Optional[String] $ssh_args,
Optional[String] $fact_caching,
Optional[Enum['ZIP_DEFLATED', 'ZIP_STORED']] $module_compression,
Optional[Boolean] $bin_ansible_callbacks,
Optional[Boolean] $retry_files_enabled,
Optional[Boolean] $display_skipped_hosts,
Optional[Boolean] $become,
Optional[Boolean] $display_args_to_stdout,
Optional[Boolean] $error_on_undefined_vars,
Optional[Boolean] $pipelining,
Optional[Boolean] $system_warnings,
Optional[Boolean] $deprecation_warnings,
Optional[Boolean] $command_warnings,
Optional[Boolean] $no_log,
Optional[Boolean] $sftp_batch_mode,
Optional[Enum['yes', 'no']] $always,
Optional[Boolean] $no_target_syslog,
Optional[Boolean] $allow_world_readable_tmpfiles,
Optional[Boolean] $merge_multiple_cli_flags,
Optional[Boolean] $show_custom_stats,
Optional[Boolean] $restrict_facts_namespace,
Optional[Boolean] $allow_unsafe_lookups,
Optional[Boolean] $accelerate_multi_key,
Optional[Boolean] $pty,
Optional[Boolean] $become_ask_pass,
Optional[Boolean] $any_errors_fatal,
Optional[Boolean] $record_host_keys,
Optional[Boolean] $task_includes_static,
Optional[Boolean] $host_key_auto_add,
Optional[Boolean] $look_for_keys,
Optional[Boolean] $libvirt_lxc_noseclabel,
Optional[Boolean] $handler_includes_static,
Optional[Boolean] $error_on_missing_handler,
Optional[Boolean] $private_role_vars,
Optional[Tuple] $network_group_modules,
Optional[Float] $accelerate_connect_timeout,
String $version,
Stdlib::Absolutepath $confdir,
String $package_name,
String $user,
String $group,
String $ensure,
Boolean $use_dist_repo = false,
) {

  include ansible::user

  contain ::ansible::install
  contain ::ansible::config

  Class['ansible::install']
  -> Class['ansible::config']

  # We use a wrapper: so as not to try to create two key pairs on the Puppet
  # master with the same name in the same environment
  @@sshkeys::create_key_wrapper{"ansible_$hostname": 
      key_name => "ansible_$environment",
  }

  # installs the generated public and private SSH key pair in the Ansible
  # user's home directory
  sshkeys::set_client_key_pair{"ansible@${hostname}":
    keyname => "ansible_$environment",
    user    => 'ansible',
  }

  # Ensure the inventory file exists, and populate groups based on targets'
  # declarations of the ansible::add_to_group defined type.
  file { "${ansible::confdir}/hosts":
    ensure  => file,
  } ->
  Ini_setting <<| tag == 'ansible::add_to_group' |>>

}
