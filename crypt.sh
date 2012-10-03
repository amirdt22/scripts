#!/bin/bash
#description: prints out the crypted string
#usage: crypt.sh asdf AB #encrypt 'asdf' with salt 'AB'
perl -e "print crypt('$1', '$2');"
