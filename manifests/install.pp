class deployment-user::install {

  group { "deployment":
    ensure => present,
    name => "deployment",
  }

  user { "deployment":
    ensure => present,
    comment => "Login account for deployment",
    gid => "deployment",
    home => "/home/deployment",
    managehome => true,
    name => "deployment",
    shell => "/bin/bash",
    require => Group["deployment"],
    groups => ['adm','admin'],
  }

  file { "/home/deployment":
    ensure => directory,
    mode => 755,
    owner => "deployment",
    group => "deployment",
    require => User["deployment"],
  }

  file { "/home/deployment/.ssh":
    ensure => directory,
    mode => 700,
    owner => "deployment",
    group => "deployment",
    require => File["/home/deployment"],
  }

  file { "/home/deployment/.ssh/authorized_keys":
    ensure => present,
    mode => 600,
    owner => "deployment",
    group => "deployment",
    require => File["/home/deployment/.ssh"],
  }

  file { "/etc/sudoers.d/deployment":
    owner   => root,
    group   => root,
    mode    => 440,
    content => "deployment ALL=(ALL) NOPASSWD:ALL
",
    require => User["deployment"],
  }

  ssh_authorized_key { "deployment":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAxNJeGh7iLgMZxkahVMMtvEZLlGeZZM/wV3+sPoFMd7NiTWJCBhI7oO4fknJaJtxAYkVhdn+GxrJAXZsvbNw7KfCiGdBp2OGzIrFW14zwBpnPPVyOVfeAkZz1x35dDyp2LKH3xgp7knuggsA2n+hjQBCuYOZNRBwRZnlkNbSTIacYVufss8nD6EsfE4shg4Rky40MZocqmdLxEalqzyUYf10Mi5Yya/10gcjBZoM5KNYSCPKDYhBr7h7mz3n42LYMfsBYgEzhcvTxgWmEoa1bS40hQLzWWC89/jPBq6pDfF+ukx+efV5v58aEu7y8A1JuUc2sPC5J4eY5MD4ZnULqjQ==",
    name => "kaazoo@dellgen",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAmYimRuKNRtdNoyNnfHiyWOboq+WnX0T50w0Z+dtRcUWEtsTF1yMpROw+5tuHOM80DE4Bq8TXePCpH82cBUwhj0C4qPrmKf0JBxV8O+HHnhIoCxfgPAmRbWaHu1kj1/vkxEDX65Gww/mB4bTDfbCf2dy0a1B6loAi2p9o2KvykZb95sqeGwnLao3Hj7SNZt6w2pX9vWP8x2GI3iV9bvf10VXoPoZbJrYHS4nWzpTVJcAqoAHNVfYeLCJpLgLLpBPmURpqwix1p/5kZqWkkIvV2YEvANpxFAUAZLvExIBBrcbNk4ZWGh4+Xw3s2g3pMXSdgcdfOvtOynHRhN5zVVxafw==",
    name => "martin@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }




}

