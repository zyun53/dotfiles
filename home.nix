{ config, pkgs, ... }:

{
  home.username = "zyun";
  home.homeDirectory = "/Users/zyun";

  home.stateVersion = "23.11";

  home.packages = [
    pkgs.ripgrep
    pkgs.bat
  ];

  home.file = {

  home.sessionVariables = {
  #  EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;

    userName = "Isida Zyun'iti";
    userEmail = "mail@zyun.jp";
    aliases = {
      br = "branch";
      co = "checkout";
      st = "status";
    };
  };
}
