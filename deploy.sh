#!/bin/bash
#deploy dotfiles
ln -s `pwd`/.vimrc /home/$USER/
ln -s `pwd`/.gvimrc /home/$USER/
ln -s `pwd`/.screenrc /home/$USER/

#deploy solarized scheme
git clone https://github.com/altercation/vim-colors-solarized.git
mkdir -p ~/.vim/colors
cp vim-colors-solarized/colors/solarized.vim ~/.vim/colors/
