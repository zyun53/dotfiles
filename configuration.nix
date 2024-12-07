{ pkgs, ... }:

{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs.home-manager
    ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";


  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  #system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

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
      "font-plemol-jp"
      "font-plemol-jp-nf"
      "font-udev-gothic-nf"
      "font-plemol-jp-hs"
      "font-udev-gothic"
      "aerospace"
      "sequel-ace"
      "sublime-text"
    ];
  };
}
