source ~/dotfiles/git-prompt.sh
# use bash-completion
if [ -f ~/dotfiles/git-completion.bash ]; then
# if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
  # . /opt/local/share/git-core/git-prompt.sh
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
else
  export PS1='\[\033[01;32m\][\u@\h \t]\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

function git-push-for-review() {
  echo -en "Specify branch of compare from(develop):"
  read ans
  [[ $ans = "" ]] && from='develop' || from=$ans

  current_branch=`git branch | egrep '\*' | tr -d "* "`
  echo -en "Specify branch of compare to(${current_branch}):"
  read ans
  [[ $ans = "" ]] && to=$current_branch || to=$ans

  echo "from = ${from}, to = ${to}"
  from_branch="${from}_for_review_${to}"

  git checkout $from
  git checkout -b $from_branch
  git push origin $from_branch

  git checkout $to
  git push origin $to
  echo "git pushed from_branch as: ${from_branch}"
  echo "git pushed to_branch as: ${to}"
  echo "Let's create pull request on remote repository."
}

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

function git-checkout-force() {
  local branch=$1
  if [ $branch = $(git rev-parse --abbrev-ref HEAD) ]; then
    echo "Already on '$branch'" >&2
    return 0
  fi
  git branch -D $branch > /dev/null 2>&1
  git checkout -b $branch
}

function git-committer-change() {
  git filter-branch --commit-filter '
    GIT_AUTHOR_NAME="Izuta Hiroyuki"
    GIT_AUTHOR_EMAIL="izuta.hiroyuki@gmail.com"
    GIT_COMMITTER_NAME="Izuta Hiroyuki"
	GIT_COMMITTER_EMAIL="izuta.hiroyuki@gmail.com"
	git commit-tree "$@"
  ' HEAD
}

alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gcm='git commit -v'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcof='git-checkout-force'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdm='git-delete-merged'
alias gg='git grep'
alias gl="git log --pretty='%h %ci %s %cn'"
alias gpl='git pull'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
for n in $(seq 10); do
  alias grbi$n="git rebase -i HEAD~$n"
done
alias grs='git reset'
for n in $(seq 10); do
  alias grs$n="git reset HEAD~$n"
done
alias gs='git status'
alias gsh='git show'
alias gps='git push'
alias gpsfr='git-push-for-review'
