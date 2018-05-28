#!/bin/bash

#This script initialize vimrc setting

# Directory that this script is in
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# Set symbolic link of .vimrc to home directory
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc

