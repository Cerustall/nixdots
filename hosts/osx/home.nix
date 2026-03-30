{
  imports = [
    ./../../modules/dev
    ./../../modules/helix
#    ./../../modules/desktop
    ./../../modules/misc
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
