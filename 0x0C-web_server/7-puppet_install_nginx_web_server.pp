package { 'nginx':
  ensure => installed,
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}

file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => '
    server {
      listen 80;
      server_name localhost;

      location / {
        root   /var/www/html;
        index  index.html;
      }

      location /redirect_me {
        return 301 http://example.com/newpage;
      }
    }
  ',
  require => Package['nginx'],
}

service { 'nginx':
  subscribe => File['/etc/nginx/sites-available/default'],
}
