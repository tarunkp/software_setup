#!/usr/bin/env bash

# This script download and prepare code to be compiled for the given 
# version of the application/utility.
# The information needed by this script is provided through config.sh

source config.sh

if [ ! -r "$FUNCLIB" ] ; then # Function library path is not readable 
    echo >&2 "Error: Setup issue, file $FUNCLIB is not readable"
    exit 1
fi
source "$FUNCLIB"

# Try to create directory where source need to be downloaded.
# If directory already exists, check if user has permissions to download source.
checkDir $SRC_PATH

# Download source code from repository.
getSrc

# Extract source from zip/tar files.
extractSrc



