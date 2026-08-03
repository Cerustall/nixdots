{ inputs, config, pkgs, ... }: {
  programs.wofi = {
    enable = true;
    package = pkgs.wofi;

    settings = {
      style = "./style.css";
      show = "drun";
      width = "50%";
      height = "30%";
      prompt = "Spotlight...";
      term = "kitty";
      gtk_dark = true;
    };
  };
}
