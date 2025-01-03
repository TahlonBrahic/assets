{
  description = "Nix flakes that aggregates assets from multiple sources.";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = inputs @ {
    flake-parts,
    self,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs self;}
    {
      debug = true;
      systems = ["x86_64-linux"];
      perSystem = {pkgs, ...}: {
        packages = {
          wallpapers = import ./wallpapers pkgs;
          themes = import ./themes pkgs;
        };
      };
      flake = {
      };
    };
}
