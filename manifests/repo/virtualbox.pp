# = Class: yum::repo::virtualbox
#
# This class installs the virtualbox repo
#
class yum::repo::virtualbox (
  $enabled = 1
) {

  yum::managed_yumrepo { 'virtualbox':
    descr          => 'RHEL/CentOS-$releasever / $basearch - VirtualBox',
    baseurl        => 'http://download.virtualbox.org/virtualbox/rpm/rhel/$releasever/$basearch',
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc',
    autokeyimport  => 'yes',
    priority       => 18,
  }

}
