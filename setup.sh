#!/bin/bash
git clone https://github.com/gmarik/vundle.git ~/dotvim/bundle/vundle

ln -s ~/.vim ~/dotvim
ln -s ~/dotvim/vimrc ~/.vimrc
ln -s ~/dotvim/gvimrc ~/.gvimrc

vim +BundleInstall +qall
