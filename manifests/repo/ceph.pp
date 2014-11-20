# = Class: yum::repo::ceph
#
# This class installs the official ceph repo
#
class yum::repo::ceph (
  $enabled = 1,
  $release = 'emperor'
) {

  yum::managed_yumrepo { 'ceph':
    descr          => "Ceph ${release} repository",
    baseurl        => "http://ceph.com/rpm-${release}/\$releasever/\$basearch",
    enabled        => $enabled,
    gpgcheck       => 1,
    failovermethod => 'priority',
    gpgkey         => 'https://ceph.com/git/?p=ceph.git;a=blob_plain;f=keys/release.asc',
    autokeyimport  => 'yes',
    priority       => 5,
  }

}
