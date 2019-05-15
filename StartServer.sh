#!/bin/bash

# Check if python or python3 is installed
if command -v python3 &>/dev/null; then
    export PIP_FOR_FMU_SERVER=pip3
    export PYTHON_FOR_FMU_SERVER=python3
else
    if command -v python &>/dev/null; then
       export PIP_FOR_FMU_SERVER=pip
       export PYTHON_FOR_FMU_SERVER=python
    else
       echo 'Please install python or python3 to run this script'
       exit
    fi
fi

# Check if pip is installed
if command -V $PIP_FOR_FMU_SERVER &>/dev/null; then
	#we make sure that pip is up to date
	$PYTHON_FOR_FMU_SERVER -m pip install --upgrade --user pip
    # Try to install virtualenv if not already installed
    $PIP_FOR_FMU_SERVER install --user virtualenv
	# Check if we are running onLinux or Windows to adapt the path of the source command
	unamestr=`uname`
	if [[ "$unamestr" == 'Linux' ]]; then
		PATH_VENV="./env/bin"
	else
		PATH_VENV="./env/Scripts"
	fi
    #Check if the virtual environment was already setup
    if ! [ -d $PATH_VENV ]; then
    	# Set up the virtual environment
    	$PYTHON_FOR_FMU_SERVER -m virtualenv env
		# Source the virtual environment
		source "$PATH_VENV/activate"
    	# Install docker-compose with pip in a virtual environment
		$PIP_FOR_FMU_SERVER install docker-compose
    else
		# Source the virtual environment
		source "$PATH_VENV/activate"
    fi
    # Start the server
    docker-compose up
else
    echo 'Please install $PIP_FOR_FMU_SERVER to run this script'
    exit
fi

