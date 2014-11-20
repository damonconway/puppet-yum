# = Class: yum::repo::passenger
#
# This class installs the passenger repo
#
class yum::repo::passenger (
  $baseurl    ='http://passenger.stealthymonkeys.com/rhel/$releasever/$basearch',
  $enabled    = 1,
  $mirrorlist ='http://passenger.stealthymonkeys.com/rhel/mirrors',
) {

  yum::managed_yumrepo { 'passenger':
    descr          => 'Red Hat Enterprise $releasever - Phusion Passenger',
    baseurl        => $baseurl,
    mirrorlist     => $mirrorlist,
    enabled        => $enabled,
    gpgcheck       => 0, # To fix key autoimport
    failovermethod => 'priority',
    gpgkey         => 'http://passenger.stealthymonkeys.com/RPM-GPG-KEY-stealthymonkeys.asc',
    autokeyimport  => 'yes',
    priority       => 20,
  }

}

