#!/bin/bash

DOTS=~/.dotfiles/

while read line; do

case $1 in
    link)
        ln -svf ${DOTS}${line};;
    print|*)
        echo $line;;
esac

done <<LINKS
i3 $HOME/.config/i3/config
i3status $HOME/.config/i3status/config
zshrc $HOME/.zshrc
xmodmap $HOME/.xmodmap
vimrc $HOME/.vimrc
Xdefaults $HOME/.Xdefaults
LINKS
