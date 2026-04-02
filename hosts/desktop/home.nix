{ inputs, config, pkgs, ... }: {
  imports = [
    # Packages, equivalent to homebrew file for Darwin config
    ./../../modules/nix/linux-util.nix
    
  ];

  # Users
  home = {
    username = "edward";
    homeDirectory = "/home/edward";
    stateVersion = "25.11";

    sessionVariables = {
      EDITOR = "hx";

      # Required for Wayland support
      NIXOS_OZONE_WL = "1";
    };
    
  };

  # Dark theme
  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  };

  # Let HM manage itself
  programs.home-manager.enable = true;
}
