#!/bin/bash
#description: start or resume a screen session
#usage: exec screen.sh #usually from within your .bash_profile so it happens on login
if [ -x /usr/bin/screen ]; then
	HAVE_SCREEN=$(screen -ls | grep -c "There is a screen");
	if [ "1" = "$HAVE_SCREEN" ]; then
	        echo "resuming screen in 2"
	        sleep 2
	fi
	exec screen -dR
else
  exec bash -l
fi
