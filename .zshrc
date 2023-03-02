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
# PROMPT='$(check_exit_code)%F{032}[%f%F{007}n%f%F{yellow}@%f%F{007}a%f%F{032}]%f %F{yellow}%c%f $ '
# PROMPT='%{$fg[white]%}┏━[%{$fg[yellow]%}%c%{$fg[white]%}] $(check_exit_code)$(check_git_branch)${NEWLINE}┗━[%{$fg[blue]%}λ%{$fg[white]%}] '

setopt PROMPT_SUBST
autoload -U colors && colors
NEWLINE=$'\n'

check_exit_code() {
	if (( $? != 0 )) then
		echo "%{$fg[red]%}◉ %{$fg[white]%}"
	else
		echo "%{$fg[green]%}○ %{$fg[white]%}"
	fi
}

check_git_branch() {
	git status &>/dev/null
	if (( $? == 0 )) then
		command="git branch | grep '*' | tr -d '* '"
		echo " %{$fg[magenta]%}($(eval $command))%{$fg[white]%} "
	else
		echo " "
	fi
}

# λ
PROMPT='$(check_exit_code)%{$fg[cyan]%}%c$(check_git_branch)%{$fg[blue]%}$ %{$fg[white]%}'

alias ls="ls --color=auto"
alias vim="vim -u ~/.vimrc"
alias vi="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# autoload -U promptinit; promptinit
# prompt spaceship

export startwm=1
export PATH=$PATH:/home/noemi/julia-1.8.5/bin
export QT_PLUGIN_PATH=/home/noemi/anaconda3/plugins
export MONITOR=override-value polybar mybar
export GTK_THEME=Adwaita:dark
export EDITOR=nvim
export VISUAL=nvim
export LESSHISTFILE="-" # deletes file after creation

[ -f "/home/noemi/.ghcup/env" ] && source "/home/noemi/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/noemi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/noemi/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/noemi/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/noemi/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

