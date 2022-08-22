# Defined Type: ansible::hosts
# =============================
#
# This defined type manage hosts configuration file.
#
#  Parameters
#  -----------
#  @param title - This parameter indicates the section of the ansible inventory file.
#  @param [Array] entrys - This parameter indicates the entries that should 
#appear in the indicated section.
#  
#  Examples
#  --------
#
#  ansible::hosts { 'databases':
#    entrys => [
#      '172.16.0.30',
#      '172.16.0.40',
#    ],
#  }

define ansible::hosts (
  Array[String] $entrys,
) {

  concat::fragment { $title:
    target  => "${ansible::confdir}/inventories/hosts",
    content => epp('ansible/hosts.epp',
      {
        section => $title,
        entrys  => $entrys,
      }),
  }

}
