{ pkgs, ... }:

{
  home.username = "zyun";
  # home.homeDirectory = "/Users/zyun";
  home.stateVersion = "24.05";
  home.language.base = "en_US.UTF-8";

  home.packages = with pkgs; [
    neovim
    mise
    ripgrep
    bat
    fd
    htop
    aws-vault
    _1password
    awscli2
    rye
    terraform
    jq
    nkf
    kubernetes-helm
    postgresql
    minio-client
    fzf
    aria2
    ookla-speedtest
    ffmpeg
    rain
    gh
  ];

  home.file = {};

  home.sessionVariables = {
     VAR1 = "hoge";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    aliases = {
      br = "branch";
      cm = "commit";
      st = "status";
      df = "diff";
      dfc = "diff --cached";
      lg = "log --graph --online --decorate";
      ll = "log --graph --date=relative --name-status --abbrev-commit";
      sl = "log --graph --oneline --date=relative --abbrev-commit";
      rs = "reset";
    };
    extraConfig = {
      core = {
        editor = "vim";
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
    };
    ignores = [
      "*~"
      "*.swp"
      ".DS_Store"
      ".direnv"
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
      #enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

  #programs.bash.enable = true; # see note on other shells below

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
