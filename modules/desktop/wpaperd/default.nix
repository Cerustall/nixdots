{ inputs, config, pkgs, ... }: {
  services.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;
    settings = {
      DP-3 = {
        path = "~/nixdots/assets/nasa-2.png";
      };
      HDMI-A-1 = {
        path = "~/nixdots/assets/nasa-2.png";
      };
      eDP-1 = {
        path = "~/nixdots/assets/nasa-2.png";
      };
    };
  };
}
