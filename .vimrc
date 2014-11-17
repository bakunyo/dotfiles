filetype off

if has('vim_starting')
  set nocompatible               " be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/vimproc'

" for file open
NeoBundle 'Shougo/unite.vim'
" for unit vim
" list of buffers
noremap <C-P> :Unite buffer<CR>
" list of files
noremap <C-N> :Unite -buffer-name=file file<CR>
" list of recent files
noremap <C-Z> :Unite file_mru<CR>
" sources is current file directory
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" open window by split
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" open window by vertical split
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" quit by esc x 2
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" file tree
NeoBundle 'scrooloose/nerdtree'

" for git
NeoBundle 'tpope/vim-fugitive'
" after Grep, show QuickFix List
autocmd QuickFixCmdPost *grep* cwindow
" show git branch
set statusline+=%{fugitive#statusline()}

" insert end for Ruby file
NeoBundle 'tpope/vim-endwise'

" Comment on/off by Shift + V and gc
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'bronson/vim-trailing-whitespace'

call neobundle#end()

filetype plugin indent on     " required!
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

imap <C-l> <esc>
