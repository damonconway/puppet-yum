# = Class: yum::repo::repoforge
#
# This class installs the repoforge repo
#
class yum::repo::repoforge (
  $enabled    = 1,
  $mirror_url = undef
) {

  if $mirror_url {
    validate_re(
      $mirror_url,
      '^(?:https?|ftp):\/\/[\da-zA-Z-][\da-zA-Z\.-]*\.[a-zA-Z]{2,6}\.?(?:\/[\w~-]*)*$',
      '$mirror_url must be a Clean URL with no query-string, a fully-qualified hostname and no trailing slash.'
    )
    $baseurl = $mirror_url
  } else {
    $baseurl = 'http://apt.sw.be/redhat/el$releasever/en/$basearch/rpmforge'
  }

  yum::managed_yumrepo { 'repoforge':
    descr         => 'RepoForge packages',
    baseurl       => $baseurl,
    enabled       => $enabled,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    priority      => 1,
    exclude       => 'nagios-*',
  }

}
