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

echo "----ssh agent and tmux configuration----"
echo "
# renew SSH_AUTH_SOCK when attach tmux. added by \".files\"
agent=\"$HOME/.ssh/agent\"
if [ -S \"$SSH_AUTH_SOCK\" ]; then
    case $SSH_AUTH_SOCK in
    /tmp/*/agent.[0-9]*)
        ln -snf \"$SSH_AUTH_SOCK\" $agent && export SSH_AUTH_SOCK=$agent
    esac
elif [ -S $agent ]; then
    export SSH_AUTH_SOCK=$agent
else
    echo \"no ssh-agent\"
fi
" >> $HOME/.bashrc

echo "----MY WORK IS DONE!----"
