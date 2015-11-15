#!/bin/bash
#init submodules
git submodule init
git submodule update

#deploy dotfiles
ln -sf $(pwd)/.vimrc ~/
ln -sf $(pwd)/.gvimrc ~/
ln -sf $(pwd)/.screenrc ~/
ln -sf $(pwd)/.tmux.conf ~/
ln -sf $(pwd)/.vimperatorrc ~/
ln -sf $(pwd)/.myrc ~/

#bashrc extension
myrc_init="source ~/.myrc"
grep -q "$myrc_init" ~/.bashrc || echo $myrc_init >> ~/.bashrc

#tmux related
#make bashr sourcable
echo 'source ~/.bashrc' >> ~/.bash_profile
#latest stable tmux
#curl -fsSL https://gist.github.com/shime/5706655/raw/install.sh | sudo bash -e
#tmux tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#themes
#deploy solarized scheme
git clone https://github.com/altercation/vim-colors-solarized.git
mkdir -p ~/.vim/colors
cp vim-colors-solarized/colors/solarized.vim ~/.vim/colors/

#deploy solarized scheme for QtCreator
mkdir -p ~/.config/QtProject/qtcreator/styles/
cp ./qtcreator-solarized/*solar*.xml ~/.config/QtProject/qtcreator/styles/
