@echo off
rem encoding cp932
rem ä«óùé“å†å¿Ç≈é¿çs
mklink %HOME%\.vimrc %HOME%\dotfiles\.vimrc
mklink %HOME%\.gitconfig %HOME%\dotfiles\.gitconfig
mklink /D %HOME%\.vim %HOME%\dotfiles\.vim
