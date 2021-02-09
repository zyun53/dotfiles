#!/bin/bash -x

# mkdir -p ~/.ansible/vault

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

mkdir -p ~/.vim/backup ~/.vim/swap

# mkdir -p ~/.config/nvim/backup ~/.config/nvim/swap ~/.config/nvim/undo
# ln -fs ~/dotfiles/zshrc ~/.zshrc
# ln -fs ~/dotfiles/tmux.conf ~/.tmux.conf
# ln -fs ~/dotfiles/gitconfig ~/.gitconfig
# ln -fs ~/dotfiles/aliases ~/.aliases
# ln -fs ~/dotfiles/my.cnf ~/.my.cnf
# ln -fs ~/dotfiles/grcat ~/.grcat
# ln -fs ~/dotfiles/vimrc ~/.vimrc
# ln -fs ~/.config/nvim ~/.vim
