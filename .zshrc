# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/serge/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export GOPATH=$(go env GOPATH)
