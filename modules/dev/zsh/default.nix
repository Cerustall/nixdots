{ pkgs, config, ... }:
  let
    aliases = {
      "ff" = "fastfetch";
      "yz" = "yazi";
      "cl" = "clear";
      "darwin-rebuild" = "sudo darwin-rebuild switch --flake ~/flake; sleep .1; sudo yabai --load-sa";
      "yabai-reload" = "sudo yabai --load-sa && skhd -r";
      "run-kitty" = "open -n -a ~/Applications/'Home Manager Apps'/kitty.app";
    };
  in {
    home.packages = with pkgs; [
      zsh
      btop
    ];

    programs.zsh = {
      enable = true;
      shellAliases = aliases;
      loginExtra = ''ff; eval "$(starship init zsh)"'';
    };
  }

