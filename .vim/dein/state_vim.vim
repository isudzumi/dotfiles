let [plugins, ftplugin] = dein#load_cache_raw(['C:\Users\hiro\Program Files\vim74-kaoriya-win64\.vimrc', 'C:\Users\hiro\Program Files\vim74-kaoriya-win64\.vim\rc\dein.toml'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = 'C:/Users/hiro/dotfiles/.vim/dein'
let g:dein#_runtime_path = 'C:/Users/hiro/dotfiles/.vim/dein/.dein'
let &runtimepath = 'C:/Users/hiro/dotfiles/.vim/dein/.dein,C:\Users\hiro\dotfiles\.vim\dein\repos\github.com\Shougo\dein.vim,C:\Users\hiro/vimfiles,C:\Users\hiro\Program Files\vim74-kaoriya-win64/vimfiles,C:\Users\hiro\Program Files\vim74-kaoriya-win64\vim74,C:\Users\hiro\Program Files\vim74-kaoriya-win64/vimfiles/after,C:\Users\hiro/vimfiles/after,C:/Users/hiro/dotfiles/.vim/dein/.dein/after'
