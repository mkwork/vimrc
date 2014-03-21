#!/bin/bash

rm ~/.vimrc ~/.gvimrc ~/.screenrc

ln -s `pwd`/.vimrc ~/
ln -s `pwd`/.gvimrc ~/
ln -s `pwd`/.screenrc ~/
