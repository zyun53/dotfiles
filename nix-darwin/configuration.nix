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
  # nix.package = pkgs.nix;

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

# services = {
#   yabai = {
#     enable = true;
#     config = {
#       layout = "bsp";
#       mouse_modifier = "ctrl";
#       mouse_drop_action = "stack";
#       window_shadow = "float";
#       window_gap = "20";
#     };
#     extraConfig = ''
#       yabai -m signal --add event=display_added action="yabai -m rule --remove label=calendar && yabai -m rule --add app='Fantastical' label='calendar' display=east" active=yes
#       yabai -m signal --add event=display_removed action="yabai -m rule --remove label=calendar && yabai -m rule --add app='Fantastical' label='calendar' native-fullscreen=on" active=yes
#       yabai -m rule --add app='OBS' display=east
#       yabai -m rule --add app='Spotify' display=east

#       yabai -m rule --add app='Cardhop' manage=off
#       yabai -m rule --add app='Pop' manage=off
#       yabai -m rule --add app='System Settings' manage=off
#       yabai -m rule --add app='Timery' manage=off
#     '';
#   };
# };

}
