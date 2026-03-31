{ config, lib, pkgs, ... }:
{
  imports = [
    ./kitty
    ./git
    ./zsh
    ./starship
    ./languages
    ./fastfetch
    ./yazi
  ];
}
