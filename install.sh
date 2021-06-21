#!/bin/bash

# Directory which this script is in
SCRIPT_DIR=$(cd $(dirname $0); pwd)

VIMRC=~/.vimrc
TMUX_CONF=~/.tmux.conf
SSH_CONFIG=~/.ssh/config
SSH_RC=~/.ssh/rc

array=($VIMRC $TMUX_CONF $SSH_CONFIG $SSH_RC)
abort=false

# check if files exist
# if yes, installation will be aborted
for i in "${array[@]}"
do
    if test -f $i; then
        echo "$i"
        abort=true
    fi
done

if $abort ; then
    echo 'Configuration files already exist. Installation aborted.'
    exit
fi

echo "==> Download molokai"
git clone https://github.com/tomasr/molokai
echo "==> Download Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "==> Download vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "==> Copy molokai to ~/.vim/colors"
mkdir -p ~/.vim/colors
cp $SCRIPT_DIR/molokai/colors/molokai.vim ~/.vim/colors/

echo "==> Copy .vimrc to home directory"
cp $SCRIPT_DIR/.vimrc ~/
echo "==> Copy .tmux.conf to home directory"
cp $SCRIPT_DIR/.tmux.conf ~/
echo "==> Copy config to ~/.ssh/ directory"
cp $SCRIPT_DIR/config ~/.ssh/
echo "==> Copy rc to ~/.ssh/ directory"
cp $SCRIPT_DIR/rc ~/.ssh/

# ~/.bashrc
if grep -q "rmkm/dotfiles" ~/.bashrc
then
    # Found
    # Do nothing
    :
else
    # Not found
    echo "==> Append .bashrc to ~/.bashrc"
    if [ ! -e ~/.bashrc ]; then
        touch .bashrc
    fi
    cat $SCRIPT_DIR/.bashrc >> ~/.bashrc
fi

echo "==> Install vim plugings"
vim -c PlugInstall -c q -c q ~/.vimrc

source ~/.bashrc

echo "---- MY WORK IS DONE! ----"
