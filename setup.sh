#!/bin/bash

DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq stow silversearcher-ag

if stow --dir=files --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi

if [ ! -d ~/.vim/plugin/Vundle.vim ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
