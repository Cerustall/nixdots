{ inputs, config, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

#    xdg.configFile."wofi/style.css".source = ./style.css;

    settings = {
      style = "/home/edward/nixdots/modules/desktop/wofi/style.css";
      font = "Departure Mono Nerd Font";
      show = "drun";
      width = "50%";
      height = "30%";
      prompt = "Spotlight...";
      term = "kitty";
      allow_images = "true";
      allow_markup = "true";
      gtk_dark = true;
    };
  };
  xdg.configFile."wofi/style.css".source = ./style.css;

}
