# = Class: yum::repo::zabbix22
#
# This class installs the zabbix 2.2 repo
#
class yum::repo::zabbix22 (
  $enabled = 1
) {
  yum::managed_yumrepo { 'zabbix22':
    descr          => 'Zabbix 2.2 $releasever - $basearch repo',
    baseurl        => 'http://repo.zabbix.com/zabbix/2.2/rhel/$releasever/$basearch/',
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
    priority       => 1,
  }
}
