# Client configuration file with Puppet
include stdlib

file_line { 'Declare identity file':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => '    IdentityFile ~/.ssh/school',
  match   => '^[#\s]*IdentityFile\s+\~\/\.ssh\/school',
  replace => true,
}

file_line { 'Turn off passwd auth':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => '    PasswordAuthentication no',
  match   => '^[#\s]*PasswordAuthentication',
  replace => true,
}