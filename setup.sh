#!/usr/bin/env bash

DEBUG=${DEBUG:=0}


### Software Version ###

TERMINUS_VERSION="0.1.0"
ELKTAIL_VERSION="0.1.4"
SHELL2HTTP_VERSION="1.4"
GOTTY_VERSION="0.0.13"


### FUNCTIONS ###

function debug {
  if [ $DEBUG -eq 1 ]; then
    if [ $# -gt 0 ]; then
        echo "[$(date +"%D %T")] - DEBUG: $@"
    fi
  fi
}

function log {
  # If there are parameters read from parameters
  if [ $# -gt 0 ]; then
    echo "[$(date +"%D %T")] - INFO: $@"
  fi
}

function error {
  if [ $# -gt 0 ]; then
    echo "[$(date +"%D %T")] - ERROR: $@"
    fi
}

function start_build {
    mkdir -p ./bin
    cd bin
    WORKING=$(pwd)
}

function install_terminus {
    cd $WORKING
    wget -q -O - https://github.com/jtopjian/terminus/releases/download/v${TERMINUS_VERSION}/terminus.gz | gunzip -q > terminus
    chmod 755 terminus
}

function install_elktail {
    cd $WORKING
    wget -q -O - https://github.com/knes1/elktail/releases/download/v${ELKTAIL_VERSION}/elktail_linux_amd64.tar.gz | tar xzf -
    chmod 755 elktail
}

function install_shell2http {
    cd $WORKING
    wget -q -O shell2http.zip https://github.com/msoap/shell2http/releases/download/${SHELL2HTTP_VERSION}/shell2http-${SHELL2HTTP_VERSION}.amd64.linux.zip
    unzip -o shell2http.zip >/dev/null 2>&1
    rm -f shell2http.zip README.md LICENSE
    chmod 755 shell2http
}

function install_gotty {
    cd $WORKING
    wget -q -O - https://github.com/yudai/gotty/releases/download/v${GOTTY_VERSION}/gotty_linux_amd64.tar.gz | tar xzf -
    chmod 755 gotty
}

### MAIN ###

start_build
install_terminus
install_elktail
install_shell2http
install_gotty

