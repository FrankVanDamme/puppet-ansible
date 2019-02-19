# PRIVATE CLASS: do not use directly
class ansible::repo::yum (
  Integer $epel_version
) {

  if ! defined(Yumrepo['epel']) {
    yumrepo { 'epel':
      ensure         => 'present',
      descr          => "Extra Packages for Enterprise Linux ${epel_version} - \$basearch",
      enabled        => '1',
      failovermethod => 'priority',
      gpgcheck       => '1',
      gpgkey         => "https://archive.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-${epel_version}",
      mirrorlist     => "https://mirrors.fedoraproject.org/metalink?repo=epel-${epel_version}&arch=\$basearch",
    }
  }
}
