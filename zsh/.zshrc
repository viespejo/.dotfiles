# vim: foldmethod=marker
export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='less'

# STARSHIP PROMPT
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# Check if zplug is installed
if [[ ! -d ~/.dotfiles/zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.dotfiles/zplug
  source ~/.dotfiles/zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.dotfiles/zplug/init.zsh

# History
source $ZDOTDIR/history.zsh

# plugins
zplug "jeffreytse/zsh-vi-mode"
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug 'zsh-users/zsh-autosuggestions', defer:3

zplug "lib/completion", from:oh-my-zsh, defer:2
zplug 'zsh-users/zsh-completions', defer:3

zplug "plugins/git", from:oh-my-zsh
zplug "djui/alias-tips"
zplug "plugins/common-aliases", from:oh-my-zsh
#zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"
#zplug "b4b4r07/enhancd", use:init.sh
#zplug "skywind3000/z.lua"


# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load

# autosuggestions
bindkey '^ ' autosuggest-accept

# FZF 
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore --exclude .git --exclude node_modules --exclude .wine --exclude .vimundo'
export FZF_DEFAULT_OPTS='--ansi -m --reverse --inline-info'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f . $HOME"
export FZF_CTRL_T_OPTS="--query=$1 --height 100% --bind='?:toggle-preview' --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d . $HOME"
export FZF_ALT_C_OPTS="--height 100% --bind='?:toggle-preview' --preview 'tree -C -I \'node_modules|.git\' {} | head -200'"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude node_modules --exclude .wine --exclude .vimundo --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude node_modules --exclude .wine --exclude .vimundo --exclude ".git" . "$1"
}

# Define an init function and append to zvm_after_init_commands
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

zvm_after_init_commands+=(my_init)

# Install packages using yay (change to pacman/AUR helper of your choice)
function in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}


# bindkey shift tab
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi


# atuin shell history
. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"

#####################################################################
# alias
#####################################################################
alias gk='gitk --all --date-order&'
alias ls='ls --color=auto'
alias cat='bat --style=plain'
alias exa='exa --long --header --git'
# alias v='nvim'
# alias vn='$HOME/.dotfiles/scripts/nvim-nightly.sh'
# alias vn='nvimn'
alias t='task'
alias rm='rm -I --preserve-root'
alias setup:ts='$HOME/.dotfiles/scripts/setup-ts-backend'
#####################################################################
# end alias
#####################################################################

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#dircolor
eval $(dircolors $ZDOTDIR/dircolors.dark)

# completion list-color 
eval $(dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# For directory and config shortcuts:
source ~/.dotfiles/zsh/.zshortcuts
# local config
[ -f ~/.dotfiles-local/zsh/zshrc_local ] && source ~/.dotfiles-local/zsh/zshrc_local
source /home/its32ve1/.dotfiles/zsh/.zshortcuts
