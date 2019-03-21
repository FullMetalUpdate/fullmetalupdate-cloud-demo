#!/bin/bash

# Check if we are running onLinux or Windows to adapt the path of the source command
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	PATH_VENV="./env/bin"
else
	PATH_VENV="./env/Scripts"
fi

# Source the virtual environment
source "$PATH_VENV/activate"

# Stop the server
docker-compose stop

