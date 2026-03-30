{ config, lib, pkgs, ... }:
{
  imports = [
    ./kitty
    ./git
    ./zsh
    ./starship
    ./languages
    ./fonts
    ./fastfetch
    ./yazi
  ];
}
