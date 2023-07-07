# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx server
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
    server {
      listen 80;
      server_name localhost;

      error_page 404 /404.html;

      location = /404.html {
        root /var/www/html;
        internal;
      }

      location /redirect_me {
        return 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;
      }

      location / {
        root /var/www/html;
        index index.html index.htm;
        add_header X-Served-By $hostname;
      }
    }
  ",
}

# Enable the Nginx default site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  require => File['/etc/nginx/sites-available/default'],
}

# Set content for the custom 404 page
file { '/var/www/html/404.html':
  ensure  => file,
  content => "Ceci n'est pas une page",
}

# Restart Nginx service
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => [
    File['/etc/nginx/sites-enabled/default'],
    File['/var/www/html/404.html'],
  ],
}

