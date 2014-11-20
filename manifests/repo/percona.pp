# = Class: yum::repo::percona
#
# This class installs the Percona RPM Repository
#
class yum::repo::percona (
  $enabled    = 1,
  $mirror_url = undef
) {

  if $mirror_url {
    validate_re(
      $mirror_url,
      '^(?:https?|ftp):\/\/[\da-zA-Z-][\da-zA-Z\.-]*\.[a-zA-Z]{2,6}\.?(?:\/[\w~-]*)*$',
      '$mirror must be a Clean URL with no query-string, a fully-qualified hostname and no trailing slash.'
    )
    $baseurl = $mirror_url
  } else {
    $baseurl = 'http://repo.percona.com/centos/$releasever/os/$basearch/'
  }

  yum::managed_yumrepo { 'percona':
    descr          => 'Percona RPM Repository (http://www.percona.com/percona-lab.html)',
    baseurl        => $baseurl,
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'http://www.percona.com/downloads/RPM-GPG-KEY-percona',
    priority       => 1,
  }
}
