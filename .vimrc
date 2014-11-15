filetype off

if has('vim_starting')
  set nocompatible               " be iMproved

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundleFetch 'Shougo/vimproc'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'

call neobundle#end()

filetype plugin indent on     " required!
syntax on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
