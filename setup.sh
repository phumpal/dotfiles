#!/bin/bash

sudo apt-get install -y stow

if stow --dir=files --target="$HOME" $(ls files | sed 's#/##' | paste -sd " " -); then
  echo "ok"
fi
