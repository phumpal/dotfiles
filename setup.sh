#!/bin/bash

sudo apt-get install -y stow silversearcher-ag

if stow --dir=files --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/plugin/Vundle.vim
vim +PluginInstall +qall
