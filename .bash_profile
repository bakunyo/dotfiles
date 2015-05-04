alias bx='bundle exec'
alias ll='ls -la'
alias up="cd ..; ls -l"
alias f="open ."
alias ctags="`brew --prefix`/bin/ctags"

# function
# 英単語検索
dic () {
  w3m "http://ejje.weblio.jp/content/$1" | grep "用例"
}

# Finderの位置に移動
cdf () {
        target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
        if [ "$target" != "" ]
        then
                cd "$target"
                pwd
        else
                echo 'No Finder window found' >&2
        fi
}

git_branch() {
  __git_ps1 '(git:%s)'
}

source ~/dotfiles/git-prompt.sh
# use bash-completion
if [ -f ~/dotfiles/git-completion.bash ]; then
# if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
  # . /opt/local/share/git-core/git-prompt.sh
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

