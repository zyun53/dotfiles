{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    syntaxHighlighting.enable = true;

    history.extended = true;

    autosuggestion = {
      enable = true;
    };

    initExtra = ''
      function y() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          builtin cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      }
      t() {
         local session="''${1:-main}"
         tmux attach -t "$session" || tmux new -s "$session"
      }
      function ghq-fzf_change_directory() {
          # 選択したリポジトリへ移動 かつ
          # 右にリポジトリのディレクトリ詳細を表示
        local src=$(ghq list | fzf --preview "eza --color=always -l -g -a --icons --time-style iso $(ghq root)/{} | tail -n+4 | awk '{print \$5 \" \"\$6\" /\"\$8\" \"\$9 \" \" \$10}'")
        if [ -n "$src" ]; then
          BUFFER="cd $(ghq root)/$src"
          zle accept-line
        fi
        zle -R -c
      }
      zle -N ghq-fzf_change_directory
      bindkey '^]' ghq-fzf_change_directory
    '';

    shellAliases = {
      e   = "eza --git";
      l   = "e";
      ls  = "e";
      ea  = "eza -a --git";
      la  = "ea";
      ee  = "eza -aahl --git";
      ll  = "ee";
      et  = "eza -T -L 3 -a -I 'node_modules|.git|.cache'";
      lt  = "et";
      eta = "eza -T -a -I 'node_modules|.git|.cache' --color=always | less -r";
      lta = "eta";
      lc  = "clear && ls";

      cat = "bat";
      iso = "date '+%Y-%m-%dT%H:%M:%S%z'";
      dr = "direnv reload";

      assume = "source /etc/profiles/per-user/zyun/bin/assume";

      v = "nvim";
      vi = "nvim";

      tn = "tmux new";
      tl = "tmux list-sessions";

      g = "git";
      lg = "lazygit";
      root = "cd $(git rev-parse --show-toplevel)";
      k = "kubectl";
    };
  };
}
