@echo off
rem 管理者権限で実行
mklink %HOME%\.vimrc %HOME%\dotfiles\.vimrc
mklink /D %HOME%\.vim %HOME%\dotfiles\.vim
