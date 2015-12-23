source ~/dotfiles/git-prompt.sh
# use bash-completion
if [ -f ~/dotfiles/git-completion.bash ]; then
# if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
  # . /opt/local/share/git-core/git-prompt.sh
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi
