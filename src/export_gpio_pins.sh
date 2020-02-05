#!/usr/bin/env bash

### BEGIN INIT INFO
# Provides:          gpio_setup
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: exports gpio pins for 2 sonars.
# Description:       exports gpio pins for 2 sonars.
### END INIT INFO

case "$1" in
    start)
	# to run as non root using wiringPiSetupSys we
	# need to export the gpio pins (BCM pin numbering).
	# see http://wiringpi.com/reference/setup/
	gpio export 200 out # pin 16
	gpio export 201 in	# pin 18
	gpio export 1 out	# pin 22
	gpio export 67 in	# pin 24
	;;
    stop)
	gpio unexportall
	;;
    *)
	echo "unknown command"
	exit 1
	;;
esac

