{ inputs, config, pkgs, ... }: {
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock;

    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };

      animations = {
        enabled = true;
        fade_in = {
          duration = 50;
          bezier = "easeOutQuint";
        };
        fade_out = {
          duration = 50;
          bezier = "easeOutQuint";
        };
      };
    };

    extraConfig = "
      background {
        path = /home/edward/nixdots/assets/nasa-2.png
        blur_passes = 0
      }
      
      auth {
        fingerprint:enabled = true
        fingerprint:ready_message =    󰈷 
        fingerprint:present_message = 󱜙  Scanning...
      }
      
      label {
        monitor =
          text = $FPRINTPROMPT
          color = rgba(255, 255, 255, 0.3)
          font_size = 20
          font_family = SF Pro Display
          position = 0, -410
          halign = center
          valign = center
      }    
    ";
  };
}
