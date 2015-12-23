alias bx='bundle exec'
alias ll='ls -la'
alias up="cd ..; ls -l"
alias f="open ."
alias ctags="`brew --prefix`/bin/ctags"

if [ -f ~/git-functions.sh ] ; then
  . ~/git-functions.sh
fi

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

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

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
