#!/bin/bash

VIMRC=~/.vimrc
TMUX_CONF=~/.tmux.conf
SSH_CONFIG=~/.ssh/config
SSH_RC=~/.ssh/rc
BASH_RC=~/.bashrc

SIGNATURE="rmkm/dotfiles"

array=($VIMRC $TMUX_CONF $SSH_CONFIG $SSH_RC)

for file in "${array[@]}"
do
    echo "$file"
    if test -f $file; then
        if grep -q $SIGNATURE $file; then
            echo "==> Remove $file"
            rm $file
        fi
    fi
done

if test -f $BASH_RC; then
    echo "==> Remove inserted lines in $BASH_RC"
    sed -i ':lbl1;N;s/\n#rmkm\/dotfiles begin.*#rmkm\/dotfiles end//;b lbl1;' $BASH_RC
fi

echo "---- MY WORK IS DONE! ----"
