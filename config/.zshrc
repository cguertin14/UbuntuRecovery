# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"
ZSH_THEME="gentoo"

plugins=(
    git 
    helm 
    docker
    docker-compose
    kubectl
    zsh-completions 
    zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin/
export GO111MODULE=on
export KUBECONFIG=~/.kube/config
export EDITOR=vi

emulate sh -c 'source /etc/profile'
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
[ -f ~/.docker_aliases ] && source ~/.docker_aliases

alias icat="kitty +kitten icat"

function goto {
    case $1 in
        ets)
            cd ~/Documents/ETS;
            ;;
        cedille)
            cd ~/Documents/Cedille;
            ;;
        df)
            cd ~/Documents/dotfiles;
            ;;
	perso)
	    cd ~/Documents/Perso;
	    ;;
        *)
            echo "Usage: df|cedille|ets|perso"
            ;;
    esac
}

function cat {
    if [ $# -eq "0" ] 
      then
        echo "No arguments provided to cat."
        batcat --help
    else
        batcat --style=plain --pager=0 $1
    fi
}

unset ZLE_RPROMPT_INDENT
export PATH="$PWD/node_modules/.bin/:$PATH"

# Command highlight && Completion.
autoload -Uz compinit #&& compinit -i
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"
