#!/bin/bash
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/git/ $XDG_CONFIG_HOME/git/
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/.vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.vim ~/.config/nvim/.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
