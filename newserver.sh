#!/bin/bash
#description: throwing scripts and keys onto a new server
#usage: newserver.sh servername.mathforum.org
server=$1
if [ -z "$server" ]; then
	echo "what server?"
	exit 1
fi
echo ">${server}<"
scp -r ~/.ssh/ ~/scripts/ $1:
ssh $1 "echo 'exec ~/scripts/screen.sh' >> ~/.bash_profile"
