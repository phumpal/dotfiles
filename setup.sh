#!/bin/bash

sudo apt-get install -y stow silversearcher-ag

if stow --dir=files --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi
