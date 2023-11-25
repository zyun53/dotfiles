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

vim_dir() {
  mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo
}

link_to_homedir
