{ inputs, config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;

    systemd = {
      enable = true;
      enableDebug = false;
      enableInspect = false;
      targets = [
        "sway-session.target"
      ];
    };
 
    style = ./style.css;
  };

  xdg.configFile."waybar/config.jsonc".source = ./config.jsonc;
# xdg.configFile."waybar/style.css".source = ./waybar/style.css;
}
