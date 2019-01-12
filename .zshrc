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
export EDITOR=vi

alias vi="nvim"

source $HOME/.fzf/shell/key-bindings.zsh
source $HOME/.fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/vault vault
source /usr/share/nvm/init-nvm.sh
export PATH="/usr/local/opt/scala@2.11/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
