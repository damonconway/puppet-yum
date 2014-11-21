# = Class: yum::repo::rpmforge
#
# This class installs the rpmforge repo
#
class yum::repo::rpmforge (
  $enabled    = 1,
  $mirror_url = undef
) {

  if $mirror_url {
    validate_re(
      $mirror_url,
      '^(?:https?|ftp):\/\/[\da-zA-Z-][\da-zA-Z\.-]*\.[a-zA-Z]{2,6}\.?(?:\/[\w~-]*)*$',
      '$mirror must be a Clean URL with no query-string, a fully-qualified hostname and no trailing slash.'
    )
    $baseurl    = $mirror_url
    $mirrorlist = undef
  } else {
    $osver = split($::operatingsystemrelease, '[.]')
    case $osver[0] {
      '6': {
        $baseurl   = 'http://apt.sw.be/redhat/el6/en/$basearch/rpmforge'
        $mirrorlist = 'http://apt.sw.be/redhat/el6/en/mirrors-rpmforge'
      }
      '5': {
        $baseurl   = 'http://apt.sw.be/redhat/el5/en/$basearch/rpmforge'
        $mirrorlist = 'http://apt.sw.be/redhat/el5/en/mirrors-rpmforge'
      }
      default: { fail('Unsupported version of Enterprise Linux') }
    }
  }

  yum::managed_yumrepo { 'rpmforge':
    baseurl       => $baseurl,
    mirrorlist    => $mirrorlist,
    descr         => 'RHEL $releasever - RPMforge.net - dag',
    enabled       => $enabled,
    gpgcheck      => 1,
    gpgkey        => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    gpgkey_source => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-rpmforge-dag',
    priority      => 30,
  }

}

