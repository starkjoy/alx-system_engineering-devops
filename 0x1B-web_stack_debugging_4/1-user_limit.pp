# Enable the user holberton to login and open more files without file limit errors

# Increases the hard limit for Holberton user
exec { 'increase-hard-limit':
	command	=> 'sed -i "#holberton hard#s/5/50000/" /etc/security/limits.conf',
	path	=> ['/usr/local/bin', '/bin/'],
}


# Increases the soft limit for Holberton user
exec { 'increase-soft-limit':
	command	=> 'sed -i "#holberton soft#s/4/5000/" /etc/security/limits.conf',
	path	=> ['/usr/local/bin', '/bin/'],
}
