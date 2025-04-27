{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
        url = "github:nix-darwin/nix-darwin/master";
        inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, home-manager, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      environment.systemPackages = [];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      nixpkgs.config.allowUnfree = true;

      users.users.zyun = {
        name = "zyun";
        home = "/Users/zyun";
      };

      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "uninstall";
        };
        brews = [
          "kayac/tap/ecspresso"
        ];
        taps = [
          "kayac/homebrew-tap"
          "dracula/install"
          "nikitabobko/tap"
          "homebrew/cask-fonts"
        ];
        casks = [
          "finch"
          "sequel-ace"
          "sublime-text"
        ];
      };

      system.defaults = {
        NSGlobalDomain.AppleShowAllExtensions = true;
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
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#mac-732
    darwinConfigurations."mac-732" = nix-darwin.lib.darwinSystem {
      modules = [
          configuration
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zyun = ./home.nix;
          }
      ];
    };
  };
}
