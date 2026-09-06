{ inputs, config, pkgs, ... }: {
  services.mako = {
    enable = true;
    package = pkgs.mako;
    settings = {
      "actionable=true" = {
        anchor = "top-left";
      };
      actions = true;
      on-button-left = "invoke-default-action";
      anchor = "top-right";
      background-color = "#3c3836";
      border-color = "#7c6f64";
      border-radius = 3;
      default-timeout = 5000;
      font = "Departure Mono Nerd Font";
      height = 100;
      icons = true;
      ignore-timeout = false;
      layer = "top";
      margin = 10;
      markup = true;
      width = 300;
    };
  };
}
