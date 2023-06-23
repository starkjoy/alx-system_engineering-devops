# This script creates a manifest that kills a process named 'Killmenow'

exec { 'kill-command':
	command	=> 'pkill killmenow'
	onlyif	=> 'pgrep killmenow'
}
