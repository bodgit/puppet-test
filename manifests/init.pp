#
class test {

  file { '/tmp/test':
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0644',
    content => "This is a test\n",
  }

  exec { 'echo hello':
    path        => ['/usr/bin', '/bin'],
    refreshonly => true,
  }
}
