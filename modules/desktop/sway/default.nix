{ inputs, config, pkgs, lib, ... }:
  with lib;
  with pkgs;
  let
    mod = "Mod1";
    term = "kitty";
    menu = "wofi --show=drun";
    locker = "hyprlock";
    ss = ''IMG=/home/edward/Pictures/Screenshots/$(date +%Y-%m-%d_%h-%m-%s).png && grim -g "$(slurp)" $IMG && wl-copy < $IMG'';

    # Colours
    background = "#7c6f64";
    foreground = "#d5c4a1";
    focused = "#a89984";
    unfocused = "7c6f64";
    urgent = "#cc241d";
    childBorder = "#b16286";
    indicator = "#d79921";
    text = "#f2e5bc";
    shadow = "#3c3836";
    shadow_inactive = "#282828";

    
  in {
    imports = [
      ./hyprlock.nix
      ./swayidle.nix
    ];
    services = {
      network-manager-applet.enable = true;
      blueman-applet = {
        enable = true;
        systemdTargets = [
          "sway-session.target"
        ];
      };  
    };
    
    wayland.windowManager.sway = {
      enable = true;
      package = swayfx;
      checkConfig = false;
      xwayland = true;

      systemd = {
        enable = true;
      };

      config = rec {
        startup = [
          { command = "swaymsg bar mode toggle"; }
          { command = "wireplumber"; }
          { command = "kitty"; }
          { command = "firefox"; }
          { command = "steam"; }
          { command = "spotify"; }
          { command = "discord"; }
        ];

        colors = {
          background = background;
          focused = {
            background = background;
            border = focused;
            childBorder = focused;
            indicator = focused;
            text = text;
          };
          unfocused = {
            background = background;
            border = unfocused;
            childBorder = focused;
            indicator = focused;
            text = text;
          };
          urgent = {
            background = background;
            border = urgent;
            childBorder = focused;
            indicator = focused;
            text = text;
          };
        };

        window.titlebar = false;

        floating = {
          titlebar = false;
          criteria = [
            { app_id = "pwvucontrol"; }
            { app_id = "blueman"; }
          ];
        };

        fonts = {
          names = ["JetBrains Mono"];
          size = 8.0;
        };

        keybindings = {
          "${mod}+t" = "exec ${term}";
          "${mod}+q" = "kill";
          "${mod}+l" = "exec ${locker}";
          "${mod}+Space" = "exec ${menu}";
          "${mod}+Shift+s" = "exec ${ss}";

          "${mod}+Left" = "focus left";
          "${mod}+Right" = "focus right";
          "${mod}+Up" = "focus up";
          "${mod}+Down" = "focus down";

          "${mod}+Shift+Left" = "move left";
          "${mod}+Shift+Right" = "move right";
          "${mod}+Shift+Up" = "move up";
          "${mod}+Shift+Down" = "move down";

          "${mod}+Shift+b" = "splith";
          "${mod}+Shift+v" = "splitv";

          "${mod}+f" = "fullscreen toggle";
          "${mod}+Shift+f" = "floating toggle";

          "${mod}+a" = "focus parent";
          "${mod}+r" = "mode resize";

          "${mod}+1" = "workspace number 1";
          "${mod}+2" = "workspace number 2";
          "${mod}+3" = "workspace number 3";
          "${mod}+4" = "workspace number 4";
          "${mod}+5" = "workspace number 5";
          "${mod}+6" = "workspace number 6";
          "${mod}+7" = "workspace number 7";
          "${mod}+8" = "workspace number 8";
          "${mod}+9" = "workspace number 9";
          "${mod}+0" = "workspace number 0";

          "${mod}+Shift+1" = "move container to workspace number 1";
          "${mod}+Shift+2" = "move container to workspace number 2";
          "${mod}+Shift+3" = "move container to workspace number 3";
          "${mod}+Shift+4" = "move container to workspace number 4";
          "${mod}+Shift+5" = "move container to workspace number 5";
          "${mod}+Shift+6" = "move container to workspace number 6";
          "${mod}+Shift+7" = "move container to workspace number 7";
          "${mod}+Shift+8" = "move container to workspace number 8";
          "${mod}+Shift+9" = "move container to workspace number 9";
          "${mod}+Shift+0" = "move container to workspace number 0";

          "${mod}+Shift+x" = "exec swaynag -t warning -m 'Exit Sway?' -b 'Yes' 'swaymsg exit'";
      };

      workspaceOutputAssign = let
        main = "DP-3";
        secondary = "HDMI-A-1";
      in [
        { output = main; workspace = "1"; }
        { output = main; workspace = "2"; }
        { output = main; workspace = "3"; }
        { output = main; workspace = "4"; }
        { output = main; workspace = "5"; }
        { output = main; workspace = "6"; }
        { output = main; workspace = "7"; }
        { output = main; workspace = "8"; }
        { output = secondary; workspace = "9"; }
        { output = secondary; workspace = "0"; }
      ];

      assigns = {
        "1" = [
          { app_id = "kitty"; }
        ];
        "2" = [
          { app_id = "firefox"; }
        ];
        "3" = [];
        "4" = [];
        "5" = [];
        "6" = [];
        "7" = [];
        "8" = [
          { app_id = "steam"; }
        ];
        "9" = [
          { app_id = "spotify"; }
        ];
        "0" = [
          { app_id = "discord"; }
        ];
      };

      input = {
        "type:keyboard" = {
          xkb_variant = "gb";  
        };
      };
      
      output = {
        DP-3 = {
          resolution = "1920x1080@119.982hz";
          position = "0,0";
        };
        HDMI-A-1 = {
          resolution = "1920x1080";
          position = "1920,0";
        };
      };

      gaps = {
        bottom = 5;
        top = 5;
        left = 5;
        right = 5;
        horizontal = 5;
        vertical = 5;
        inner = 5;
        outer = 5;
        smartBorders = "off";
        smartGaps = false;
      };
    };

    ## SwayFX Config
    extraConfig = ''

      bindsym --locked XF86AudioMute exec pamixer -t
      bindsym --locked XF86AudioLowerVolume exec pamixer -d 5
      bindsym --locked XF86AudioRaiseVolume exec pamixer -i 5
      bindsym --locked XF86AudioMicMute exec pamixer --default-source -t

      # Special keys to adjust brightness via brightnessctl
      bindsym --locked XF86MonBrightnessDown exec brightnessctl set 5%-
      bindsym --locked XF86MonBrightnessUp exec brightnessctl set 5%+
            
      corner_radius 14
      shadows on
      shadow_offset 0 0
      shadow_blur_radius 20
      shadow_color ${shadow}
      shadow_inactive_color ${shadow_inactive}

      blur enable
      blur_xray disable
      blur_passes 2
    '';
  };
}
