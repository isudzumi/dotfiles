let [plugins, ftplugin] = dein#load_cache_raw(['C:\Users\mrhir\Documents\vim74-kaoriya-win64\.vimrc', 'C:\Users\mrhir\Documents\vim74-kaoriya-win64\.vim\rc\dein.toml', 'C:/Users/mrhir/Documents/vim74-kaoriya-win64/.vim/rc/dein.toml'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = 'C:/Users/mrhir/Documents/vim74-kaoriya-win64/.vim/dein'
let g:dein#_runtime_path = 'C:/Users/mrhir/Documents/vim74-kaoriya-win64/.vim/dein/.dein'
let &runtimepath = 'C:\Users\mrhir\Documents\vim74-kaoriya-win64\.vim\dein\repos\github.com\Shougo\dein.vim,C:\Users\mrhir/vimfiles,C:/Users/mrhir/Documents/vim74-kaoriya-win64/.vim/dein/.dein,C:\Users\mrhir\Documents\vim74-kaoriya-win64/vimfiles,C:\Users\mrhir\Documents\vim74-kaoriya-win64\vim74,C:\Users\mrhir\Documents\vim74-kaoriya-win64/vimfiles/after,C:\Users\mrhir/vimfiles/after,C:\Users\mrhir\Documents\vim74-kaoriya-win64\plugins\autofmt,C:\Users\mrhir\Documents\vim74-kaoriya-win64\plugins\golang,C:\Users\mrhir\Documents\vim74-kaoriya-win64\plugins\kaoriya,C:\Users\mrhir\Documents\vim74-kaoriya-win64\plugins\vimdoc-ja,C:\Users\mrhir\Documents\vim74-kaoriya-win64\plugins\vimproc,C:/Users/mrhir/Documents/vim74-kaoriya-win64/.vim/dein/.dein/after'
filetype off
