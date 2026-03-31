{  pkgs, ... }:
{
  home.packages = with pkgs; [
    prismlauncher
    firefox
    mpv
    obsidian
  ];

}
