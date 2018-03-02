# This file setup configuration for installation.
# It is supposed to be sourced in prepsrc.sh and install.sh
# It sets a set of configuration variable to decide these script to what, where and how to install.

# Default value of installation location (prefix) where source code need to be downloaded.
# Can be overriden with second argument of script install.sh
INSTALL_PATH="$HOME/local"
# Default value of location where source code need to be downloaded.
# Can be overriden with first argument of script prepsrc.sh/install.sh
SRC_PATH="$INSTALL_PATH/src"
# Default value of variable to decide whether to stow the application or not.
# STOW_IT=[ yes | no ]
STOW_IT=no


# Config to specify how to download source
# DOWNLOAD_METHOD=[ git | wget ]
DOWNLOAD_METHOD='wget'
# Config to specify if any extraction need to be done to get source directory
# DOWNLOAD_TYPE=[ 'direct' | '.tar.gz' | 'tar.bz2' ]
# direct=Source download itself creates source directory (like in case of git)
# Otherwise specify download file type extension
DOWNLOAD_TYPE='.tar.gz'

# Source directory name. This is name of the downloaded application excluding 
# file name extension (i.e. excluding $DOWNLOAD_TYPE)
SRC_NAME=texinfo-6.5
DOWNLOAD_NAME=${SRC_NAME}${DOWNLOAD_TYPE}
DOWNLOAD_LOCATION='https://ftp.gnu.org/gnu/texinfo/'

# Name of the src directory can be changed by modifying following.
# Otherwise leave it unchanged. It will use the the directory name $SRC_NAME
SRC_DIR_NAME=${SRC_NAME}_ll

# Location of lib/functionLib.sh relative to this file
FUNCLIB="functionLib.sh"
#FUNCLIB="../../lib/functionLib.sh"


