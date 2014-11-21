# = Class: yum::repo::remi
#
# This class installs the remi repo
#
class yum::repo::remi (
  $enabled      = 1,
  $enabled_test = 0
) {
  yum::managed_yumrepo { 'remi':
    descr          => 'Les RPM de remi pour Enterpise Linux $releasever - $basearch',
    mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror',
    enabled        => $enabled,
    gpgcheck       => 1,
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-remi',
    priority       => 1,
  }

  yum::managed_yumrepo { 'remi-test':
    descr          => 'Les RPM de remi pour Enterpise Linux $releasever - $basearch - Test',
    mirrorlist     => 'http://rpms.famillecollet.com/enterprise/$releasever/test/mirror',
    enabled        => $enabled_test,
    gpgcheck       => 1,
    gpgkey         => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    gpgkey_source  => 'puppet:///modules/yum/rpm-gpg/RPM-GPG-KEY-remi',
    priority       => 1,
  }
}
