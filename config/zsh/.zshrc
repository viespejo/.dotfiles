# Check if zplug is installed
if [[ ! -d ~/.dotfiles/zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.dotfiles/zplug
  source ~/.dotfiles/zplug/init.zsh && zplug update --self
fi

# Essential
source ~/.dotfiles/zplug/init.zsh

# plugins
#zplug "lukechilds/zsh-nvm"
zplug "modules/completion", from:prezto
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "buonomo/yarn-completion", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:3

zplug "plugins/git",   from:oh-my-zsh
zplug "djui/alias-tips"
zplug "modules/history", from:prezto
zplug "plugins/common-aliases", from:oh-my-zsh

#zplug "tmuxinator/tmuxinator", use:"completion/tmuxinator.zsh"
#zplug "b4b4r07/enhancd", use:init.sh
zplug "skywind3000/z.lua"

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
alias vim='nvim'
alias v='nvim'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#dircolor
eval $(dircolors ~/.dotfiles/config/zsh/dircolors.dark)

# For directory and config shortcuts:
source ~/.config/zsh/.zshortcuts
# local config
[ -f ~/.zshrc_local ] && source ~/.zshrc_local
