#!/usr/bin/env zsh

# For login shells. Sourced before zshrc.

# SHLVL indicates how many shells deep the user is
[[ -n $TMUX || $SHLVL -gt 1 ]] && return

export TERM=xterm-256color
export TERMINAL=kitty
export EDITOR=vim
export VISUAL=vim
export BROWSER=google-chrome-stable
export MANPAGER='less'
export MANWIDTH=80

typeset -aU path
path=(
    $HOME/bin
    $path
)

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx
fi
