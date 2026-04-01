{
  self,
  hostPlatform,
  ...
}:
{
  nixpkgs = {
    #overlays = [
    #  inputs.neovim-nightly-overlay.overlays.default
    #  inputs.claude-code.overlays.default
    #];
    config = {
      allowUnfree = true;
    };
  };

  users.users.zyun.home = "/Users/zyun";
  imports = [
    ./home_manager.nix
  ];

  system = {
    stateVersion = 6;
    primaryUser = "zyun";
  };


  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.enable = false;

  programs.zsh.enable = true;

  security.pam.services.sudo_local.touchIdAuth = true;
  system.defaults = {
        #NSGlobalDomain.AppleShowAllExtensions = true;
        finder = {
          AppleShowAllExtensions = true;
          FXPreferredViewStyle = "Nlsv";
          FXEnableExtensionChangeWarning = false;
          ShowPathbar = true;
          ShowStatusBar = true;
        };
        dock = {
          autohide = true;
          show-recents = false;
          orientation = "bottom";
          tilesize = 50;
          magnification = true;
          largesize = 64;
          mineffect = "scale";
          launchanim = false;
        };
  };
}
