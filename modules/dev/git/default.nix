{ config, pkgs, ...}: let
  email = "e.bonnefond.bailey@protonmail.com";
  name = "Cerustall";
in {

    home.packages = with pkgs; [
      gh
    ];
    programs.git = {
      enable = true;
      settings = {
        color.ui = "true";
        core.editor = "nvim";
        init.defaultBranch = "main";
        user.name = name;
        user.email = email;
      };
    };
}
