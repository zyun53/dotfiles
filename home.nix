{ config, pkgs, ... }:

{
  home.username = "zyun";
  home.homeDirectory = "/Users/zyun";

  home.stateVersion = "23.11";
  home.language.base = "en_US.UTF-8";

  home.packages = [
    pkgs.ripgrep
    pkgs.bat
    pkgs.fd
    pkgs.htop
  ];

  home.file = {};

  home.sessionVariables = {
  #  EDITOR = "nvim";
     VAR1 = "hoge";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "Isida Zyun'iti";
    userEmail = "mail@zyun.jp";
    aliases = {
      br = "branch";
      co = "commit";
      st = "status";
      df = "diff";
      dfc = "diff --cached";
      lg = "log --oneline --graph --decorate";
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

  programs.tmux = {
    enable = true;

    baseIndex = 0;
    clock24 = true;
    escapeTime = 1;
    extraConfig = ''
      source ${./tmux.conf}
    '';
    historyLimit = 100000;
    keyMode = "vi";
    newSession = false;
    prefix = "C-a";
    shell = pkgs.lib.getExe pkgs.zsh;
    terminal = "screen-256color";
  };
}
