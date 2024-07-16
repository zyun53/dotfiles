#!/usr/bin/env bash
set -uex

DOTFILES_PATH=~/src/github.com/zyun53/dotfiles

link_to_homedir() {
  while read line
  do
      ln -fsv ${DOTFILES_PATH}/${line} ~/.${line}
  done << EOF
  gitconfig
  zshrc
EOF
  ln -fsv ${DOTFILES_PATH}/gpg.conf       ~/.gnupg/gpg.conf
  ln -fsv ${DOTFILES_PATH}/starship.toml  ~/.config/starship.toml
  ln -fsv ${DOTFILES_PATH}/config/nvim/   ~/.config
  ln -fsv ${DOTFILES_PATH}/hammerspoon/init.lua ~/.hammerspoon/init.lua
}

make_misc_dir() {
  # alacritty
  if [ ! -d ~/.config/alacritty/themes ]
  then
    mkdir -p ~/.config/alacritty/themes
    git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
  fi

  # vim
  mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

  # etc
  mkdir -p ~/.gnupg
  mkdir -p ~/.config
  mkdir -p ~/.config/tmux
}

make_misc_dir
link_to_homedir
