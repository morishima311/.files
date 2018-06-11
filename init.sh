#!/bin/bash

#This script initialize vimrc setting

# Directory that this script is in
SCRIPT_DIR=$(cd $(dirname $0); pwd)

# download molokai
git clone https://github.com/tomasr/molokai
mkdir -p ~/.vim/colors
cp ./molokai/colors/molokai.vim ~/.vim/colors/

# Set symbolic link of .vimrc to home directory
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc
