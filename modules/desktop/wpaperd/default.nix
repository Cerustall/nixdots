{ inputs, config, pkgs, ... }: {
  services.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;
    settings = {
      DP-3 = {
        path = "~/flake/assets/nasa-2.png";
      };
      HDMI-A-1 = {
        path = "~/flake/assets/nasa-2.png";
      };
    };
  };
}
