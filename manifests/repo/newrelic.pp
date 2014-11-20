# = Class: yum::repo::newrelic
#
# This class installs the newrelic repo
#
class yum::repo::newrelic (
  $baseurl = 'http://yum.newrelic.com/pub/newrelic/el5/$basearch/',
  $enabled = 1
) {

  yum::managed_yumrepo { 'newrelic':
    descr         => 'Newrelic official release packages',
    baseurl       => $baseurl,
    enabled       => $enabled,
    gpgcheck      => 1,
    priority      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-NewRelic',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-NewRelic'
  }
}
