{inputs, pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [
    #neovim
  ];

  programs.neovim = {
    enable = true;
    extraConfig = ''
      lua require('init.lua')
    '';
  };
}
