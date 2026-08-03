{ inputs, config, pkgs, ... }: {
  imports = [
    # Packages, equivalent to homebrew file for Darwin config
    ./../../modules/nix/linux-util.nix
    ./../../modules/desktop/waybar
    ./../../modules/desktop/sway
    ./../../modules/desktop/wpaperd
    ./../../modules/desktop/wofi
    ./../../modules/dev
    ./../../modules/helix    
  ];

  # Users
  home = {
    username = "edward";
    homeDirectory = "/home/edward";
    stateVersion = "26.05";

    sessionVariables = {
      EDITOR = "hx";
      XDG_SESSION_DESKTOP = "swayfx";
      GDK_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      
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
    cursorTheme = {
      name = "MacOS Cursors";
      package = pkgs.apple-cursor;
      size = 12;
    };
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      sansSerif = [ "Jetbrains Mono Nerd Font" ];
      monospace = [ "Jetbrains Mono Nerd Font" ];
    };
  };

  # Let HM manage itself
  programs.home-manager.enable = true;
}
