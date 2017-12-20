HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export GOPATH=$(go env GOPATH)

prompt powerline
