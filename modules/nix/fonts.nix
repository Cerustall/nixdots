{ inputs, config, pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      nerd-fonts.departure-mono
    ];
    fontconfig = {
      enable = true;
        defaultFonts = {
          sansSerif = [ "nerd-fonts.departure-mono" ];
          monospace = [ "nerd-fonts.departure-mono" ];
        };
    };
  };
}
