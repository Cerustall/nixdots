{ pkgs, config, ... }: {
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./gruvbox-rainbow.toml;
  };
}
