{
  description = "Minimal package definition for aarch64-darwin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    claude-code.url = "github:sadjow/claude-code-nix";
    arto.url = "github:arto-app/Arto";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-darwin,
    ...
  } @ inputs: let
    system = "aarch64-darwin";
    pkgs = import nixpkgs {inherit system;};
  in {
    darwinConfigurations."iz-macbook" = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit inputs;};
      modules = [
        {
          nixpkgs = {
            overlays = [
              inputs.neovim-nightly-overlay.overlays.default
              inputs.claude-code.overlays.default
            ];
          };
        }
        ./nix-darwin/configuration.nix
        home-manager.darwinModules.home-manager
      ];
    };
  };
}
