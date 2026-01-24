{ config, pkgs, ... }:

{
  home.username = "zyun";
  home.homeDirectory = "/Users/zyun";

  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    silicon # Create beautiful image of your source code.
    gnutar
    neovim
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
    # awscli2 <- mise
    #aws-sam-cli

    gnupg
    qrencode
    yubikey-personalization
    yubikey-manager
    pinentry_mac
    wget

    gh
    ghq
    lazygit
    git-wt

    # zsh
    zsh
    sheldon
    starship

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

    tart
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
    tmux
    watch
    hey
    mtr
    hping
    nmap
    rustscan
    colima
    docker
    xz

    go-task
    todo-txt-cli

    globalping-cli
    jankyborders

    ldns
  ];

  programs.home-manager.enable = true;

  programs.zsh = {
    enable = false;
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
    initContent = ''
      . ${./zshrc}
    '';
  };

  programs.git = {
    enable = true;

    settings = {
      alias = {
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
      wt = {
        basedir = ".worktrees";
      };
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
        credential.helper = "store";
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
  };

  services.jankyborders.enable =  false;
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

  programs.bash.enable = false;
  programs.tmux = {
    enable = true;
    shell = pkgs.lib.getExe pkgs.zsh;
    terminal = "tmux-256color";

    baseIndex = 1;
    clock24 = true;
    escapeTime = 1;
    #historyLimit = 10000;
    keyMode = "vi";
    newSession = false;
    prefix = "C-a";
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    aggressiveResize = true;

    plugins = with pkgs;
      [
        tmuxPlugins.sensible
        tmuxPlugins.tmux-fzf
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
      set -g default-command ${pkgs.zsh}/bin/zsh
      source ${./tmux.conf}
    '';

  };
}
