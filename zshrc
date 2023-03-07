# vim: foldmethod=marker

export LC_CTYPE="en_US.UTF-8"

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# Snippet
#zinit snippet https://gist.githubusercontent.com/hightemp/5071909/raw/

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

zinit snippet PZTM::ssh

# }}}

# ALIAS {{{
alias v='nvim'
alias vi='nvim'
alias g='git'

alias lg='lazygit'
alias k='kubectl'
alias typora="open -a typora"
alias typora="open -a typora"
alias dotfiles="cd ~/src/github.com/zyun-i/dotfiles"
alias diff='colordiff -u'

alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
# }}}

# History {{{

# History environment variables
HISTFILE=${HOME}/.zsh_history
HISTSIZE=120000  # Larger than $SAVEHIST for HIST_EXPIRE_DUPS_FIRST to work
SAVEHIST=100000

setopt EXTENDED_HISTORY       # Save time stamps and durations
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicates first
setopt HIST_IGNORE_DUPS       # Do not enter 2 consecutive duplicates into history
setopt HIST_IGNORE_SPACE      # Ignore command lines with leading spaces
setopt HIST_VERIFY            # Reload results of history expansion before executing
setopt INC_APPEND_HISTORY     # Constantly update $HISTFILE
setopt SHARE_HISTORY          # Constantly share history between shell instances

# }}}

export PATH=$PATH:/usr/local/go/bin
