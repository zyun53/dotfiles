{ config, pkgs, nixpkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zyun";
  home.homeDirectory = "/Users/zyun";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
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
    rye
    terraform

    gh
    ghq

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

    go-task
    todo-txt-cli

#   ollama
#   wrangler
  ];


  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/zyun/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
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
      . ${../../zshrc}
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
  programs.alacritty = {
    enable = true;
    settings = {
      colors = {
        primary = {
          background = "#192330";
          foreground = "#cdcecf";
        };
        normal = {
          black   = "#393b44";
          red     = "#c94f6d";
          green   = "#81b29a";
          yellow  = "#dbc074";
          blue    = "#719cd6";
          magenta = "#9d79d6";
          cyan    = "#63cdcf";
          white   = "#dfdfe0";
        };
        bright = {
          black   = "#575860";
          red     = "#d16983";
          green   = "#8ebaa4";
          yellow  = "#e0c989";
          blue    = "#86abdc";
          magenta = "#baa1e2";
          cyan    = "#7ad5d6";
          white   = "#e4e4e5";
        };
      };
      cursor = {
        style = {
          blinking = "On";
        };
      };
      font = {
        size = 16;
        normal = {
          family = "PlemolJP Console NF";
          style = "Regular";
        };
        bold = {
          style = "Bold";
        };
        italic = {
          style = "Italic";
        };
        bold_italic = {
          style = "Bold Italic";
        };
      };
      window = {
        padding = {
          x = 4;
          y = 4;
        };
        dimensions = {
          columns = 100;
          lines = 40;
        };
      };
      scrolling = {
        history = 10000;
        multiplier = 3;
      };
      keyboard = {
        bindings = [
          { key = "Enter"; action = "ToggleFullscreen"; mods = "Command"; }
        ];
      };
    };
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
  };
}
