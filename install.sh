#!/bin/bash -x

DOTFILES_PATH=~/src/github.com/zyun-i/dotfiles

while read line
do
    ln -fs ${DOTFILES_PATH}/${line} ~/.${line}
done << EOF
tmux.conf
gitconfig
zshrc
vimrc
EOF

ln -fs ${DOTFILES_PATH}/gpg.conf ~/.gnupg/gpg.conf
ln -fs ${DOTFILES_PATH}/starship.toml ~/.config/starship.toml

mkdir -p ~/.vim/backup ~/.vim/swap
mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
