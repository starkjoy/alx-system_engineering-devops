#Sets up configuration file
file { '~/.ssh/config':
	ensure	=> 'file'
	owner	=> 'vagrant'
	group	=> 'vagrant-group'
	mode	=> '0600'
	content	=> "Host target_server\n\
		HostName 54.82.115.80\n\
		User ubuntu\n\
		IdentityFile ~/.ssh/school\n\
		PasswordAuthentication no\n",
}
