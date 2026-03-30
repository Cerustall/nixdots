{ config, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraConfig = builtins.readFile ./config.toml;
  };
}
