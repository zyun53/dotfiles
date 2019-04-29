export LANG="en_US.UTF-8"

case ${OSTYPE} in
  darwin*)
    source /usr/local/opt/zplug/init.zsh
    ;;
  linux*)
    source ~/.zplug/init.zsh
    ;;
esac

export PATH=~/.local/bin:~/.go/bin:/usr/local/go/bin:$PATH
export GOPATH=~/.go

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

zplug "MichaelAquilina/zsh-autoswitch-virtualenv"

# hisotry
zplug "zsh-users/zsh-history-substring-search"

# theme (https://github.com/sindresorhus/pure#zplug)
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug "coinbase/assume-role", \
    as:command, \
    use:"assume-role"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=1000 # メモリに保存される履歴の件数
export SAVEHIST=100000 # 履歴ファイルに保存される履歴の件数
setopt hist_ignore_dups # 重複を記録しない
setopt EXTENDED_HISTORY # 開始と終了を記録

setopt hist_ignore_all_dups # ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_space # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_reduce_blanks # 余分な空白は詰めて記録
setopt hist_save_no_dups # 古いコマンドと同じものは無視
setopt hist_no_store # historyコマンドは履歴に登録しない
setopt hist_expand # 補完時にヒストリを自動的に展開
setopt inc_append_history # 履歴をインクリメンタルに追加

# インクリメンタルからの検索
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

autoload -U compinit
compinit

[[ -s /usr/local/bin/aws_zsh_completer.sh ]] && source /usr/local/bin/aws_zsh_completer.sh
[[ -s ~/.local/bin/aws_zsh_completer.sh ]] && source ~/.local/bin/aws_zsh_completer.sh

[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source $(which assume-role)

[ -d ~/.composer/vendor/bin ] && export PATH=~/.composer/vendor/bin:$PATH
[ -d ~/.config/composer/vendor/bin ] && export PATH=~/.config/composer/vendor/bin:$PATH

export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"

case ${OSTYPE} in
    darwin*)
        source ~/dotfiles/zshrc.darwin
        ;;
    linux*)
        source ~/dotfiles/zshrc.linux
        ;;
esac

source ${HOME}/.aliases
