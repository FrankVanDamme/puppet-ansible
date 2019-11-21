[![Build Status](https://travis-ci.org/otherskins/puppet-ansible.svg?branch=master)](https://travis-ci.org/otherskins/puppet-ansible)  ![License](https://img.shields.io/badge/license-Apache%202-blue.svg) ![Version](https://img.shields.io/puppetforge/v/otherskins/ansible.svg) ![Downloads](https://img.shields.io/puppetforge/dt/otherskins/ansible.svg)


# Puppet module: Ansible

### Table of Contents

1. [Description](#module-description)
2. [Setup - The basics of getting started with ansible](#setup)
    * [What ansible affects](#what-ansible-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with ansible](#beginning-with-ansible)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

The ansible module installs and configures the Ansible across a range of operating systems and distributions. It is based upon the original work at [otherskins](git@github.com:saz/puppet-sudo.git).

## Setup

### What ansible affects
This module affects the ansible package across multiple distributions, manages all the parameters of the ansible.cfg configuration file, adds and removes entries in the /etc/ansible/hosts inventory file.

### Setup requirements
* Puppet >= 4.10
* Facter >= 2.0
* [Stdlib Module](https://github.com/puppetlabs/puppetlabs-stdlib)
* [Concat Module](https://github.com/puppetlabs/puppetlabs-concat)
* [Apt Module](https://github.com/puppetlabs/puppetlabs-apt)

### Beginning with ansible

`include ::ansible` is enough to get you up and running with default parameters.
You can pass the parameters to ansible's configuration, like this:

```yaml
class { 'ansible':
  ensure           => 'present',
  roles_path       => '/srv/roles',
  timeout          => 30,
  log_path         => '/var/log/ansible.log',
  private_key_file => '/etc/keys',
}
```

Do you want to manage the hosts file? Use the type defined `ansible::hosts` for creating entries.

```puppet
  ansible::hosts { 'webservers':
    entrys  => [
      '172.16.0.10',
    ]
  }
```

## Usage

To control all the parameters of the configuration file use the main `::ansible` class. See the common usages below for examples.

### Install ansible with default parameters

```puppet
include '::ansible'
```

### Install and specifying hosts

```puppet
include '::ansible'

ansible::hosts { 'databases':
  entrys  => [
    'dbmaster.com',
    'database.com',
  ]
}

ansible::hosts { 'webservers':
  entrys  => [
    '10.0.0.20',
    'web1.com',
  ]
}

ansible::hosts { 'loadbalancers':
  entrys  => [
    '192.168.200.0/24',
  ]
}
```

### Specific parameters to manage configuration file ansible.cfg

```puppet
class { 'ansible':
  ensure           => 'present',
  roles_path       => '/srv/roles',
  timeout          => 30,
  log_path         => '/var/log/ansible.log',
  private_key_file => '/etc/keys',
}
```

### Using hiera keys
This module don't use params class. Values of parameters can be used with Hiera v5:

```yaml
ansible::roles_path: '/srv/roles'
ansible::timeout: 30
ansible::log_path: '/var/log/ansible.log'
ansible::private_key_file: '/etc/keys'
```

# Reference

## Defined Types

* `ansible::hosts` - Set hosts entries

## Classes

### Public classes

* ansible: Main class, includes all other classes.

### Private classes

* ansible::install Handles the packages.
* ansible::config Handles the configuration file.
* ansible::repo::apt Handles the repository in the Debian based specific distributions.
* ansible::repo::yum Handles the repository in the RedHat based specific distributions.

## Parameters

The following parameters are available in the `::ansible` class:

#### `gather_timeout`

Optional.

Data type: Integer.

Description: Some hardware related facts are collected with a maximum timeout of 10 seconds. This option lets you increase or decrease that timeout to something more suitable for the environment.

Default value: `undef`.


#### `accelerate_timeout`

Optional.

Data type: Integer.

Description: This setting controls the timeout for receiving data from a client. If no data is received during this time, the socket connection will be closed. A keepalive packet is sent back to the controller every 15 seconds, so this timeout should not be set lower than 15 (by default, the timeout is 30 seconds)

Default value: `undef`.


#### `accelerate_port`

Optional.

Data type: Integer.

Description: This is the port to use for accelerated mode:

Default value: `undef`.


#### `command_timeout`

Optional.

Data type: Integer.

Description: The command timeout value defines the amount of time to wait for a command or RPC call before timing out. The value for the command timeout must be less than the value of the persistent connection idle timeout (connect_timeout).

Default value: `undef`.


#### `connect_retry_timeout`

Optional.

Data type: Integer.

Description: Configures the persistent connection retry timeout. This value configures the retry timeout that ansible-connection will wait to connect to the local domain socket. This value must be larger than the ssh timeout (timeout) and less than persistent connection idle timeout (connect_timeout). The default value is 15 seconds.

Default value: `undef`.

#### `connect_timeout`

Optional.

Data type: Integer.

Description: Configures the persistent connection timeout value in seconds.  This value is how long the persistent connection will remain idle before it is destroyed. If the connection doesn't receive a request before the timeout value expires, the connection is shutdown. The default value is 30 seconds.

Default value: `undef`.

#### `context`

Optional.

Data type: Integer.

Description: Set how many context lines to show in diff

Default value: `undef`.

#### `forks`

Optional.

Data type: Integer.

Description: This is the default number of parallel processes to spawn when communicating with remote hosts. Since Ansible 1.3, the fork number is automatically limited to the number of possible hosts at runtime, so this is really a limit of how much network and CPU load you think you can handle. Many users may set this to 50, some set it to 500 or more. If you have a large number of hosts, higher values will make actions across all of those hosts complete faster.

Default value: `undef`.

#### `poll_interval`

Optional.

Data type: Integer.

Description: For asynchronous tasks in Ansible (covered in Asynchronous Actions and Polling), this is how often to check back on the status of those tasks when an explicit poll interval is not supplied. The default is a reasonably moderate 15 seconds which is a tradeoff between checking in frequently and providing a quick turnaround when something may have completed.

Default value: `undef`.

#### `remote_port`

Optional.

Data type: Integer.

Description: This sets the default SSH port on all of your systems, for systems that didn’t specify an alternative value in inventory. The default is the standard 22.

Default value: `undef`.

#### `timeout`

Optional.

Data type: Integer.

Description: This is the default SSH timeout to use on connection attempts.

Default value: `undef`.

#### `max_diff_size`

Optional.

Data type: Integer.

Description: This controls the cutoff point (in bytes) on --diff for files set to 0 for unlimited (RAM may suffer!).

Default value: `undef`.

#### `nocows`

Optional.

Data type: Integer.

Description: Por padrão, Ansible irá aproveitar o Cowsay se instalado para criar /usr/bin/ansible-playbook é mais excitante. Por quê? Acreditamos que o gerenciamento de sistemas deve ser uma experiência feliz. Se você não gosta das vacas, pode desativá-las definindo 'nocows' para 1.

Default value: `undef`.

#### `nocolor`

Optional.

Data type: Integer.

Description: By default ansible will try to colorize output to give a better indication of failure and status information. If you dislike this behavior you can turn it off by setting ‘nocolor’ to 1.

Default value: `undef`.

#### `var_compression_level`

Optional.

Data type: Integer.

Description: Controls the compression level of variables sent to worker processes. At the default of 0, no compression is used. This value must be an integer from 0 to 9.

Default value: `undef`.

#### `sudo_flags`

Optional.

Data type: String.

Description: Additional flags to pass to sudo when engaging sudo support. The default is ‘-H -S -n’ which sets the HOME environment variable, prompts for passwords via STDIN, and avoids prompting the user for input of any kind. Note that ‘-n’ will conflict with using password-less sudo auth, such as pam_ssh_agent_auth. In some situations you may wish to add or remove flags, but in general most users will not need to change this setting.

Default value: `undef`.

#### `cow_selection`

Optional.

Data type: String.

Description: Set which cowsay stencil you'd like to use by default. When set to 'random', a random stencil will be selected for each task. The selection will be filtered against the `cow_whitelist` option below.

Default value: `undef`.

#### `cow_whitelist`

Optional.

Data type: String.

Description: # when using the 'random' option for cowsay, stencils will be restricted to this list. it should be formatted as a comma-separated list with no spaces between names. NOTE: line continuations here are for formatting purposes only, as the INI parser in python does not support them.

Default value: `undef`.

#### `action_plugins`

Optional.

Data type: String.

Description: Actions are pieces of code in ansible that enable things like module execution, templating, and so forth.

Default value: `undef`.

#### `cache_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `callback_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `diff_add`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `special_context_filesystems`

Optional.

Data type: String.

Description: File systems that require special treatment when dealing with security context the default behaviour that copies the existing context or uses the user default needs to be changed to use the file system dependent context.

Default value: `undef`.

#### `changed`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `unreachable`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `debug`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `error`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `warn`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `verbose`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `highlight`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `deprecate`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `skip`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `connection_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `lookup_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `inventory_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `vars_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `filter_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `diff_lines`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `diff_remove`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `test_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `terminal_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `strategy_plugins`

Optional.

Data type: String.

Description: Set plugin path directories here, separate with colons.

Default value: `undef`.

#### `strategy`

Optional.

Data type: String.

Description: # by default, ansible will use the 'linear' strategy but you may want to try another one

Default value: `undef`.

#### `ask_sudo_pass`

Optional.

Data type: String.

Description: Similar to ask_pass, this controls whether an Ansible playbook should prompt for a sudo password by default when sudoing. The default behavior is also no.

Default value: `undef`.

#### `remote_user`

Optional.

Data type: String.

Description: This is the default username ansible will connect as for /usr/bin/ansible-playbook. Note that /usr/bin/ansible will always default to the current user if this is not defined.

Default value: `undef`.

#### `ok`

Optional.

Data type: String.

Description: Parameter to change output color.

Default value: `undef`.

#### `log_path`

Optional.

Data type: String.

Description: If present and configured in ansible.cfg, Ansible will log information about executions at the designated location. Be sure the user running Ansible has permissions on the logfile.

Default value: `undef`.

#### `name_module`

Optional.

Data type: String.

Description: This is the default module name (-m) value for /usr/bin/ansible. The default is the ‘command’ module. Remember the command module doesn’t support shell variables, pipes, or quotes, so you might wish to change it to ‘shell’.

Default value: `undef`.

#### `jinja2_extensions`

Optional.

Data type: String.

Description: This is a developer-specific feature that allows enabling additional Jinja2 extensions.

Default value: `undef`.

#### `vault_password_file`

Optional.

Data type: String.

Description: Configures the path to the Vault password file as an alternative to specifying --vault-password-file on the command line.

Default value: `undef`.

#### `module_utils`

Optional.

Data type: String.

Description: The module_utils are python modules that Ansible is able to combine with Ansible modules when sending them to the remote machine. Having custom module_utils is useful for extracting common code when developing a set of site-specific modules. Ansible can look in multiple locations if you feed it a colon separated path, and it also will look for modules in the ./module_utils directory alongside a playbook.

Default value: `undef`.

#### `ansible_managed`

Optional.

Data type: String.

Description: This string can be helpful to indicate that a file should not be directly edited because Ansible may overwrite the contents of the file.

Default value: `undef`.

#### `sudo_user`

Optional.

Data type: String.

Description: This is the default user to sudo to if --sudo-user is not specified or ‘sudo_user’ is not specified in an Ansible playbook. The default is the most logical: ‘root’.

Default value: `undef`.

#### `inventory_ignore_extensions`

Optional.

Data type: String.

Description: Coma-separated list of file extension patterns to ignore when Ansible inventory is a directory with multiple sources (static and dynamic).

Default value: `undef`.

#### `transfer_method`

Optional.

Data type: String.

Description: Control the mechanism for transferring files (new). If set, this will override the scp_if_ssh option

Default value: `undef`.

#### `transport`

Optional.

Data type: String.

Description: Some basic default values.

Default value: `undef`.

#### `gather_subset`

Optional.

Data type: String.

Description: This only affects the gathering done by a play's gather_facts directive, by default gathering retrieves all facts subsets, all - gather all subsets, network - gather min and network facts, hardware - gather hardware facts (longest facts to retrieve), virtual - gather min and virtual facts, facter - import facts from facter, ohai - import facts from ohai, you can combine them using comma (ex: network,virtual), you can negate them using ! (ex: !hardware,!facter,!ohai), a minimal set of facts is always gathered.

Default value: `undef`.

#### `module_set_locale`

Optional.

Data type: String.

Description: This boolean value controls whether or not Ansible will prepend locale-specific environment variables (as specified via the module_lang configuration option). If enabled, it results in the LANG, LC_MESSAGES, and LC_ALL being set when the module is executed on the given remote system. By default this is disabled.

Default value: `undef`.

#### `host_key_checking`

Optional.

Data type: String.

Description: As described in Getting Started, host key checking is on by default in Ansible 1.3 and later. If you understand the implications and wish to disable it, you may do so here by setting the value to False.

Default value: `undef`.

#### `stdout_callback`

Optional.

Data type: String.

Description: This setting allows you to override the default stdout callback for ansible-playbook.

Default value: `undef`.

#### `gathering`

Optional.

Data type: String.

Description: The value ‘implicit’ is the default, which means that the fact cache will be ignored and facts will be gathered per play unless ‘gather_facts: False’ is set. The value ‘explicit’ is the inverse, facts will not be gathered unless directly requested in the play. The value ‘smart’ means each new host that has no facts discovered will be scanned, but if the same host is addressed in multiple plays it will not be contacted again in the playbook run. This option can be useful for those wishing to save fact gathering time. Both ‘smart’ and ‘explicit’ will use the fact cache.

Default value: `undef`.

#### `roles_path`

Optional.

Data type: String.

Description: The roles path indicate additional directories beyond the ‘roles/’ subdirectory of a playbook project to search to find Ansible roles. For instance, if there was a source control repository of common roles and a different repository of playbooks, you might choose to establish a convention to checkout roles in /opt/mysite/roles like so.

Default value: `undef`.

#### `ask_pass`

Optional.

Data type: String.

Description: Ask for privilege escalation password, the default is False.

Default value: `undef`.

#### `executable`

Optional.

Data type: String.

Description: This is the location of the ssh binary. It defaults to ssh which will use the first ssh binary available in $PATH. This config can also be overridden with ansible_ssh_executable inventory variable.

Default value: `undef`.

#### `sudo_exe`

Optional.

Data type: String.

Description: If using an alternative sudo implementation on remote machines, the path to sudo can be replaced here provided the sudo implementation is matching CLI flags with the standard sudo.

Default value: `undef`.

#### `control_path`

Optional.

Data type: String.

Description: This is the location to save ControlPath sockets. This defaults to.

Default value: `undef`.

#### `retry_files_save_path`

Optional.

Data type: String.

Description: The retry files save path is where Ansible will save .retry files when a playbook fails and retry_files_enabled is True (the default). The default location is adjacent to the play (~/ in versions older than 2.0) and can be changed to any writeable path.

Default value: `undef`.

#### `squash_actions`

Optional.

Data type: String.

Description: Ansible can optimise actions that call modules that support list parameters when using with_ looping. Instead of calling the module once for each item, the module is called once with the full list.

Default value: `undef`.

#### `become_method`

Optional.

Data type: String.

Description: Set the privilege escalation method. The default is sudo, other options are su, pbrun, pfexec, doas, ksu.

Default value: `undef`.

#### `remote_tmp`

Optional.

Data type: String.

Description: Ansible works by transferring modules to your remote machines, running them, and then cleaning up after itself. In some cases, you may not wish to use the default location and would like to change the path. You can do so by altering this setting.

Default value: `undef`.

#### `control_path_dir`

Optional.

Data type: String.

Description: This is the base directory of the ControlPath sockets. It is the %(directory)s part of the control_path option. This defaults to.

Default value: `undef`.

#### `ssh_args`

Optional.

Data type: String.

Description: If set, this will pass a specific set of options to Ansible rather than Ansible’s usual defaults.

Default value: `undef`.

#### `module_compression`

Optional.

Data type: String.

Description: Controls what compression method is used for new-style ansible modules when they are sent to the remote system.  The compression types depend on having support compiled into both the controller's python and the client's python. The names should match with the python Zipfile compression types: ZIP_STORED (no compression. available everywhere), ZIP_DEFLATED (uses zlib, the default) These values may be set per host via the ansible_module_compression inventory variable

Default value: `undef`.

#### `local_tmp`

Optional.

Data type: String.

Description: When Ansible gets ready to send a module to a remote machine it usually has to add a few things to the module: Some boilerplate code, the module’s parameters, and a few constants from the config file. This combination of things gets stored in a temporary file until ansible exits and cleans up after itself. The default location is a subdirectory of the user’s home directory. If you’d like to change that, you can do so by altering this setting.

Default value: `undef`.

#### `module_lang`

Optional.

Data type: String.

Description: This is to set the default language to communicate between the module and the system. By default, the value is value LANG on the controller or, if unset, en_US.UTF-8 (it used to be C in previous versions).

Default value: `undef`.

#### `inventory`

Optional.

Data type: String.

Description: Enable inventory plugins, default: 'host_list', 'script', 'yaml', 'ini'.

Default value: `undef`.

#### `hash_behaviour`

Optional.

Data type: String.

Description: If inventory variables overlap, does the higher precedence one win or are hash values merged together?  The default is 'replace' but this can also be set to 'merge'.

Default value: `undef`.

#### `library`

Optional.

Data type: String.

Description: Some basic default values.

Default value: `undef`.

#### `private_key_file`

Optional.

Data type: String.

Description: If set, always use this private key file for authentication, same as if passing --private-key to ansible or ansible-playbook

Default value: `undef`.

#### `callback_whitelist`

Optional.

Data type: String.

Description: Enable callback plugins, they can output to stdout but cannot be 'stdout' type.

Default value: `undef`.

#### `become_user`

Optional.

Data type: String.

Description: Ansible can use existing privilege escalation systems to allow a user to execute tasks as another. As of 1.9 ‘become’ supersedes the old sudo/su, while still being backwards compatible. Settings live under the [privilege_escalation] header.

Default value: `undef`.

#### `inventory_enabled`

Optional.

Data type: String.

Description: Enable inventory plugins, default: 'host_list', 'script', 'yaml', 'ini'.

Default value: `undef`.

#### `fact_caching`

Optional.

Data type: String.

Description: If set to a persistent type (not 'memory', for example 'redis') fact values from previous runs in Ansible will be stored.  This may be useful when wanting to use, for example, IP information from one group of servers without having to talk to them in the same playbook run to get their current IP information.

Default value: `undef`.

#### `scp_if_ssh`

Optional.

Data type: String.

Description: Control the mechanism for transferring files (old).

Default value: `undef`.

#### `display_skipped_hosts`

Optional.

Data type: Boolean.

Description: By default, ansible-playbook will display "Skipping [host]" if it determines a task should not be run on a host.  Set this to "False" if you don't want to see these "Skipping" messages. NOTE: the task header will still be shown regardless of whether or not the task is skipped.

Default value: `undef`.

#### `retry_files_enabled`

Optional.

Data type: Boolean.

Description: Retry files. When a playbook fails by default a .retry file will be created in ~/. You can disable this feature by setting retry_files_enabled to False and you can change the location of the files by setting retry_files_save_path.

Default value: `undef`.

#### `command_warnings`

Optional.

Data type: Boolean.

Description: Ansible can optionally warn when usage of the shell and command module appear to be simplified by using a default Ansible module instead.  These warnings can be silenced by adjusting the following setting or adding warn=yes or warn=no to the end of the command line parameter string.  This will for example suggest using the git module instead of shelling out to the git command.

Default value: `undef`.

#### `bin_ansible_callbacks`

Optional.

Data type: Boolean.

Description: By default callbacks are not loaded for /bin/ansible, enable this if you want, for example, a notification or logging callback to also apply to /bin/ansible runs

Default value: `undef`.

#### `become`

Optional.

Data type: Boolean.

Description: The equivalent of adding sudo: or su: to a play or task, set to true/yes to activate privilege escalation. The default behavior is no.

Default value: `undef`.

#### `allow_world_readable_tmpfiles`

Optional.

Data type: Boolean.

Description: This makes the temporary files created on the machine to be world readable and will issue a warning instead of failing the task.

Default value: `undef`.

#### `system_warnings`

Optional.

Data type: Boolean.

Description: Allows disabling of warnings related to potential issues on the system running ansible itself (not on the managed hosts).

Default value: `undef`.

#### `display_args_to_stdout`

Optional.

Data type: Boolean.

Description: By default, ansible-playbook will print a header for each task that is run to stdout. These headers will contain the name: field from the task if you specified one. If you didn’t then ansible-playbook uses the task’s action to help you tell which task is presently running. Sometimes you run many of the same action and so you want more information about the task to differentiate it from others of the same action. If you set this variable to True in the config then ansible-playbook will also include the task’s arguments in the header.

Default value: `undef`.

#### `pipelining`

Optional.

Data type: Boolean.

Description: Enabling pipelining reduces the number of SSH operations required to execute a module on the remote server, by executing many ansible modules without actual file transfer. This can result in a very significant performance improvement when enabled, however when using “sudo:” operations you must first disable ‘requiretty’ in /etc/sudoers on all managed hosts.

Default value: `undef`.

#### `sftp_batch_mode`

Optional.

Data type: Boolean.

Description: If False, sftp will not use batch mode to transfer files. This may cause some types of file transfer failures impossible to catch however, and should only be disabled if your sftp version has problems with batch mode

Default value: `undef`.

#### `allow_unsafe_lookups`

Optional.

Data type: Boolean.

Description: When enabled, this option allows lookups (via variables like {{lookup('foo')}} or when used as a loop with `with_foo`) to return data that is not marked "unsafe". This means the data may contain jinja2 templating language which will be run through the templating engine. ENABLING THIS COULD BE A SECURITY RISK

Default value: `undef`.

#### `accelerate_multi_key`

Optional.

Data type: Boolean.

Description: If set to yes, accelerate_multi_key will allow multiple private keys to be uploaded to it, though each user must have access to the system via SSH to add a new key. The default is "no".

Default value: `undef`.

#### `no_target_syslog`

Optional.

Data type: Boolean.

Description: Prevents logging of tasks, but only on the targets, data is still logged on the master/controller.

Default value: `undef`.

#### `merge_multiple_cli_flags`

Optional.

Data type: Boolean.

Description: This controls how ansible handles multiple --tags and --skip-tags arguments on the CLI.  If this is True then multiple arguments are merged together.  If it is False, then the last specified argument is used and the others are ignored. This option will be removed in 2.8.

Default value: `undef`.

#### `become_ask_pass`

Optional.

Data type: Boolean.

Description: Ask for privilege escalation password, the default is False.

Default value: `undef`.

#### `pty`

Optional.

Data type: Boolean.

Description: By default, Ansible requests a pseudo-terminal for commands executed under sudo. Uncomment this line to disable this behaviour.

Default value: `undef`.

#### `always`

Optional.

Data type: Boolean.

Description: Always print diff when running ( same as always running with -D/--diff )

Default value: `undef`.

#### `record_host_keys`

Optional.

Data type: Boolean.

Description: Uncomment this line to cause the paramiko connection plugin to not record new host keys encountered.  Increases performance on new host additions.  Setting works independently of the host key checking setting above.

Default value: `undef`.

#### `show_custom_stats`

Optional.

Data type: Boolean.

Description: Controls showing custom stats at the end, off by default

Default value: `undef`.

#### `any_errors_fatal`

Optional.

Data type: Boolean.

Description: Set default errors for all plays.

Default value: `undef`.

#### `host_key_auto_add`

Optional.

Data type: Boolean.

Description: When using persistent connections with Paramiko, the connection runs in a background process.  If the host doesn't already have a valid SSH key, by default Ansible will prompt to add the host key.  This will cause connections running in background processes to fail.  Uncomment this line to have Paramiko automatically add host keys.

Default value: `undef`.

#### `libvirt_lxc_noseclabel`

Optional.

Data type: Boolean.

Description: Set this to yes to allow libvirt_lxc connections to work without SELinux.

Default value: `undef`.

#### `look_for_keys`

Optional.

Data type: Boolean.

Description: Paramiko will default to looking for SSH keys initially when trying to authenticate to remote devices.  This is a problem for some network devices that close the connection after a key failure.  Uncomment this line to disable the Paramiko look for keys function

Default value: `undef`.

#### `task_includes_static`

Optional.

Data type: Boolean.

Description: Determine whether includes in tasks and handlers are "static" by default. As of 2.0, includes are dynamic by default. Setting these values to True will make includes behave more like they did in the 1.x versions.

Default value: `undef`.

#### `handler_includes_static`

Optional.

Data type: Boolean.

Description: Determine whether includes in tasks and handlers are "static" by default. As of 2.0, includes are dynamic by default. Setting these values to True will make includes behave more like they did in the 1.x versions.

Default value: `undef`.

#### `private_role_vars`

Optional.

Data type: Boolean.

Description: By default, variables from roles will be visible in the global variable scope. To prevent this, the following option can be enabled, and only tasks and handlers within the role will see the variables there

Default value: `undef`.

#### `error_on_missing_handler`

Optional.

Data type: Boolean.

Description: Controls if a missing handler for a notification event is an error or a warning.

Default value: `undef`.

#### `error_on_undefined_vars`

Optional.

Data type: Boolean.

Description: By default (as of 1.3), Ansible will raise errors when attempting to dereference Jinja2 variables that are not set in templates or action lines. Uncomment this line to revert the behavior to pre-1.3.

Default value: `undef`.

#### `no_log`

Optional.

Data type: Boolean.

Description: Prevents logging of task data, off by default.

Default value: `undef`.

#### `restrict_facts_namespace`

Optional.

Data type: Boolean.

Description: This keeps facts from polluting the main namespace as variables. Setting to True keeps them under the ansible_facts namespace, the default is False.

Default value: `undef`.

#### `deprecation_warnings`

Optional.

Data type: Boolean.

Description: Ansible may display deprecation warnings for language features that should no longer be used and will be removed in future versions.To disable these warnings, set the following value to False.

Default value: `undef`.

#### `network_group_modules`

Optional.

Data type: Tuple.

Description: This family of modules use an alternative execution path optimized for network appliances only update this setting if you know how this works, otherwise it can break module execution.

Default value: `undef`.

#### `accelerate_connect_timeout`

Optional.

Data type: Float.

Description: This setting controls the timeout for the socket connect call, and should be kept relatively low. The connection to the accelerate_port will be attempted 3 times before Ansible will fall back to ssh or paramiko (depending on your default connection setting) to try and start the accelerate daemon remotely. The default setting is 1.0 seconds.

Default value: `undef`.

#### `version`

Data type: String.

Description: Version of the ansible instalation.

Default value: `latest`.

#### `confdir`

Data type: String.

Description: Directory of configuration file.

Default value: `/etc/ansible`.

#### `package_name`

Data type: String.

Description: The name of package.

Default value: `ansible`.

#### `group`

Optional. Default user to ansible.

Data type: String.

Description: Default group of the user.

Default value: `root`.

#### `user`

Data type: String.

Description: Default user to ansible.

Default value: `root`.

#### `ensure`

Data type: String.

Description: Manage or unmanage Ansible.

Default value: `present`.

## Limitations

This module has been tested on:
  * Centos 6
  * Centos 7
  * Ubuntu 16.04
  * Ubuntu 14.04
  * Debian 8
  * Debian 9
  * Fedora 26
  * Oracle Linux
  * RedHat

## Development
Puppet modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. Please follow our guidelines when contributing changes.

For more information, see our [module contribution guide.](https://github.com/otherskins/puppet-ansible/blob/master/CONTRIBUTING.md)

## Contributors
* Edgar Silva - <edgarsilva948@gmail.com>
* Vincius Xavier - <viniciusxavierbove@gmail.com>

## Copyright
* Otherskins, Inc.
