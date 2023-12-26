#!/usr/bin/env bash
set -ue

DOTFILES_PATH=~/src/github.com/zyun53/dotfiles

link_to_homedir() {
  while read line
  do
      ln -fsv ${DOTFILES_PATH}/${line} ~/.${line}
  done << EOF
  tmux.conf
  gitconfig
  zshrc
  vimrc
EOF

  ln -fsv ${DOTFILES_PATH}/gpg.conf ~/.gnupg/gpg.conf
  ln -fsv ${DOTFILES_PATH}/starship.toml ~/.config/starship.toml
  ln -fsv ${DOTFILES_PATH}/config/nvim ~/.config/nvim
}

make_misc_dir() {
  # alacritty
  mkdir -p ~/.config/alacritty/themes
  git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

  # vim
  mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

  # etc
  mkdir -p ~/.gnupg
  mkdir -p ~/.config
}

make_misc_dir
link_to_homedir
