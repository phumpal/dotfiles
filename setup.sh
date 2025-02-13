#!/bin/bash

if [ $(uname) == 'Linux' ]; then
  DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq stow silversearcher-ag
  sudo apt-get update && sudo apt-get install --only-upgrade golang
fi

if [ -f ~/.gitconfig ]; then
  if [ -L ~/.gitconfig ]; then
    unlink ~/.gitconfig
  else
    rm ~/.gitconfig
  fi
fi

if stow --dir=files --override=".vimrc" --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +'PluginInstall --sync' +qall &> /dev/null
