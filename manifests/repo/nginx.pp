# = Class: yum::repo::nginx
#
# This class installs the nginx repo
#
class yum::repo::nginx (
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
    $osver   = split($::operatingsystemrelease, '[.]')
    $baseurl = "http://nginx.org/packages/rhel/${osver[0]}/\$basearch/"
  }

  yum::managed_yumrepo { 'nginx':
    descr    => 'Nginx official release packages',
    baseurl  => $baseurl,
    enabled  => $enabled,
    gpgcheck => 0,
    priority => 1,
  }

}
