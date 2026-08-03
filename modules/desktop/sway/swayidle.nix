{ inputs, config, pkgs, ... }: {
  services.swayidle = {
    enable = true;
    package = pkgs.swayidle;
    systemdTarget = "sway-session.target";

    timeouts = [
      { timeout = 300; command = "brightnessctl s 20%-"; resumeCommand = "brightnessctl s 20%+"; }
      { timeout = 600; command = "${pkgs.hyprlock}/bin/hyprlock"; }
      { timeout = 900; command = "systemctl suspend"; }
    ];
    
  };
}
