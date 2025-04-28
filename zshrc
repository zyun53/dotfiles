# vim: foldmethod=marker

export LC_CTYPE="en_US.UTF-8"
export GPG_TTY=$(tty)

export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.docker/bin:$PATH"

eval "$(sheldon source)"

eval "$(starship init zsh)"

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

## fzf {{{
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
## fbr - checkout git branch
#fbr() {
#  local branches branch
#  branches=$(git branch -vv) &&
#  branch=$(echo "$branches" | fzf +m) &&
#  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#}
#
## fd - cd to selected directory
#fd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune \
#                  -o -type d -print 2> /dev/null | fzf +m) &&
#  cd "$dir"
#}
#
#function ghq-fzf() {
#  local src=$(ghq list | fzf --preview "ls -laTp $(ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
#  if [ -n "$src" ]; then
#    BUFFER="cd $(ghq root)/$src"
#    zle accept-line
#  fi
#  zle -R -c
#}
#zle -N ghq-fzf
#bindkey '^]' ghq-fzf
##}}}
#
## pnpm {{{
#export PNPM_HOME="$HOME/Library/pnpm"
#case ":$PATH:" in
#  *":$PNPM_HOME:"*) ;;
#  *) export PATH="$PNPM_HOME:$PATH" ;;
#esac
## }}}
#
## bun {{{
#[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
#export BUN_INSTALL="$HOME/.bun"
#export PATH="$BUN_INSTALL/bin:$PATH"
## }}}
#
## Deno {{{
#export DENO_INSTALL="$HOME/.deno"
#export PATH="$DENO_INSTALL/bin:$PATH"
## }}}
#
## homebrew {{{
#export HOMEBREW_PREFIX="/opt/homebrew";
#export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
#export HOMEBREW_REPOSITORY="/opt/homebrew";
#export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
#[ -z "${MANPATH-}" ] || export MANPATH=":${MANPATH#:}";
#export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
## }}}
#
#source aws_zsh_completer.sh
