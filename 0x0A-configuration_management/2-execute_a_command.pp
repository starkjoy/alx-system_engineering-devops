# This script creates a manifest that kills a process named 'Killmenow'

exec { 'pkill -f killmenow':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}
