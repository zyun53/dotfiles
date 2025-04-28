#!/usr/bin/env bash
set -uex

DOTFILES_PATH="$(cd "$(dirname "$0")" && pwd)"

link_to_homedir() {
  ln -fsv ${DOTFILES_PATH}/gpg.conf              ~/.gnupg/gpg.conf
  ln -fsv ${DOTFILES_PATH}/starship.toml         ~/.config/starship.toml
  ln -fsv ${DOTFILES_PATH}/hammerspoon/init.lua  ~/.hammerspoon/init.lua
  ln -fsv ${DOTFILES_PATH}/aerospace.toml        ~/.aerospace.toml

  ln -fsv ${DOTFILES_PATH}/config/zellij/        ~/.config
  ln -fsv ${DOTFILES_PATH}/config/nvim/          ~/.config
  ln -fsv ${DOTFILES_PATH}/config/zsh/           ~/.config
}

make_misc_dir() {
  mkdir -p ~/.vim/backup
  mkdir -p ~/.vim/swap
  mkdir -p ~/.vim/undo
  mkdir -p ~/.gnupg
  mkdir -p ~/.config
}

make_misc_dir
link_to_homedir
