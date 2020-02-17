HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'

autoload -Uz compinit
compinit

platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='darwin'
fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source "${ZDOTDIR:-$HOME}/dot/_helm_autocomplete"

prompt sorin

if [[ $platform == 'linux' ]]; then
elif [[ $platform == 'darwin' ]]; then
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export EDITOR=vi

alias vi="nvim"
alias cat="bat"

source $HOME/.fzf/shell/key-bindings.zsh
source $HOME/.fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
export KUBE_EDITOR=nvim
