# = Class: yum::repo::zabbix20
#
# This class installs the zabbix 2.0 repo
#
class yum::repo::zabbix20 (
  $enabled = 1
) {
  yum::managed_yumrepo { 'zabbix20':
    descr          => 'Zabbix 2.0 $releasever - $basearch repo',
    baseurl        => 'http://repo.zabbix.com/zabbix/2.0/rhel/$releasever/$basearch/',
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
    priority       => 1,
  }
}
