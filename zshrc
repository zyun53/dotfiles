# vim: foldmethod=marker

export LC_CTYPE="en_US.UTF-8"
export PATH=$PATH:/usr/local/go/bin
export GPG_TTY=$(tty)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"

# zinit {{{
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
alias dotfiles="cd ~/src/github.com/zyun53/dotfiles"
alias diff='colordiff -u'

alias t='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
alias z='zellij attach --index 0 --create'

alias nixre="darwin-rebuild switch --flake ~/src/github.com/zyun53/dotfiles"
alias nixgc="nix-collect-garbage -d"
alias nixq="nix-env -qaP"
alias nixupgrade="sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'"
alias nixup="nix-env -u"
alias nixcfg="nvim ~/.nixpkgs/darwin-configuration.nix"
# }}}

# History {{{
HISTFILE=${HOME}/.zsh_history
HISTORY_IGNORE="(cd|pwd|l[sal])"
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

# fzf {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

function ghq-fzf() {
  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if [ -n "$src" ]; then
    BUFFER="cd $(ghq root)/$src"
    zle accept-line
  fi
  zle -R -c
}
zle -N ghq-fzf
bindkey '^]' ghq-fzf
#}}}

# pnpm {{{
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# }}}

# bun {{{
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# }}}

# carg {{{
eval "$(mise activate zsh)"
. "$HOME/.cargo/env"
# }}}

# Deno {{{
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
# }}}

# homebrew {{{
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
# }}}
