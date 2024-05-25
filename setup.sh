#!/bin/bash

DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq stow silversearcher-ag

if [ -f ~/.gitconfig ]; then
  if [ -L ~/.gitconfig ]; then
    unlink ~/.gitconfig
  else
    rm ~/.gitconfig
  fi
fi

if stow --dir=files --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall
