alias v='nvim'
alias vi='nvim'


alias lg='lazygit'
alias typora="open -a typora"
alias typora="open -a typora"
alias dotfiles="cd ~/src/github.com/zyun53/dotfiles"

alias t='todo.sh'

alias tm='tmux attach || tmux new-session'
alias ta='tmux attach -t'
alias tn='tmux new-session'
alias tl='tmux list-sessions'

alias z='zellij attach default --create'

alias nixre="darwin-rebuild switch --flake ~/src/github.com/zyun53/dotfiles"
alias nixgc="nix-collect-garbage -d"
alias nixq="nix-env -qaP"
alias nixupgrade="sudo -i sh -c 'nix-channel --update && nix-env -iA nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'"
alias nixup="nix-env -u"

alias script_start='script ~/work/scriptlogs/$(date +%Y-%m-%d_%H-%M-%S).txt'


# unix command
#fcd() {
#  local dir
#  dir=$(find ${1:-.} -path '*/\.*' -prune -o -type d -print 2> /dev/null | fzf +m) && cd "$dir"
#}
alias ls="ls -G"
alias grep="grep --color=always"
alias ..="cd .. && pwd"
alias ...="cd ../.. && pwd"
alias ....="cd ../../.. && pwd"

# git
alias g='git'
alias cz="git add . && git cz"
alias cm="git commit -m"
alias save="git add . && git commit -m"
alias amend="git commit --amend"
alias co="git switch"
alias cob="git switch -c"
alias rename="git branch -m"
alias del="git branch -d"
alias cur="git rev-parse --abbrev-ref head | pbcopy"
#fco() {
#  local branches branch
#  branches=$(git --no-pager branch -vv) &&
#  branch=$(echo "$branches" | fzf +m) &&
#  git switch $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
#}
alias mg="git merge"
alias pullf='(){git fetch origin $1 && git reset --hard origin/$1}'
alias refresh='git restore --staged . && git checkout . && git clean -df'
alias root="cd $(git rev-parse --show-toplevel)"

# kubernetes
alias k="kubectl"
