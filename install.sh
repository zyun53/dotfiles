#!/usr/bin/env bash
set -uex

DOTFILES_PATH=~/src/github.com/zyun53/dotfiles

link_to_homedir() {
  ln -fsv ${DOTFILES_PATH}/gpg.conf              ~/.gnupg/gpg.conf
  ln -fsv ${DOTFILES_PATH}/starship.toml         ~/.config/starship.toml
  ln -fsv ${DOTFILES_PATH}/config/nvim/          ~/.config
  ln -fsv ${DOTFILES_PATH}/hammerspoon/init.lua  ~/.hammerspoon/init.lua
  ln -fsv ${DOTFILES_PATH}/aerospace.toml        ~/.aerospace.toml
  ln -fsv ${DOTFILES_PATH}/zellij/config.kdl     ~/.config/zellij/config.kdl
}

make_misc_dir() {
  # vim
  mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

  # etc
  mkdir -p ~/.gnupg
  mkdir -p ~/.config
  mkdir -p ~/.config/tmux
}

make_misc_dir
link_to_homedir
