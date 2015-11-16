filetype off

if has('vim_starting')
  set nocompatible               " be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" from originalrepos on github
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'rking/ag.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'tomasr/molokai'
NeoBundle 'groenewege/vim-less'
NeoBundle 'kana/vim-fakeclip'

" for markdown-preview
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

"--------------------
" neocomplete
"--------------------
if filereadable(expand('vimrcs/neocomplete.vimrc'))
  source vimrcs/neocomplete.vimrc
endif

call neobundle#end()

filetype plugin indent on     " required!

"--------------------
" base
"--------------------
set nocompatible " viとの互換性をとらない(vimの独自拡張機能を使う為)

"--------------------
" edit
"--------------------
set showmatch "対応する括弧を表示
set matchtime=1 "showmatchの表示時間
set showcmd "入力中のコマンドをステータスに表示
set wildmenu "コマンドライン補完を拡張モード


"--------------------
" indent
"--------------------
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype less setlocal ts=2 sts=2 sw=2

"--------------------
" search
"--------------------
set hlsearch " 検索結果をハイライトする
set wrapscan " 検索後、先頭に戻る
set ignorecase " 検索時に大文字小文字を区別しない
set smartcase " ただし、検索クエリに大文字が含まれる場合は区別する
set noincsearch " インクリメンタルサーチ
set history=100

"--------------------
" split
"--------------------
set splitbelow "新しいウィンドウを下に開く
set splitright "新しいウィンドウを右に開く

"--------------------
" status line
"--------------------
set laststatus=2
set statusline=%n\:%y%F\ \<%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\>'}%m%r%=<%l/%L:%p%%>

"--------------------
" design
"--------------------
"colorscheme hybrid
colorscheme molokai
set title " タイトルバーを表示する
set number " 行番号を表示する
set ruler " ルーラ（画面右下の行情報）を表示する

"--------------------
" copy to clipboard
"--------------------
set clipboard=unnamed,autoselect
set paste

"--------------------
" syntax highlight
"--------------------
syntax on
autocmd BufNewFile,BufRead *.json set ft=javascript " .json as javascript
autocmd BufNewFile,BufRead *.as set ft=javascript " .as as javascript
autocmd BufNewFile,BufRead *.class set ft=php " .class as php
autocmd BufNewFile,BufRead *.ctp set filetype=php " .ctp as php
autocmd BufNewFile,BufRead *.hbs set filetype=html " .hbs as html
autocmd BufNewFile,BufRead *.erb set filetype=html " .erb as html
source $VIMRUNTIME/macros/matchit.vim " matchit

"--------------------
" cursor highlight
"--------------------
set cursorline
hi CursorLine cterm=none ctermfg=234 ctermbg=LightBlue
hi Visual guibg=Blue ctermbg=Blue

"--------------------
" key map
"--------------------
" It doesn't record in the list of YankRing.
" http://d.hatena.ne.jp/yano3/20090526/1243350033
nnoremap x "_x
imap <C-l> <esc>

autocmd FileType * setlocal formatoptions-=ro

"--------------------
" charcode
"--------------------
" http://tweeeety.hateblo.jp/entry/2014/12/17/222935
" 開く時の自動判別
set fileencodings=utf-8,iso-2022-jp,ucs2le,ucs-2,cp932,euc-jp
" デフォルトの文字コード
set encoding=utf-8
" 改行コードの自動認識
set fileformats=unix,dos,mac

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

"--------------------
" vendor
"--------------------
" ctrlp
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup -g ""'
endif

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

