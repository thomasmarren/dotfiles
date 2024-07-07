eval "$(rbenv init - zsh)"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b]'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{240}${PWD/#$HOME/~} %F{white}${vcs_info_msg_0_} %F{28}~> %F{white}'

# PROMPT='%F{240}%~ %F{28}~> '

export VISUAL="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export EDITOR="vim"

alias a="code $@"
alias sz="source ~/.zshrc"
alias zshrc="code ~/.zshrc"
alias be="bundle exec "
alias gitignore="a ~/.gitignore"
alias gitconfig="a ~/.gitconfig"
alias gbsort="gb"

alias github_key="ssh-add ~/.ssh/id_rsa"

alias gpod="git pull origin develop"

# Merge current origin branch into current local branch
function pull_current() {
  echo "git pull origin $(git rev-parse --abbrev-ref HEAD)"
  git pull origin $(git rev-parse --abbrev-ref HEAD) $@
}

# Push current branch to origin
function push_current() {
  echo "git push origin $(git rev-parse --abbrev-ref HEAD)"
  git push origin $(git rev-parse --abbrev-ref HEAD) $@
}

function ports() {
  lsof -t -i :$@
}

# Copy link to create a PR for branch on Github
function cppr() {
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  WORKING_DIR=${PWD##*/}

  PR="https://github.com/$GITHUB_ORG/$WORKING_DIR/pull/new/$CURRENT_BRANCH"
  echo $PR
  echo $PR | tr -d '\n' | pbcopy
  echo "PR link copied to clipboard"
}

autoload -Uz compinit
compinit

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/tom/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
