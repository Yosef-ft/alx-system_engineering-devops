#!/usr/bin/env bash
# Install nginx with puppet

package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => Package['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => "Hello World!\n",
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}

file { '/etc/nginx/conf.d/redirect_me.conf':
  ensure  => file,
  content => "location = /redirect_me {\n    return 301 /;\n}\n",
  require => Package['nginx'],
  notify  => Service['nginx'],
}
