{ pkgs, config, ... }: let
   pad = {
     left = "";
     right = "";
   };
in {
  home.packages = with pkgs; [ starship ];

  programs.starship = {
    enable = true;
    settings = {
      format = "$os$directory  ";
        right_format = "$nix_shell";
        add_newline = true;

        nix_shell = {
          disabled = false;
          format = "[${pad.right}   ](bg:green fg:black)";
        };
        directory = {
          format = " [ $path ](bg:red fg:white)[${pad.right} ](bg:white fg:red)";
          truncation_length = 6;
          truncation_symbol = ".../";
        };
        os = {
          disabled = false;
          format = "[ $symbol ](bg:white fg:black)";
        };
        os.symbols = {
          NixOS = " ";
          Macos = " ";
        };
    };
  };

}
