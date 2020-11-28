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

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source "${ZDOTDIR:-$HOME}/dot/_helm_autocomplete"
#source /usr/share/nvm/init-nvm.sh

prompt sorin

if [[ $platform == 'linux' ]]; then
elif [[ $platform == 'darwin' ]]; then
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi

export PATH="$PATH:$HOME/go/bin"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export EDITOR=nvim
export CHROME_EXECUTABLE=/usr/bin/chromium

source $HOME/.fzf/shell/key-bindings.zsh
source $HOME/.fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

autoload -U +X bashcompinit && bashcompinit
export KUBE_EDITOR=nvim

source $HOME/.skaffold/completion.zsh

alias vi="nvim"
alias cat="bat"
alias xclip="xclip -selection c"
alias kb="kubectl"
