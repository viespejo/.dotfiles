#!/usr/bin/env zsh

# For login shells. Sourced before zshrc.

# SHLVL indicates how many shells deep the user is
[[ -n $TMUX || $SHLVL -gt 1 ]] && return

export TERM=xterm-256color
export TERMINAL=alacritty
export EDITOR=nvimn
export VISUAL=nvimn
export BROWSER=google-chrome-stable
export MANPAGER="nvimn +'set ft=man' -"
export MANWIDTH=80
# export GOPATH=$HOME/code/go

typeset -aU path
path=(
    # $GOPATH/bin
    $HOME/bin
    $path
)

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx
fi
