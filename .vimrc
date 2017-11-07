" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"ここから拝借->http://www.kawaz.jp/pukiwiki/?vim
"-------------------------------------------------------------------------

"タブ設定
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmode
set ruler
set fileencoding=utf-8
"行数表示
set nu
"クリップボードを使う
if !has('nvim')
    set clipboard=unnamed
else
    set clipboard+=unnamedplus
endif
"_viminfoファイルの保存先
set viminfo+=n$VIM/_viminfo
"swapファイルを作成しない
set noswapfile
"undoファイルを作成しない
set noundofile
"バックアップファイルを作成しない
set nobackup
"オートインデント
set autoindent

" viとの互換性を無効化する
if !&compatible
  set nocompatible
endif

" キーマッピング
imap <C-f> <esc>
nnoremap ; :
nnoremap : ;
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein自体の自動インストール
let s:cache_home = $HOME . expand('/.vim')
let s:dein_dir = s:cache_home . expand('/dein')
let s:dein_repo_dir = s:dein_dir . expand('/repos/github.com/Shougo/dein.vim')
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let g:rc_dir = s:cache_home . expand('/rc')
let s:toml_file =  g:rc_dir . '/dein.toml'
let s:lazy_toml_file = g:rc_dir . '/dein_lazy.toml'
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

" 行番号ハイライト
set background=dark
syntax on
set cursorline
hi CursorLineNr term=bold cterm=NONE ctermfg=224 ctermbg=NONE
hi clear CursorLine

" ConEmu上でBackSpaceがdeleteの挙動をする問題の修正
if has('win32') || has('win64')
    inoremap <Char-0x07F> <BS>
    nnoremap <Char-0x07F> <BS>
endif

" Python有効化
if has('win32') || has('win64')
    set runtimepath+=$VIM
    set pythonthreedll=python36.dll " Pythonのディレクトリにパスを通していた場合
endif

