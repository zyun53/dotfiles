{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "zyun";
in {
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "25.11";

    packages = with pkgs; [
      neovim # nighly

      #git
      gh
      ghq
      lazygit
      git-wt

      openssh

      # zsh
      #zsh
      #sheldon
      #starship

      curl

      alejandra

      silicon # Create beautiful image of your source code.
      gnutar
      mise
      ripgrep
      bat
      fd
      htop
      colordiff
      graphviz
      _1password-cli

      coreutils
      fdupes
      rclone
      inetutils

      dprint # Code formatting platform written in Rust

      aws-vault
      awscli2

      #pipx

      gnupg
      qrencode
      yubikey-personalization
      yubikey-manager
      pinentry_mac
      wget

      # Font
      plemoljp
      plemoljp-nf
      plemoljp-hs
      udev-gothic
      udev-gothic-nf

      # for query
      jq
      yq
      csvq

      #tart # macOS and Linux VMs on Apple Silicon to use in CI and other automations
      nkf
      #kubernetes-helm
      #kubectl
      #postgresql
      minio-client
      fzf
      #skim # Command-line fuzzy finder written in Rust
      aria2
      ookla-speedtest
      ffmpeg

      #rain
      #bottom
      watch
      hey
      mtr
      hping
      nmap
      rustscan # The Modern Port Scanner
      colima
      xz

      globalping-cli

      ldns
    ];
  };

  programs.home-manager.enable = true;

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    syntaxHighlighting.enable = true;

    history.extended = true;

    autosuggestion = {
      enable = true;
    };

    shellAliases = {
      cat = "bat";
      iso = "date '+%Y-%m-%dT%H:%M:%S%z'";
      dr = "direnv reload";

      v = "nvim";
      vi = "nvim";

      t = "tmux attach -t main || tmux new -s main";
      tn = "tmux new";
      tl = "tmux list-sessions";

      g = "git";
      lg = "lazygit";
      root = "cd $(git rev-parse --show-toplevel)";
      k = "kubectl";
    };
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    prefix = "C-a";
    clock24 = true;
    mouse = true;
    keyMode = "vi";
    terminal = "screen-256color";
#   shell = pkgs.lib.getExe pkgs.zsh;
#   shell = pkgs.lib.getExe pkgs.zsh;
    shell = "${pkgs.zsh}/bin/zsh";
     customPaneNavigationAndResize = true;
     disableConfirmationPrompt = true;
     aggressiveResize = true;
     plugins = with pkgs; [
       tmuxPlugins.sensible
       tmuxPlugins.tmux-fzf
       tmuxPlugins.yank
       tmuxPlugins.urlview
       {
         plugin = tmuxPlugins.prefix-highlight;
         extraConfig = ''
           set -g status-fg 'green'
           set -g status-bg 'black'
 
           set -g status-left " #S | "
           set -g status-right '#{prefix_highlight} | #[fg=green]%a %Y-%m-%d %H:%M | #H '
 
           setw -g window-status-format ' #I:#W #F '
           setw -g window-status-current-format '#[bg=colour240] #I:#W #F '
           set -g @prefix_highlight_show_copy_mode 'on'
           set -g @prefix_highlight_show_sync_mode 'on'
         '';
       }
     ];
   extraConfig = ''
     set -g default-command ${pkgs.zsh}/bin/zsh
  '';

  };

  programs.git = import ./git.nix;
  programs.delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        dark = true;
    };
  };
  programs.ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
            identityAgent = "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
	};
      };
  };

}
