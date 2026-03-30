{ config, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    settings = {
      yazi = pkgs.lib.importTOML ./yazi.toml;
      theme = pkgs.lib.importTOML ./theme.toml;
    };
  };
}
