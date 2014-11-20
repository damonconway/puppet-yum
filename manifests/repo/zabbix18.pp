# = Class: yum::repo::zabbix18
#
# This class installs the zabbix 1.8 repo
#
class yum::repo::zabbix18 (
  $enabled = 1
) {
  yum::managed_yumrepo { 'zabbix18':
    descr          => 'Zabbix 1.8 $releasever - $basearch repo',
    baseurl        => 'http://repo.zabbix.com/zabbix/1.8/rhel/$releasever/$basearch/',
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX',
    priority       => 1,
  }
}
