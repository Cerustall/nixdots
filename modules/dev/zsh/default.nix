{ pkgs, config, ... }:
  let
    aliases = {
      "ff" = "fastfetch";
      "yz" = "yazi";
      "cl" = "clear";
      "darwin-rebuild" = "sudo darwin-rebuild switch --flake ~/flake; sudo yabai --load-sa";
      "yabai-reload" = "sudo yabai --load-sa";
    };
  in {
    home.packages = with pkgs; [
      zsh
      btop
    ];

    programs.zsh = {
      enable = true;
      shellAliases = aliases;
      loginExtra = ''eval "$(starship init zsh)"'';
    };
  }

