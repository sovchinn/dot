HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
zstyle :compinstall filename '${HOME}/.zshrc'

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

prompt paradox

if [[ $platform == 'linux' ]]; then
elif [[ $platform == 'darwin' ]]; then
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi

export PATH="$PATH:$HOME/go/bin"
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin
export EDITOR=nvim
export CHROME_EXECUTABLE=/usr/bin/chromium

source $HOME/dot/.fzf/shell/key-bindings.zsh
source $HOME/dot/.fzf/shell/completion.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $HOME/dot/zsh-z/zsh-z.plugin.zsh
zstyle ':completion:*' menu select

autoload -U +X bashcompinit && bashcompinit
autoload -Uz compinit; compinit
export KUBE_EDITOR=nvim

source $HOME/dot/.skaffold/shell/completion.zsh

alias vi="nvim"
alias cat="bat"
alias xclip="xclip -selection c"
alias kb="kubectl"
alias sidf="source "/opt/esp-idf/export.sh""

# bun completions
[ -s "/home/serge/.bun/_bun" ] && source "/home/serge/.bun/_bun"
