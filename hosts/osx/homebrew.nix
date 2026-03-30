{ inputs, ... }:
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
    taps = [
#      { name = "homebrew/homebrew-core"; clone_target = inputs.homebrew-core; }
#      { name = "homebrew/homebrew-cask"; clone_target = inputs.homebrew-cask; }
#      { name = "asmvik/formulae"; clone_target = "https://asmvik@github.com/asmvik/yabai.git"; }
#       "asmvik/yabai"
    ];
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
