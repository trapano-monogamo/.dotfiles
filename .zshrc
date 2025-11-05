# # Use powerline
# USE_POWERLINE="true"
# # Has weird character width
# # Example:
# #    is not a diamond
# HAS_WIDECHARS="false"
# # Source manjaro-zsh-configuration
# if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#   source /usr/share/zsh/manjaro-zsh-config
# fi
# # Use manjaro zsh prompt
# if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#   source /usr/share/zsh/manjaro-zsh-prompt
# fi

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

# previous prompts

# PROMPT="%F{green}%n%f@%F{green}%m%f:%F{yellow}%c%f$ "
# PROMPT="%F{032}[%f%F{007}%n%f%F{yellow}@%f%F{007}%m%f%F{032}]%f %F{yellow}%c%f $ "
# PROMPT='$(check_exit_code)%F{032}[%f%F{007}n%f%F{yellow}@%f%F{007}a%f%F{032}]%f %F{yellow}%c%f $ '
# PROMPT='%{$fg[white]%}┏━[%{$fg[yellow]%}%c%{$fg[white]%}] $(check_exit_code)$(check_git_branch)${NEWLINE}┗━[%{$fg[blue]%}λ%{$fg[white]%}] '
PROMPT='$(check_exit_code)%{$fg[cyan]%}%~$(check_git_branch)%{$fg[blue]%}$ %{$fg[default]%}'

alias ls="ls --color=auto"
alias vi="nvim"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" # https://www.atlassian.com/git/tutorials/dotfiles

export EDITOR=nvim
export VISUAL=nvim

export PATH=$PATH:$HOME/.elan/bin

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ghcup-env
[ -f "/home/chiara/.ghcup/env" ] && . "/home/chiara/.ghcup/env"


# fortune | cowsay -r -C
# cowsay I use arch btw.
