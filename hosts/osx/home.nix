{
  imports = [
    ./../../modules/dev
    ./../../modules/nvim
    ./../../modules/desktop
    ./../../modules/misc
  ];

  home.username = "edward";
  home.stateVersion = "25.05";
      
  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
    TERMINAL = "kitty";
    BROWSER = "firefox";
  };
}
