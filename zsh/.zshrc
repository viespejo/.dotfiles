# vim: foldmethod=marker

export EDITOR=nvim
export VISUAL=nvim
export MANPAGER='less'

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
#zplug "lukechilds/zsh-nvm"

zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "zsh-users/zsh-history-substring-search"
zplug 'zsh-users/zsh-autosuggestions', defer:3

zplug "lib/completion", from:oh-my-zsh, defer:2
zplug 'zsh-users/zsh-completions', defer:3

zplug "plugins/git", from:oh-my-zsh
zplug "djui/alias-tips"
zplug "plugins/common-aliases", from:oh-my-zsh

#zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"
#zplug "b4b4r07/enhancd", use:init.sh

# Async for zsh, used by pure
# zplug "mafredri/zsh-async", from:github, defer:0
#
# Theme!
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#
zplug "skywind3000/z.lua"


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


# # shift tab completion
# zmodload zsh/complist
# bindkey -M menuselect '^[[Z' reverse-menu-complete


# vi mode
KEYTIMEOUT=1
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd '^G' what-cursor-position



# autosuggestions
bindkey '^ ' autosuggest-accept

# FZF {{{
export FZF_DEFAULT_COMMAND='fd --hidden --no-ignore --follow --exclude .git --exclude node_modules --exclude .wine --exclude .vimundo'
export FZF_DEFAULT_OPTS='--ansi -m --reverse --inline-info'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND --type f"
export FZF_CTRL_T_OPTS="--query=$1 --height 100% --bind='?:toggle-preview' --preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
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
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Install packages using yay (change to pacman/AUR helper of your choice)
function in() {
    yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

# }}}

# History Substring search {{{
if zplug check zsh-users/zsh-history-substring-search; then
# history substring
    # history-substring
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down

    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=green,fg=black,bold'
    HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=red,fg=white,bold'
    HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS='i'
fi
#}}}
# bindkey shift tab
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi

# spaceship custom
eval spaceship_vi_mode_enable
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# export SPACESHIP_GIT_SYMBOL=''
# export SPACESHIP_GIT_BRANCH_PREFIX='git:'
export SPACESHIP_GIT_STATUS_PREFIX='['
export SPACESHIP_GIT_STATUS_SUFFIX=']'
export SPACESHIP_GIT_STATUS_UNTRACKED='?'
export SPACESHIP_GIT_STATUS_ADDED='A'
export SPACESHIP_GIT_STATUS_MODIFIED='M'
export SPACESHIP_GIT_STATUS_COLOR='magenta'
export SPACESHIP_GIT_STATUS_RENAMED='R'
export SPACESHIP_GIT_STATUS_DELETED='D'
export SPACESHIP_GIT_STATUS_STASHED=''
export SPACESHIP_GIT_STATUS_UNMERGED=''
export SPACESHIP_GIT_STATUS_AHEAD='<ahead>'
export SPACESHIP_GIT_STATUS_BEHIND='<behind>'
export SPACESHIP_GIT_STATUS_DIVERGED=''
export SPACESHIP_EXIT_CODE_SHOW=true
export SPACESHIP_EXIT_CODE_SYMBOL=''
export SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  exit_code     # Exit code section
  char          # Prompt character
)
# current vim mode in Pure theme
# VIM_PROMPT="❯"
# PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

# prompt_pure_update_vim_prompt() {
#     zle || {
#         print "error: pure_update_vim_prompt must be called when zle is active"
#         return 1
#     }
#     VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
#     zle .reset-prompt
# }

# function zle-line-init zle-keymap-select {
#     prompt_pure_update_vim_prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

#####################################################################
# alias
#####################################################################
alias gk='gitk --all --date-order&'
alias ls='ls --color=auto'
alias cat='bat --style=plain'
alias exa='exa --long --header --git'
alias vim='nvim'
alias v='nvim'
# alias vn='$HOME/.dotfiles/scripts/nvim-nightly.sh'
alias vn='nvimn'
alias t='task'
alias rm='rm -I --preserve-root'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#dircolor
eval $(dircolors $ZDOTDIR/dircolors.dark)

# completion list-color 
eval $(dircolors)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# For directory and config shortcuts:
source /home/its32ve1/.dotfiles/zsh/.zshortcuts
# local config
[ -f ~/.dotfiles-local/zsh/zshrc_local ] && source ~/.dotfiles-local/zsh/zshrc_local
