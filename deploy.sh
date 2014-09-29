#!/bin/bash

#deploy dotfiles
ln -s `pwd`/.vimrc /home/$USER/
ln -s `pwd`/.gvimrc /home/$USER/
ln -s `pwd`/.screenrc /home/$USER/
ln -s `pwd`/.tmux.conf /home/$USER/

#tmux related
#latest stable tmux
curl -fsSL https://gist.github.com/shime/5706655/raw/install.sh | sudo bash -e
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
