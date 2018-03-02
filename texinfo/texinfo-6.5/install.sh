#!/usr/bin/env bash

# This install script assume that it is run in its parent directory.

source config.sh

if [ ! -r "$FUNCLIB" ] ; then # Function library path is not readable 
    echo >&2 "Error: Setup issue, file $FUNCLIB is not readable"
    exit 1
fi
source "$FUNCLIB"

messageHighlited Installing $SRC_NAME ...

checkDir $INSTALL_PATH create_if_not_exists
SRC_DIR="${SRC_PATH}/${SRC_DIR_NAME}"
checkDir $SRC_DIR

echoExec cd ${SRC_DIR}

# Generate configure script if does not exists
if [ ! -r ./configure ]; then
    autoreconf -iv
fi

# Configure
./configure --prefix=$INSTALL_PATH

# Build
make PREFIX=$INSTALL_PATH
exit

# Install
if [ $STOW_IT == "yes" ]; then
    make install prefix=$INSTALL_PATH/stow/$SRC_DIR_NAME
else
    make install
fi


