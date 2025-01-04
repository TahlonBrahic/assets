{
  description = "Nix flakes that aggregates assets from multiple sources.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    haumea.url = "github:nix-community/haumea/v0.2.2";
  };

  outputs = inputs: {
    wallpapers = inputs.haumea.lib.load {
      src = ./wallpapers;
      loader = inputs.haumea.lib.matchers.extension ["png" "jpg" "jpeg"];
      inputs = {inherit (inputs.nixpkgs) lib;};
    };
    themes = inputs.haumea.lib.load {
      src = ./themes;
      loader = inputs.haumea.lib.matchers.extension ["yaml"];
      inputs = {inherit (inputs.nixpkgs) lib;};
    };
    gifs = inputs.haumea.lib.load {
      src = ./gifs;
      loader = inputs.haumea.lib.matchers.always;
      inputs = {inherit (inputs.nixpkgs) lib;};
    };
  };
}
