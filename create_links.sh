#!/bin/bash

rm .vimrc
ln -s dotfiles/.vimrc .vimrc

rm -rf .vim
ln -s dotfiles/.vim .vim

rm .agignore
ln -s dotfiles/.agignore .agignore

rm .bash_profile
ln -s dotfiles/.bash_profile .bash_profile

rm .gitignore
ln -s dotfiles/gitignore .gitignore

rm .gitconfig
ln -s dotfiles/gitconfig .gitconfig
