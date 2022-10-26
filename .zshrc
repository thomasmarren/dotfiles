eval "$(rbenv init - zsh)"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '[%b]'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{240}${PWD/#$HOME/~} %F{white}${vcs_info_msg_0_} %F{28}~> %F{white}'

export VISUAL="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export EDITOR="vim"

alias a="code $@"
alias sz="source ~/.zshrc"
alias zshrc="code ~/.zshrc"
alias gitignore="a ~/.gitignore"

function ports () {
  lsof -t -i :$@
};

autoload -Uz compinit
compinit

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
