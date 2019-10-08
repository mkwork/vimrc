#!/bin/bash

#deploy dotfiles
ln -sf $(pwd)/.vimrc ~/
ln -sf $(pwd)/.gvimrc ~/
ln -sf $(pwd)/.screenrc ~/
ln -sf $(pwd)/.tmux.conf ~/
ln -sf $(pwd)/.vimperatorrc ~/
ln -sf $(pwd)/.myrc ~/

#bashrc extension
myrc_init="source ~/.myrc"
grep -q "$myrc_init" ~/.bashrc || printf "\n%s\n" "${myrc_init}" >> ~/.bashrc

#tmux related
#make bashr sourcable
echo 'source ~/.bashrc' >> ~/.bash_profile
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

vimrc_dir=$(dirname $(readlink -e $0))

# x11docker
git clone --depth 1 https://github.com/mviereck/x11docker ~/.x11docker
