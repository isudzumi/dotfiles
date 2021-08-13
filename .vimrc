set fileformats=unix,dos,mac
if exists('&ambiwidth')
  set ambiwidth=double
endif

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmode
set ruler
set fileencoding=utf-8
set number
set clipboard&
set clipboard^=unnamedplus
let g:clipboard = {
    \   'name': 'clipboard',
    \   'copy': {
    \      '+': 'win32yank.exe -i --crlf',
    \      '*': 'win32yank.exe -i --crlf',
    \    },
    \   'paste': {
    \      '+': 'win32yank.exe -o --lf',
    \      '*': 'win32yank.exe -o --lf',
    \   },
    \   'cache_enabled': 1,
    \ }
set noswapfile
set noundofile
set nobackup
set autoindent
set incsearch
set ignorecase
set hlsearch

" keymaps
imap <C-f> <esc>
inoremap <C-;> <C-o>A
inoremap <C-/> <C-o>a
nnoremap ; :
nnoremap : ;
nnoremap <C-m> <C-v>
nnoremap <C-l> <C-w>
cnoremap <C-b> <C-v><C-m>
nnoremap <C-t> gt
tnoremap <C-f> <C-\><C-n>
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein自体の自動インストール
let s:cache_home = $HOME . expand('/repo/github.com/isudzumi/dotfiles/.vim')
let s:dein_dir = s:cache_home . expand('/dein')
let s:dein_repo_dir = s:dein_dir . expand('/repos/github.com/Shougo/dein.vim')
if !isdirectory(s:dein_repo_dir)
  if executable('git')
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let g:rc_dir = s:cache_home . expand('/rc')
let s:toml_file =  g:rc_dir . '/dein.toml'
let s:lazy_toml_file = g:rc_dir . '/dein_lazy.toml'
if has('nvim')
    let s:nvim_toml_file = g:rc_dir . '/dein_nvim.toml'
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file, {'lazy': 0})
  call dein#load_toml(s:lazy_toml_file, {'lazy': 1})
if has('nvim')
  call dein#load_toml(s:nvim_toml_file, {'lazy': 1})
endif
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" End dein Scripts-------------------------

set background=dark
syntax on
set cursorline
hi CursorLineNr term=bold cterm=NONE ctermfg=224 ctermbg=NONE
hi clear CursorLine

" ConEmu上でBackSpaceがdeleteの挙動をする問題の修正
if has('win32') || has('win64')
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
    cnoremap <Char-0x07F> <BS>
endif

" Python有効化
if (has('win32') || has('win64')) && executable('python') && !has('nvim')
    set runtimepath+=$VIM
    set pythonthreedll=python36.dll " Pythonのディレクトリにパスを通していた場合
endif
