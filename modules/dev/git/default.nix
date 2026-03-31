{ config, pkgs, ...}: let
  email = "edward.bailey.100@outlook.com";
  name = "Cerustall";
in {

    programs.gh.enable = true;

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
