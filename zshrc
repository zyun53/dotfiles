source ~/.zplug/init.zsh

#zplug "yous/vanilli.sh"
#zplug 'dracula/zsh', as:theme
#zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"
#zplug "tcnksm/docker-alias", use:zshrc
#zplug "k4rthik/git-cal", as:command, frozen:1
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"
#zplug "plugins/git",   from:oh-my-zsh

# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

# syntax hignlihg(https://github.com/zsh-users/zsh-syntax-highlighting)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "modules/tmux",       from:prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
zplug "modules/ssh",        from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/directory",  from:prezto
#zplug "modules/completion", from:prezto

# タイプ補完
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
# hisotry
zplug "zsh-users/zsh-history-substring-search"

# theme (https://github.com/sindresorhus/pure#zplug)
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

#zplug "modules/tmux",       from:prezto
#zplug "modules/history",    from:prezto
#zplug "modules/utility",    from:prezto
#zplug "modules/ssh",        from:prezto
#zplug "modules/terminal",   from:prezto
#zplug "modules/directory",  from:prezto
#zplug "modules/completion", from:prezto

#zplug "mollifier/anyframe"

#zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

# alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi=vim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff -u'
else
  alias diff='diff -u'
fi

# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=1000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# スペースで始まるコマンド行はヒストリリストから削除
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# 余分な空白は詰めて記録
setopt hist_reduce_blanks  

# 古いコマンドと同じものは無視 
setopt hist_save_no_dups

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開         
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

autoload -U compinit
compinit

export PATH=~/.local/bin:~/.go/bin:/usr/local/go/bin:$PATH
export GOPATH=~/.go

[[ -s /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh

# added by travis gem
[ -f /home/zyun/.travis/travis.sh ] && source /home/zyun/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
