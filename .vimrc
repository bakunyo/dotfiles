"                            .                    
"            ##############..... ##############   
"            ##############......##############   
"              ##########..........##########     
"              ##########........##########       
"              ##########.......##########        
"              ##########.....##########..        
"              ##########....##########.....      
"            ..##########..##########.........    
"          ....##########.#########.............  
"            ..################JJJ............    
"              ################.............      
"              ##############.JJJ.JJJJJJJJJJ      
"              ############...JJ...JJ..JJ  JJ     
"              ##########....JJ...JJ..JJ  JJ      
"              ########......JJJ..JJJ JJJ JJJ     
"              ######    .........                
"                          .....                  
"                            .                    

set nocompatible           " Use Vim, not vi

"--------------------
" plugins
"--------------------
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

source ~/.vim/ag.vim
source ~/.vim/colors.vim
source ~/.vim/ctrlp.vim
source ~/.vim/qfixhowm.vim
source ~/.vim/vimagit.vim

call neobundle#end()
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"--------------------
" NeoVim only setting
"--------------------
if has('nvim')
else
  set clipboard   =unnamed,autoselect " Set clipboard.
endif

"--------------------
" base
"--------------------
filetype plugin indent on  " Load plugins according to detected filetype.
let mapleader = "\<Space>"


"--------------------
" charcode
"-------------------- 
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp " Open priority.
set encoding    =utf-8     " Default encoding. when not match fileencodings
set fileformats=unix,dos,mac " Formats of new line.
if exists('&ambiwidth')
  set ambiwidth=double     " Set ambchar of double width
endif


"--------------------
" edit
"--------------------
set showmatch              " show another parenthesis.
set matchtime   =1         " time seconds of showmatch


"--------------------
" syntax highlight
"--------------------
syntax on                  " Enable syntax highlighting.
set synmaxcol   =200       " Avoid vim internal error. Only highlight the first 200 columns.


"--------------------
" design
"--------------------
" colorscheme hybrid
colorscheme molokai
set title                  " Set title on window.
set number                 " Show line number.
set ruler                  " Show ruler(line, column numbers) on right bottom.


"--------------------
" cursor highlight
"--------------------
set cursorline             " Set cursorline and below is design settings.
hi CursorLine cterm=none ctermfg=234 ctermbg=LightBlue
hi Visual guibg=Blue ctermbg=Blue


"--------------------
" copy to clipboard
"--------------------
set paste                  " Put Vim in Paste mode.
" Don't yank when x(delete command).
nnoremap x "_x


"--------------------
" indent
"--------------------
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set tabstop     =4         " Number of spaces that a <Tab> in the file counts for.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
" set local indent by filetype(ft)
autocmd BufNewFile,BufRead *.erb   set ft=html       " .erb as html
autocmd BufNewFile,BufRead *.json  set ft=javascript " .json as js
autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2


"--------------------
" status line
"--------------------
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.
set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.
set report      =0         " Always report changed lines.


"--------------------
" search
"--------------------
set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.
set wrapscan               " Searches wrap around end-of-file.
set ignorecase             " Ignore Up/Down case on search.
set smartcase              " But Upcase search when query includes upcase.
set history     =50        " Hold 50 histries of command, search(q:)


"--------------------
" command-line
"--------------------
set wildmode    =longest,full " command-line completion


"--------------------
" drawing
"--------------------
set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.


"--------------------
" split
"--------------------
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.


"--------------------
" temporary files
"--------------------
set noswapfile             " Don't create *.swp files
set nobackup               " Don't create *~ files
set viminfo=               " Don't create viminfo

