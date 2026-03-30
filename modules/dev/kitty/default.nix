{ pkgs, config, lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 5;
      background_opacity = "0.5";
      background_blur = 25;
      hide_window_decorations = "titlebar-only";

      color0  = "#282828";
      color8  = "#928374";

      color1  = "#cc241d";
      color9  = "#fb4934";

      color2  = "#98971a";
      color10 = "#b8bb26";

      color3  = "#d79921";
      color11 = "#fabd2f";

      color4  = "#458588";
      color12 = "#83a598";

      color5  = "#b16286";
      color13 = "#d3869b";

      color6  = "#689d6a";
      color14 = "#8ec07c";
      
      color7  = "#a89984";
      color15 = "#ebdbb2";
      
    };
  };
}
