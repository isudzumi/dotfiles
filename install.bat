@echo off
rem encoding cp932
rem �Ǘ��Ҍ����Ŏ��s
mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.vim %USERPROFILE%\dotfiles\.vim
