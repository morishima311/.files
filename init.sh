#!/bin/bash

# Directory which this script is in
SCRIPT_DIR=$(cd $(dirname $0); pwd)

echo "----Download molokai----"
git clone https://github.com/tomasr/molokai

echo "----copy molokai to ~/.vim/colors----"
mkdir -p ~/.vim/colors
cp ./molokai/colors/molokai.vim ~/.vim/colors/

echo "----make symbolic link of .vimrc to HOME----"
ln -sfi $SCRIPT_DIR/.vimrc $HOME/.vimrc
echo "----make symbolic link of .tmux.conf to HOME----"
ln -sfi $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf

echo "----append .bashrc to ~/.bashrc----"
if [ ! -e ~/.bashrc ]; then
    touch .bashrc
fi
cat $SCRIPT_DIR/.bashrc >> ~/.bashrc

echo "----copy rc to ~/.ssh/rc----"
cp ./rc ~/.ssh/

echo "----MY WORK IS DONE!----"
