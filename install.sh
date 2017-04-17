#!/bin/sh

PWD=$(pwd)

ln -sf $PWD/.tmux.conf ~/.tmux.conf
ln -sf $PWD/.spacemacs ~/.spacemacs
mkdir -p ~/.config/gtk-3.0 && ln -sf $PWD/gtk.css ~/.config/gtk-3.0/gtk.css
