#!/bin/bash

remove_if_exists() {
  local file="$1"

  if [ -L "$file" ]; then
    echo "Unlinking symlink: $file"
    unlink "$file"
  elif [ -f "$file" ]; then
    echo "Skipping regular file: $file (not a symlink)"
  fi
}

if [ $(uname) == 'Linux' ]; then
  DEBIAN_FRONTEND=noninteractive sudo apt-get install -y -qq stow silversearcher-ag
  sudo apt-get update && sudo apt-get install --only-upgrade golang
fi

remove_if_exists ~/.gitconfig
remove_if_exists ~/.gitignore_global

if stow --dir=files --override=".vimrc" --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +'PluginInstall --sync' +qall &> /dev/null
