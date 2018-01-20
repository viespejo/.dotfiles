# eval `dircolors ~/.dir_colors`

# Check if zplug is installed
if [[ ! -d ~/.dotfiles/zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.dotfiles/zplug
  source ~/.dotfiles/zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.dotfiles/zplug/init.zsh

# plugins
zplug "modules/completion", from:prezto
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

zplug "plugins/git",   from:oh-my-zsh
zplug "djui/alias-tips"
zplug "modules/history", from:prezto
zplug "plugins/common-aliases", from:oh-my-zsh

zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"

# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:github, defer:0
# Theme!
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

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

#dircolor
# eval $(dircolors ~/.dotfiles/zsh/dircolors.dark)

# vi mode
KEYTIMEOUT=1
bindkey -v
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M vicmd '^G' what-cursor-position


# history substring
if zplug check zsh-users/zsh-history-substring-search; then
    # history-substring
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down

    bindkey '^P' history-substring-search-up
    bindkey '^N' history-substring-search-down
fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# bindkey shift tab
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi
# current vim mode in Pure theme
VIM_PROMPT="❯"
PROMPT='%(?.%F{magenta}.%F{red})${VIM_PROMPT}%f '

prompt_pure_update_vim_prompt() {
    zle || {
        print "error: pure_update_vim_prompt must be called when zle is active"
        return 1
    }
    VIM_PROMPT=${${KEYMAP/vicmd/❮}/(main|viins)/❯}
    zle .reset-prompt
}

function zle-line-init zle-keymap-select {
    prompt_pure_update_vim_prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

#####################################################################
# alias
#####################################################################
alias gk='gitk --all --date-order&'
alias ls='ls --color'
# XDebug PHP
alias phpxd='xd'
function xd {
    export XDEBUG_CONFIG="idekey=XDEBUG_VIESPEJO";
    php $*
    unset XDEBUG_CONFIG
}
alias tunnel_mysql_tresmadc19='echo '\''Connecting to tresmadc19...'\'';ssh -Nf tresmadc19 -L 3307:127.0.0.1:3306'
alias tunnel_mysql_tresbadc19='echo '\''Connecting to tresbadc19...'\'';ssh -Nf tresbadc19 -L 3309:127.0.0.1:3306'
alias tunnel_mysql_sesmavaltcv01='echo '\''Connecting to sesmavaltcv01...'\'';ssh -Nf vicente.espejo@sesmavaltcv01 -L 3310:127.0.0.1:3306'
alias tunnel_mysql_denver='echo '\''Connecting to denver...'\'';ssh -Nf vincente@denver -L 3308:127.0.0.1:3306'
alias tunnel_apache_denver='echo '\''Connecting to denver...'\'';ssh -Nf vincente@denver -L 172.19.115.171:9080:localhost:80'
alias gtt='cd /www/ZendApplications/tomtool'
alias vim='nvim'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# For directory and config shortcuts:
source ~/.config/zsh/.zshortcuts
