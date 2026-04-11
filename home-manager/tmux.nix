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
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    aggressiveResize = true;
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
