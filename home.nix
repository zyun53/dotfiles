{ config, pkgs, ... }:

{
  home.username = "zyun";
  home.homeDirectory = "/Users/zyun";
  home.stateVersion = "24.11";
  home.language.base = "en_US.UTF-8";

  home.packages = with pkgs; [
    gnutar
    neovim
    mise
    ripgrep
    bat
    fd
    htop
    colordiff
    graphviz

    aws-vault
    _1password-cli
    awscli2
    aws-sam-cli
    rye
    terraform

    gnupg
    qrencode
    yubikey-personalization
    yubikey-manager
    pinentry_mac
    wget
    aerospace

    gh
    ghq

    #
    # Font
    #
    plemoljp
    plemoljp-nf
    plemoljp-hs
    udev-gothic
    udev-gothic-nf

    # for query
    jq
    yq
    csvq

    nkf
    kubernetes-helm
    kubectl
    postgresql
    minio-client
    fzf
    skim # Command-line fuzzy finder written in Rust
    aria2
    ookla-speedtest
    ffmpeg
    rain
    bottom
    zellij
    watch
    hey
    mtr
    hping
    nmap
    colima
    docker
    xz

    go-task
    todo-txt-cli

    globalping-cli
    jankyborders

#   ollama
#   wrangler
  ];


  home.file = {};

  home.sessionVariables = {
     VAR1 = "hoge";
  };

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    history = {
      extended = true;
      path = "${config.xdg.dataHome}/zsh/.zsh_history";
      save = 1000000;
      size = 1000000;
    };
    syntaxHighlighting = {
      enable = true;
    };
    initExtra = ''
      . ${./zshrc}
    '';
  };

  programs.git = {
    enable = true;

    aliases = {
      a = "add";
      p = "push";
      s = "status";
      sw = "switch";
      br = "branch";
      cm = "commit";
      st = "status";
      df = "diff";
      dfc = "diff --cached";
      lg = "log --graph --oneline --decorate";
      ll = "log --graph --date=relative --name-status --abbrev-commit";
      sl = "log --graph --oneline --date=relative --abbrev-commit";
      rs = "reset";
    };
    extraConfig = {
      core = {
        editor = "nvim";
      };
      advice = {
        skippedCherryPicks = false;
      };
      color = {
        ui = "auto";
      };
      user = {
        useConfigOnly = true;
      };
      init = {
        defaultBranch = "main";
      };
      merge = {
        conflictStyle = "diff3";
        ff = false;
      };
      pull = {
        ff = "only";
      };
      push = {
        default = "current";
      };
      rebase = {
        autosquash = true;
        autostash = true;
        stat = true;
      };
      rerere = {
        enabled = true;
      };
      ghq = {
        root = "~/src";
      };
      #commit = {
      #  gpgsign = false;
      #};
    };
    ignores = [
      "*~"
      "*.swp"
      ".direnv"
      ".log"
      ".DS_Store"
      ".DS_Store?"
      "._*"
      ".Spotlight-V100"
      ".Trashes"
      "ehthumbs.db"
      "Thumbs.db"
      ".idea*"
      "node_modules"
    ];
    #signing = {
    #  key = "";
    #};
  };

  services.jankyborders.enable =  true;
  services.jankyborders.settings = {
    style          = "round";
    width          = "5.0";
    hidpi          = "on";
    active_color   = "0xff32a879";
    inactive_color = "0xff494d64";
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  programs.bash.enable = true; # see note on other shells below
  programs.tmux = {
    enable = true;

    baseIndex = 0;
    clock24 = true;
    escapeTime = 1;
    historyLimit = 100000;
    keyMode = "vi";
    newSession = false;
    prefix = "C-a";
    shell = pkgs.lib.getExe pkgs.zsh;
    terminal = "screen-256color";
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    aggressiveResize = true;

    plugins = with pkgs;
      [
        tmuxPlugins.yank
        tmuxPlugins.urlview
        {
          plugin = tmuxPlugins.prefix-highlight;
          extraConfig = ''
            set -g status-fg 'green'
            set -g status-bg 'black'
            
            set -g status-left " #S | #I.#P | "
            set -g status-right '#{prefix_highlight} | #[fg=green]%a %Y-%m-%d %H:%M | #H '
            
            setw -g window-status-format ' #I:#W #F '
            setw -g window-status-current-format '#[bg=colour240] #I:#W #F '
            set -g @prefix_highlight_show_copy_mode 'on'
            set -g @prefix_highlight_show_sync_mode 'on'
          '';
        }
      ];
    extraConfig = ''
      source ${./tmux.conf}
    '';

  };
}
