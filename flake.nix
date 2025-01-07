{
  description = "Nix flakes that aggregates assets from multiple sources.";

  inputs = {
    haumea.url = "github:nix-community/haumea/v0.2.2";
  };

  outputs = inputs: {
    wallpapers = inputs.haumea.lib.load {
      src = ./wallpapers;
      loader = inputs.haumea.lib.matchers.always;
    };
    themes = inputs.haumea.lib.load {
      src = ./themes;
      loader = inputs.haumea.lib.matchers.always;
    };
    gifs = inputs.haumea.lib.load {
      src = ./gifs;
      loader = inputs.haumea.lib.matchers.always;
    };
  };
}
