" plugins set up
if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

" Required
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required
NeoBundleFetch 'Shougo/neobundle.vim'

" originalrepos on github
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" others

call neobundle#end()

" Required
filetype plugin indent on 

" If there are uninstalled bundles found on startup,
" " this will conveniently prompt you to install them.
NeoBundleCheck
