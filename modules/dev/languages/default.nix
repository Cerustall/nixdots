{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    # c
    cmake
    gnumake
    ninja

    # general
    zlib

    # rust
    rustup
    spirv-tools
  ];
}
