@echo off
rem encoding cp932
rem �Ǘ��Ҍ����Ŏ��s
mklink %HOME%\.vimrc %HOME%\dotfiles\.vimrc
mklink %HOME%\.gitconfig %HOME%\dotfiles\.gitconfig
mklink /D %HOME%\.vim %HOME%\dotfiles\.vim
