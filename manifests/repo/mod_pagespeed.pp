# = Class: yum::repo::mod-pagespeed
#
# This class installs the mod-pagespeed repo
#
class yum::repo::mod_pagespeed (
  $baseurl = 'http://dl.google.com/linux/mod-pagespeed/rpm/stable/$basearch',
  $enabled = 1
) {
  yum::managed_yumrepo { 'mod-pagespeed':
    descr          => 'mod-pagespeed',
    baseurl        => $baseurl,
    enabled        => $enabled,
    gpgcheck       => 1
  }
}
