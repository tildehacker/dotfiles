#!/usr/bin/env bash

if nmcli radio wifi | grep enabled > /dev/null
then
	nmcli radio wifi off
else
	nmcli radio wifi on
fi
