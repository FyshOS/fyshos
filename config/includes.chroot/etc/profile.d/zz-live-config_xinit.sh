#!/bin/bash

if [ -z "${DISPLAY}" ] && [ $(tty) = /dev/tty1 ]
then
	while true
	do
		if grep -qs quiet /proc/cmdline
		then
			startx > /dev/null 2>&1
		else
			startx
		fi
	done
fi
