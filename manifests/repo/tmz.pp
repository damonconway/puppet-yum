# = Class: yum::repo::tmz
#
# This class installs the tmz repo
#
class yum::repo::tmz (
  $enabled        = 1,
  $enabled_source = 0
) {

  yum::managed_yumrepo { 'tmz-puppet':
    descr          => 'Puppet for EL $releasever - $basearch',
    baseurl        => 'http://tmz.fedorapeople.org/repo/puppet/epel/$releasever/$basearch',
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://tmz.fedorapeople.org/repo/RPM-GPG-KEY-tmz',
    priority       => 16,
  }

  yum::managed_yumrepo { 'tmz-puppet-source':
    descr          => 'Puppet for EL $releasever - Source',
    baseurl        => 'http://tmz.fedorapeople.org/repo/puppet/epel/$releasever/SRPMS',
    enabled        => $enabled_source,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://tmz.fedorapeople.org/repo/RPM-GPG-KEY-tmz',
    priority       => 16,
  }

}
