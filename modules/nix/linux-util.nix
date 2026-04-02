{ inputs, config, pkgs, ... }: {
  home.packages = with pkgs; [
    # Bluetooth
    bluez
    bluez-tools
    blueman

    # Daily use
    firefox
    spotify
    discord
    proton-vpn
    obsidian
    typst

    # Gaming
    steam
    prismlauncher

    # Utilities
    ## Launcher
    wofi

    ## Notification daemon
    dunst

    ## Screenshots
    grim
    slurp

    ## Clipboard
    wl-clipboard

    ## Audio management
    pavucontrol
    pamixer

    ## Unzip
    unzip

    ## View images etc
    mpv
    qimgv

    ## Shell scripts
    cava
    pipes
    hollywood
  ];
}
