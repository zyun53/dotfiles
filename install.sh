#!/bin/bash -x

DOTFILES_PATH=~/src/github.com/zyun-i/dotfiles

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# brew install deno

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

mkdir -p ~/.vim/backup ~/.vim/swap ~/.vim/undo

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
