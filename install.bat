@echo off
rem encoding cp932
rem ä«óùé“å†å¿Ç≈é¿çs
mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc
mklink %USERPROFILE%\.gitconfig %USERPROFILE%\dotfiles\.gitconfig
mklink /D %USERPROFILE%\.vim %USERPROFILE%\dotfiles\.vim
