{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: let
  username = "zyun";
in {
  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "25.11";

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      inputs.arto.packages.${pkgs.system}.default
      claude-code # claude-code-nix
      neovim # nighly
      codex

      #git
      gh
      ghq
      lazygit
      git-wt

      openssh
      terminal-notifier

      yazi

      poppler-utils

      # zsh
      #zsh
      #sheldon
      #starship

      python314
      uv
      curl

      nodejs_24

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

      awscli2
      aws-vault
      granted

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
      whisper-cpp

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
      exiftool
    ];
  };

  programs.home-manager.enable = true;

  programs.eza = {
    enable = true;
    enableZshIntegration = false;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  imports = [
    ./git.nix
    ./zsh.nix
    ./tmux.nix
  ];

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
      "sv-*" = {
        user = "user99";
      };
      "nas-*" = {
        user = "user99";
      };
      "*" = {
        serverAliveInterval = 60;
        serverAliveCountMax = 3;
        identityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
    };
  };
}
