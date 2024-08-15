{
  description = "My NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    snowfall.url = "github:snowfall-org/snowfall";
  };

  outputs = { self, nixpkgs, flake-parts, snowfall }:
    flake-parts.lib.mkFlake {
      inherit self nixpkgs;

      systems = [ "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {

        snowfall.lib = snowfall.lib.mkLib {
          inherit inputs;

          modules = [
            ./modules/hardware
            ./modules/system
            ./modules/applications
          ];

          homes = {
            inherit (./home-manager) user1 user2;
          };
        };

        nixosConfigurations = {
          desktop = self'.snowfall.lib.mkSystem {
            modules = [
              ./systems/desktop.nix
            ];
          };

          laptop = self'.snowfall.lib.mkSystem {
            modules = [
              ./systems/laptop.nix
            ];
          };

          server = self'.snowfall.lib.mkSystem {
            modules = [
              ./systems/server.nix
            ];
          };
        };
      };
    };
}
