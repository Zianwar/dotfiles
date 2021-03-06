#!/usr/bin/env sh

# Path to oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles
export ZSH="$DOTFILES/oh-my-zsh"

# oh-my-zsh variables
ZSH_THEME="ep"
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"

# oh-my-zsh plugins
plugins=(git osx zsh-completions history zsh-syntax-highlighting colorize docker z command-not-found gitignore golang)
source $ZSH/oh-my-zsh.sh
eval $(/usr/libexec/path_helper -s)
autoload -U compinit && compinit

# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
