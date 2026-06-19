{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    clock24 = true;
    mouse = true;
    keyMode = "vi";
    historyLimit = 100000;
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    aggressiveResize = true;
    extraConfig = ''
      bind-key x kill-pane          # skip "kill-pane 1? (y/n)" prompt
      set -g detach-on-destroy off  # don't exit from tmux when closing a session

      bind-key "s" run-shell "sesh connect \"$(
      sesh list --icons | fzf-tmux -p 50%,50% \
      --no-sort --ansi --border-label ' sesh ' --prompt '⚡  ' \
      --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
      --bind 'tab:down,btab:up' \
      --bind 'ctrl-a:change-prompt(⚡  )+reload(sesh list --icons)' \
      --bind 'ctrl-t:change-prompt(🪟  )+reload(sesh list -t --icons)' \
      --bind 'ctrl-g:change-prompt(⚙️  )+reload(sesh list -c --icons)' \
      --bind 'ctrl-x:change-prompt(📁  )+reload(sesh list -z --icons)' \
      --bind 'ctrl-f:change-prompt(🔎  )+reload(fd -d 2 -t d -E .Trash . ~)' \
      --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(⚡  )+reload(sesh list --icons)' \
      --bind 'ctrl-n:print-query' \
      --preview-window 'right:55%' \
      --preview 'sesh preview {}'
      )\""
    '';
    plugins = with pkgs.tmuxPlugins; [
            {
        plugin = rose-pine;
        extraConfig = ''
          set -g @rose_pine_variant 'main'
          set -g @rose_pine_date_time '%H:%M' 
        '';
      }
    ];
  };
}
