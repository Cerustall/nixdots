{  pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher

    firefox
    inputs.helium.packages.${pkgs.system}.default
    mpv
    
    obsidian
    typst

    rpi-imager
  ];

}
