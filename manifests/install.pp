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

  ssh_authorized_key { "deployment_kaazoo":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAxNJeGh7iLgMZxkahVMMtvEZLlGeZZM/wV3+sPoFMd7NiTWJCBhI7oO4fknJaJtxAYkVhdn+GxrJAXZsvbNw7KfCiGdBp2OGzIrFW14zwBpnPPVyOVfeAkZz1x35dDyp2LKH3xgp7knuggsA2n+hjQBCuYOZNRBwRZnlkNbSTIacYVufss8nD6EsfE4shg4Rky40MZocqmdLxEalqzyUYf10Mi5Yya/10gcjBZoM5KNYSCPKDYhBr7h7mz3n42LYMfsBYgEzhcvTxgWmEoa1bS40hQLzWWC89/jPBq6pDfF+ukx+efV5v58aEu7y8A1JuUc2sPC5J4eY5MD4ZnULqjQ==",
    name => "kaazoo@dellgen",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_rasca":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAtc77hEN+5rCv9hCLIwtpHnAsv0NV7kCl/l2Y7aAOXFQ933b66h8Pnn1vMjVruAfUKlBWJq3CKPWTXK3FnUOVgcXkzzRzKq8hGPpLUHWHcj/yXi5YgOHMUIAyAggaD6HK26QGN9vL9BHpOd4j4DsmuGnWqskrcK0k5cv0Fhrv/2pHV4tdwy4CMVzv+YEfv/t2BKcK3zU1zLUNOd+RrbsMjYBvlMjKRCcfO8+ro/O5w3Ds7g/Rh+NRqLUs54UZ5G/kJ1z3VNv+PTEnwLNzF4ZibGd9AlXmF2qclc+7BD82q0UfHnAMr0lP3RH6QM9EZ4oQqZ+GXoLWS/QpAG8/MbuveQ==",
    name => "rasca@catwoman",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_chris":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAADAQABAAACAQDOUNlUYqXRFG7gpozaimz1GhY62qwj0pen+b94CN+WwWVfhSiJeNYRgra3fEIVsBo8wfCMEuKB5HHtJAUngt/duxzDzRNo/Unv79muLOJ3jpGlIIPQOocX9qfZX0TQfGkjyc1vJd+SesD7z4zPQEtTAbUO27xmylqVtvbpypx7dA2QiRk1egKbitju1ZD/6HC9imnlRJlOqG3h2fEtjRoTpLLskn17u3Sdoz/nIjNf/abLDeN7gc5gxDq9utnL1fJsk/lT6U/PDBY84OBFuub3Cm8pJKhyWx5xhvoiwm5oIvkBNXbw3+5JYxtoknfkY9ruX8u9BOoCIdnYJTW7PqHT7Fk1uhC/bW8gJa4XQ/u5b+lihqYfVLTgxflng+jaoH41QPNJsBpmFdVqDFYr1Ahdh6U06iBpv1gttE+BWvcyxMZnk7lqEfAXZANDDqGvohmbGajO0J8nLC0jgYICOoL/ztNobdDPWnltLaYBr9yzwxuUZG1Q8L/HLheetpW8fHe9Uz4Sxi7NrJuH/V9vfJKyXkcfi8jjpgWQUzAJQcymMztfyOtOEdf6nvzBNks4kQpW7K/4w6eNBVDGXmvSR5Ck8/l+dKXJyZ4P/RFQG71igJn0/eEdY8+toBiqDNrRz1Fbnnn9EZkMScF6uj630zDS9ZY4k5m6edzWFj6uT05z1w==",
    name => "chris@corax-2.local",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_becks":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABJQAAAgBx+TUiBOEvvJZ4ERSZftoN6lVhE++8SQcJ1jxt5f6FvJwH59TTnV5qySzRY38uBoG2Pws+UsLaDK68Gun9fW5KDvb8bPNIalFYYMZzlMLkd2qA/GJEaLlpD8VDoIr7r73u3WJUUKqlG8SF0ImbT283aX6pf+F0Vh+bdoPoepQ3NbJko/zJMXc1EC0ZWzFDbwzm9m3tdp6VZScOvDGa2fg0uIcBkFIyMXnp458i2YtRZ0uFBP/VcVmKeRSJCqz8NNxaMBUMgOp+IyRUpBp6pxbXYPPa7vPOAHZitqDUoajbj1DYl4vlGMIOYgcx3CA8wr8MqGsUPvGbrPGOUCm4UncYw99e2OUvnPBlP3R+R/SG6RBadvtWjcPP7XkOBfJ4oBk1u24juQoIlkR4nCz7zXSsR6Z8x73PPTJ1XWdOUnxmpF7tlTT+BNHp9fb84cnF9W9uc0wao8L1r3bOdSRX0trN2WE7jah1s5qFtVJPaX78b3UXyl2mFnqkCHxT1Y0e3z0xfmPywtc3d2S0qr0K+0GfHzxqDe2lisypesvx8Eh0faJ3nMMwBcsC7V+ZPocKykuCWV8bpxhvknZYZuTRsR7KGrppIVDe9RZTCZ9A9uWl2Kuf1xbDJn+wVfntVHTUg/FXu8urmp0KBuJ2c4Y2eIVLx0n/JAClSaB+9qrUUAFzAw==",
    name => "becks@bici.local",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_martin":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAmYimRuKNRtdNoyNnfHiyWOboq+WnX0T50w0Z+dtRcUWEtsTF1yMpROw+5tuHOM80DE4Bq8TXePCpH82cBUwhj0C4qPrmKf0JBxV8O+HHnhIoCxfgPAmRbWaHu1kj1/vkxEDX65Gww/mB4bTDfbCf2dy0a1B6loAi2p9o2KvykZb95sqeGwnLao3Hj7SNZt6w2pX9vWP8x2GI3iV9bvf10VXoPoZbJrYHS4nWzpTVJcAqoAHNVfYeLCJpLgLLpBPmURpqwix1p/5kZqWkkIvV2YEvANpxFAUAZLvExIBBrcbNk4ZWGh4+Xw3s2g3pMXSdgcdfOvtOynHRhN5zVVxafw==",
    name => "martin@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_andreasm":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEAo41E4Nyvefg1XutPGpccLg3IT9PESEtyGJHb7eIC8nE15l/fHYX/ZfulHf/gJfUxa+bNMBrUCJlzsbqSeJ6eSDyZ8hz27G7Sl4+ieOIgSXn6hD9eG8s9/9LLYrLRiJM2nP8yXY4JAHxG+jHeEr/YB7RH68OMnL1ac1SmVgkRayg37Tvwn1zSmrIoKCk7RCzr4AoBkVhTToO5P5ypU9osx6rcpW+HBX0ASQuCmedK1C6jLk+f04WL/ZjUv6pQwcrOdidyrljMMuPF08UXkWF9l8Sy1SAglISbL6/dND1C5ypnfs5Nvjkkx7QFoPToxuvo+gGlPlVIKYB//WtTcqeTUw==",
    name => "andreasm@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_kristine":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAgEAvo0vAjpd/3JQwo5aHFvXH6aCtx75EsGfXGBdJoKs5SveqM9d8d0AU4FMhPybj/e4D80TFvct0P51PYBHYH1sCIcCDb6g2qztQoYVj5BlEZ4E60PmkM3Y/2XNGE45d0z8oFN/52yrJ6E4ZviCNk0uy6Hu2ch/BW2gFOjLg6Id8i9lhU0JwKaxO6Mdrv5GG22AJYO0W8/UAVy1UnZ7848fSM3q4H4xp40sGCzPHpQymr9Hf5k47c/PqxCTfwLw68k2IvA6iKdiaXKF6bz8+7QaAOQ8v2q4ZY/NSae5Q8E7MxB5wWirb+LtBq5en6IVz8JxQhL5gLyHK5RSPK7MeH1bEf/cuf0xzx4NLSf7Jl9GWjaaczjFUNJq8M7R4L1Oc53uHPOSfe0FVj14M082jtNaI2FSo1cP/sxqdSNOtPK/r2a29BsK4EkytyndaRCCizbAhoQafh8Ws92v/WGls+FG6HikdnHu8JhrPMXRo2EvVKZnhujpX5fGtVcxVhGlB1e4vvaboIz9a/x4PU4UF47gA80nfGPG7ZAw5eGLdRMupRjfO+3xUQaB+/lShfZEmJdTUIGa4FTqXGK60T1w3SivPhB65zPZ5np5qvMqr1yQfsc6tpilEhtFcQM7HdSiZO+cFMMzdpcnM80DWFnwxQ8yWqp5jFQBpYa4jpXHPYPYZp8=",
    name => "kristine@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_pavel":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA1sQ+GTcXvpAm01iu4knisrIgj3gKsq2iZDCGBmSGdPF6MDM3zylTXf4nTGgcQwj/f2X9CMliiPBzH5DPXhq4hMTj/hvFQwrZbME+uwLfMPY35VcK/Mqke/DOiY4tlr0cuRKL0WrVR94Rb8wHQ+FL+XqMoflSYKMtCTrb/qTwOXruBTgxxMmQxsHyL3bEqALCPnggTlUsy03ZwyaUWrgGUyYv3SU8gy5nbS6nZhzxTRobSSciqvYmbGsNFDoXacHo7JI1tlA6/aZGGF8IXZDRj7X3k6TmMkFvR0qzEE7pLI8PyaIjC/4JHriiEZZOzaRY32plpsNiqrUyj94EzqPnVw==",
    name => "pavel@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_patrickj":
    ensure => present,
    key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQDaRLrzRARVYhjYv6PTYf90npg5m/qOz6/zToKOsg1ABoOJKYJ9Deys8Ndu6q8u+VAPDdbkpr6rHKma/tYrPIGK0VHUG4gMP1tP/EYN22pl1IkcojLl71YRUL/CgARuMtP0jdy8UVqlkH3ZEhRVV3WIRvu4aNGHI52vCHiCl0yPuqiB4blaa3mWbY/6FIhWB9q4wyXI4vj/0Bw20mVY9mhg5iyXOndHAM7FCRKiMH19nkA/5t6hFXiglnHruSJ170tr1ontRZnw1eSA3xZKMjw/Q03HmopeUMPwJUtTR0/ZftALpDV4rkDqCPfKpG7/7S8vwnkEmrco7SpwDPKQjj61",
    name => "patrickjuchli@gmail.com",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_mirko":
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCnnsYCzgr9s7/dB5KfUYF24tFCwyFWFfxt03Rx2CA3bZMLNclQLZLg1nInvyJU8kyzOIa+U7TuNvoiKl8dvsNjagruSEbLaneo01ReqDLRvKUc4Oyf+pYzqDxkwYkpoE3LGnRCcfVvQ9kAUpW7M1aGa4bWIivkGU5XvWf+RPH1KcR8XvWml8navlu35Ro4mzc9PxVOAI2/CORgO7F57CaVHwdeF+zRlHzw8cLCU37BOwiM/U8ok8n2lcQR/AZQd+dJyz5UX5365PhOnpF0vTC1Pywi0riJ/6yXfJp6AGZM3qMdB0u8xi6vsMLTCa2uJqOcLeh6sSB1B8eoiLIzwUGh',
    name => "mirko@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_jense":
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDSdPizBEfcGTh1vNV8PvtGZljFfloj4YlNK9TAT/NL/N8Q4fUsAuX02sZplmwJwBnJXLRREC/C8YEmi8noCH3LPKgqhLZk/sV0fVlObz1swTWcCR4MbljGuobtkxom5hoh9Z6VptXh29pMqHWgeI0w43LVPhBR/aNvhHmV8A58648q74+UNzc2o+p/wov0O/dbX3upLW966VtCWTKwH/wR7OLN0ru9zXNy7zZQpnj6XEqRQcQR3qfOcpKSeDjkOvO/6DXgEurSYAXVTesiFyW/vL6AXMO4QmxfD/OG/DrJTraJIZLcrErFgGZoBG1javhU74+u8neju4uvRdW4R6SB',
    name => "jense@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

   ssh_authorized_key { "deployment_nico":
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEA16A1HT1Egu1xN3FmZ1vxh8AFGD/N20hZS+05XROmlFH21J7WBB1MebNxmEsIPfPGNXGCKC5hnQ5Balq6TeGjtJ33ti8WjlRfc+iq3SEOwL2uWUvtAS1QSwTXkyzRx3Gz+gZ2p3msCBqJc4v5IK6QeCHcB8gtahaZSTNk53hiW+69aDOGAyFH+8rHF0BHIeiSndjn/Fi+zFpb4h4exHbfdgg/6ozFh570mfAsYwPqNEvZ851BZozkhSe+22fy9/jvYb6DrSMZ4FMCHtFBIbte+kFoTM41bnEK3vbtfC2zzJYpUx5R686I1mZAUaBWlI0Un5meoHbQ2VtdNHBR2PCIYQ==',
    name => "nico@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

  ssh_authorized_key { "deployment_fabian":
    ensure => present,
    key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAw2HXgxXRpNdauBTnsPLBizmBNtnngr8dfjZ5dfxBTVQ86MYhKIG6zOMpIDjbK1u/R0y4pErARnv+dvDXt3FGRa2WfBBaEa3v9Bldf+GAg2kUC76LFjik4/MU3CNP5nMmfFAvgdVfAbl9m5A0PjEZNvjd06h2oJxVADAJm4siSybgr+0Acxp3xSUwGZtqWiIGl85wnW6geWsGwAmgELVmtNtA2pG86fWYa4k2y93OHehgVvXqlyr1HsMbjbcxhy3yS8vQDTQgij6YuxN3sNNJzd9KM6xdg6ru+Gu0Ci41zj3VvkU5qjf4bJ/AhE5TYa79H7zxhKGgdBsmMEkA6Vca/Q==',
    name => "fabian@artcom.de",
    type => "ssh-rsa",
    user => "deployment",
    require => File["/home/deployment/.ssh/authorized_keys"],
  }

}

