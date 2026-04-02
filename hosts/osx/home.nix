{
  imports = [
    ./../../modules/dev
    ./../../modules/helix
    ./../../modules/nix/darwin-util.nix
  ];

  home.username = "edward";
  home.stateVersion = "25.05";
  home.homeDirectory = "/Users/edward";

  home.sessionVariables = {
    EDITOR = "hx";
    SHELL = "zsh";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };
}
