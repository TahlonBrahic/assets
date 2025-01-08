{
  description = "Nix flakes that aggregates assets from multiple sources.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    haumea.url = "github:nix-community/haumea/v0.2.2";
  };

  outputs = inputs: {
    wallpapers = inputs.haumea.lib.load {
      src = ./wallpapers;
      loader = [
        (inputs.haumea.lib.matchers.always inputs.haumea.lib.loaders.path)
      ];
    };

    themes = inputs.haumea.lib.load {
      src = ./themes;
      loader = [
        (inputs.haumea.lib.matchers.always inputs.haumea.lib.loaders.path)
      ];
    };

    gifs = inputs.haumea.lib.load {
      src = ./gifs;
      loader = [
        (inputs.haumea.lib.matchers.always inputs.haumea.lib.loaders.path)
      ];
    };
  };
}
