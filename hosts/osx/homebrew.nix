{ config, inputs, ... }:
{
  nix-homebrew = {
    enable = true;
    user = "edward";

    autoMigrate = true;
    
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
#      "asmvik/formulae" = inputs.yabai; #"https://asmvik@github.com/asmvik/yabai.git";
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    taps = builtins.attrNames config.nix-homebrew.taps;
    brews = [

    ];
    casks = [
      "discord"
      "Spotify"
      "protonvpn"
    ];
    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
      upgrade = false;
    };
  };
}
