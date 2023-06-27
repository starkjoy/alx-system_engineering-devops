# Define the Nginx class
class nginx {
# Install the Nginx package
  package { 'nginx':
    ensure => installed,
  }
  
# Ensure the Nginx service is running and enabled
  service { 'nginx':
    ensure => running,
    enable => true,
    require => Package['nginx'],
  }
  
 # Define the Nginx configuration file
  file { '/etc/nginx/sites-available/default':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => template('nginx/default.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

# Define the index.html file
  file { '/var/www/html/index.html':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    content => 'Hello World!',
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}

# Apply the Nginx class
include nginx
