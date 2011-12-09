class rvm::system($version='latest') {

  include rvm::dependencies

  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => "bash -c '/usr/bin/curl -s https://rvm.beginrescueend.com/install/rvm -o /tmp/rvm-installer ; chmod +x /tmp/rvm-installer ; rvm_bin_path=/usr/local/rvm/bin rvm_man_path=/usr/local/rvm/man . /tmp/rvm-installer --version ${version}'",
    creates => '/usr/local/rvm/bin/rvm',
    require => [
      Class['rvm::dependencies'],
    ],
  }

}
