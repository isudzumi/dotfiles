@echo off
rem encoding cp932
rem 管理者権限で実行
mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.vim %USERPROFILE%\dotfiles\.vim
