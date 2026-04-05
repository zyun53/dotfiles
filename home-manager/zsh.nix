{pkgs, ...}: {
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
    '';

    shellAliases = {
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
