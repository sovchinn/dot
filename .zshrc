HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit

autoload bashcompinit
bashcompinit
source ~/.bash/autocomplete.bash

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export GOPATH=$(go env GOPATH)

prompt paradox

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
