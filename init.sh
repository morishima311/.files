#!/bin/bash

#This script initialize vimrc setting

# Directory that this script is in
SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "Download molokai"
git clone https://github.com/tomasr/molokai

# error occur
if [ $? != 0 ]; then exit; fi

echo "copy molokai to ~/.vim/colors"
mkdir -p ~/.vim/colors
cp ./molokai/colors/molokai.vim ~/.vim/colors/

echo "make symbolic link of .vimrc to ~"
ln -s $SCRIPT_DIR/.vimrc $HOME/.vimrc
