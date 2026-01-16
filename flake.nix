{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wezterm/wezterm?dir=nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    acc_utils = {
      url = "github:hidehic0/acc_utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tpfl = {
      url = "github:hidehic0/tpfl";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    custom-completion-zsh = {
      url = "github:hidehic0/custom-completion-zsh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      neovim-nightly-overlay,
      rust-overlay,
      acc_utils,
      tpfl,
      ...
    }:
    let
      yaskkOverlay = final: prev: {
        yaskkserv2 = final.callPackage ./my-nix-packages/yaskkserv2 {
        };
      };
      pkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
        overlays = [
          inputs.neovim-nightly-overlay.overlays.default
          inputs.rust-overlay.overlays.default
          yaskkOverlay
        ];
      };
    in

    {
      packages."x86_64-linux".yaskkserv2 = pkgs.yaskkserv2;
      nixosConfigurations = {
        myNixOS = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
          ];
        };
        thinkpad-e14-gen6 = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos/hosts/thinkpad-e14-gen6/default.nix
          ];
        };
      };
      homeConfigurations = {
        myHome = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
          extraSpecialArgs = {
            inherit inputs;
          };
        };
      };
    };
}
