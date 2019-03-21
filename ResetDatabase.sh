#!/bin/bash

  echo "Are you absolutely sure? This action cannot be undone. This will permanently delete the database for fmu-cloud-demo. Please type yes to confirm."
  read -n 3 -p "> " ans;

  case $ans in
    'yes')
	# Check if we are running on Linux or Windows to adapt the path of the source command
	unamestr=`uname`
	if [[ "$unamestr" == 'Linux' ]]; then
		PATH_VENV="./env/bin"
	else
		PATH_VENV="./env/Scripts"
	fi

	# Source the virtual environment
	source "$PATH_VENV/activate"

	# Stop the server
	docker-compose down -v
	;;
    *)
        exit;;
  esac



