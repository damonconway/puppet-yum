class yum::repo::rundeck2 (
  $baseurl = 'http://dl.bintray.com/rundeck/rundeck-rpm',
  $enabled = 1
){

  require yum

  yum::managed_yumrepo { 'rundeck-2-release':
    descr          => 'Rundeck 2 Release',
    baseurl        => $baseurl,
    gpgcheck       => 0,
    priority       => 80,
    failovermethod => 'priority',
    enabled        => $enabled,
  }
}
