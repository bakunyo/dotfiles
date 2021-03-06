# emacs keybind
bindkey -e

source ~/dotfiles/git-prompt.sh

# git-completionの読み込み
zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.bash
autoload -Uz compinit && compinit

# プロンプトの表示オプション
GIT_PS1_SHOWDIRTYSTATE=true

# プロンプトの表示設定
setopt PROMPT_SUBST ; PS1='%F{green}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# history 検索
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

# help の有効化
autoload -U run-help
autoload run-help-git
unalias run-help
alias help=run-help

# zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

alias bx='bundle exec'
alias ll='ls -la'
alias up="cd ..; ls -l"
alias f="open ."
alias cdg='cd $(ghq list -p | peco)'
alias dcp='docker-compose'

if [ -f ~/dotfiles/git-functions.sh ] ; then
  . ~/dotfiles/git-functions.sh
fi

# NeoVim settings
if which nvim > /dev/null; then
  export XDG_CONFIG_HOME=$HOME/dotfiles  # config home for neovim
  alias vim=nvim
fi

if which anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi

if which go > /dev/null; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
fi

export LESS=-nqR
export EDITOR=vim
export BUNDLER_EDITOR=vim

