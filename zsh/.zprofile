#!/usr/bin/env zsh

# For login shells. Sourced before zshrc.

# SHLVL indicates how many shells deep the user is
[[ -n $TMUX || $SHLVL -gt 1 ]] && return

export TERM=xterm-256color
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=google-chrome-stable
export MANPAGER="nvim +'set ft=man' -"
export MANWIDTH=80
export GOPATH=$HOME/code/go
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

typeset -aU path
path=(
    $GOPATH/bin
    $HOME/bin
    $path
)

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	startx
fi
