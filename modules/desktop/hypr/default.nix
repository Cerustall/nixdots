{ inputs, config, pkgs, ... }: {
  imports = [
    (import ./hyprland  { inherit config pkgs; })
    (import ./hyprpaper { inherit config pkgs; })
    (import ./hyprlock  { inherit config pkgs; })
    (import ./hyprpaper { inherit config pkgs; })
  ];
}
