{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay/1518b9605521d98418860f0eafffaf0c87c29bd3";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wezterm = {
      url = "github:wezterm/wezterm?dir=nix";
    };
    acc_utils = {
      url = "github:hidehic0/acc_utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    tpfl = {
      url = "github:hidehic0/tpfl";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    custom-completion-zsh = {
      url = "github:hidehic0/custom-completion-zsh";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    prime-generator = {
      url = "github:hidehic0/prime-generator";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    binomial_coefficient-calc-cli = {
      url = "github:hidehic0/binomial_coefficient-calc-cli";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
    };
    grub2-themes = {
      url = "github:vinceliuice/grub2-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    git-hooks-nix.inputs.nixpkgs.follows = "nixpkgs";
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dpp-vim = {
      url = "github:Shougo/dpp.vim";
      flake = false;
    };
    dpp-ext-lazy = {
      url = "github:Shougo/dpp-ext-lazy";
      flake = false;
    };
    dpp-ext-toml = {
      url = "github:Shougo/dpp-ext-toml";
      flake = false;
    };
    dpp-ext-installer = {
      url = "github:Shougo/dpp-ext-installer";
      flake = false;
    };
    dpp-protocol-git = {
      url = "github:Shougo/dpp-protocol-git";
      flake = false;
    };
    denops-vim = {
      url = "github:vim-denops/denops.vim";
      flake = false;
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
      prime-generator,
      binomial_coefficient-calc-cli,
      grub2-themes,
      flake-parts,
      git-hooks-nix,
      sops-nix,

      # dpp関連
      dpp-vim,
      dpp-ext-lazy,
      dpp-ext-toml,
      dpp-ext-installer,
      dpp-protocol-git,
      denops-vim,
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

      checks.x86_64-linux = {
        pre-commit-check = inputs.git-hooks-nix.lib.x86_64-linux.run {
          src = ./.;
          hooks = {
            gitleaks = {
              enable = true;
              entry = "${pkgs.gitleaks}/bin/gitleaks protect --staged";
            };
          };
        };

      };

      devShells.x86_64-linux.default =
        let
          inherit (self.checks.x86_64-linux.pre-commit-check) shellHook enabledPackages;
        in
        pkgs.mkShell {
          inherit shellHook;
          buildInputs = enabledPackages;
          packages = with pkgs; [ gitleaks ];
        };

      packages."x86_64-linux".yaskkserv2 = pkgs.yaskkserv2;
      nixosConfigurations = {
        thinkpad-e14-gen6 = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            sops-nix.nixosModules.sops
            ./nixos/hosts/thinkpad-e14-gen6/default.nix
            grub2-themes.nixosModules.default
            home-manager.nixosModules.home-manager
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
