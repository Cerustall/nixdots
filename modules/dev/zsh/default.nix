{ pkgs, config, ... }:
  let
    abbreviations = {
      "nv" = "nvim";
      "yz" = "yazi";
      "cl" = "clear";
    };
    aliases = {
      "ff" = "fastfetch";
      "darwin-rebuild" = "sudo darwin-rebuild switch --flake ~/flake";
    };
  in {
    home.packages = with pkgs; [
      zsh
      btop
      #cava
      yazi
      fastfetch
    ];

    programs.zsh = {
      enable = true;
      zsh-abbr.abbreviations = abbreviations;
      shellAliases = aliases;
      loginExtra = ''eval "$starship init zsh)"'';
    };
  }

