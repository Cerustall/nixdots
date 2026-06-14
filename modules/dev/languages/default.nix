{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    # c
    cmake
    gnumake
    ninja
    glib
    glibc
    
    # general
    zlib

    # rust
    rustup
    spirv-tools
  ];
}
