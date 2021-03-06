let s:dein_dir = expand('~/.cache/dein') " plugin install path for dein
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim' " dein.vim path

" git clone unless dein.vim exists.
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" dein settings.
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " plugin list(toml file).
  let s:toml      = '~/dotfiles/dein/plugins.toml'
  let s:lazy_toml = '~/dotfiles/dein/plugins_lazy.toml'
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" install if yet.
if dein#check_install()
  call dein#install()
endif
