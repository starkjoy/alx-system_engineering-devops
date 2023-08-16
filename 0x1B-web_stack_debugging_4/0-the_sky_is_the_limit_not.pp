# Configures Ngnix Server to increase Traffic limits of web server

# Increase the ULIMIT of the nginx default file
exec { 'ULIMIT-value-increased':
	command => 'sed -i "s/15/4096/" /etc/default/nginx',
	path	=> '/usr/local/bin/:/bin/'
} ->

# Restart Nginx
exec { 'nginx-restart':
	command	=> 'nginx restart',
	path	=> '/etc/init.d/'
}
