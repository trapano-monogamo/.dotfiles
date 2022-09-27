# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt autocd extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/noemi/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# PROMPT="%F{green}%n%f@%F{green}%m%f:%F{yellow}%c%f$ "


# PROMPT="%F{032}[%f%F{007}%n%f%F{yellow}@%f%F{007}%m%f%F{032}]%f %F{yellow}%c%f $ "
PROMPT="%F{032}[%f%F{007}n%f%F{yellow}@%f%F{007}a%f%F{032}]%f %F{yellow}%c%f $ "

alias vi="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# autoload -U promptinit; promptinit
# prompt spaceship

export EDITOR=nvim
export VISUAL=nvim
export LESSHISTFILE="-" # deletes file after creation

[ -f "/home/noemi/.ghcup/env" ] && source "/home/noemi/.ghcup/env" # ghcup-env
