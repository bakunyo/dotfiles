source ~/dotfiles/git-prompt.sh
# use bash-completion
if [ -f ~/dotfiles/git-completion.bash ]; then
# if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
  # . /opt/local/share/git-core/git-prompt.sh
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

function git-delete-merged() {
  merged=`git branch --merged | egrep -v '\*|develop|master'`
  if [[ $merged = "" ]]; then
    echo 'No merged branch.'
    return 0
  fi

  echo -en "$merged\\ndelete? (y)es/(n)o: "
  read ans

  if [[ $ans =~ ^y(es)?$ ]]; then
    echo "$merged" | xargs git branch -d
  else
    echo 'Cancelled.'
  fi
}

alias gdm='git-delete-merged'
