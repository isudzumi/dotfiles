@echo off
rem encoding cp932
rem 管理者権限で実行
mklink %HOME%\.vimrc %HOME%\dotfiles\.vimrc
mklink %HOME%\.gitconfig %HOME%\dotfiles\.gitconfig
mklink /D %HOME%\.vim %HOME%\dotfiles\.vim
