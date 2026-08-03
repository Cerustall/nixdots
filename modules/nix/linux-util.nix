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

    ## Notification daemon
    mako
    libnotify

    ## Screenshots
    grim
    slurp

    ## Clipboard
    wl-clipboard

    ## Audio management
    pwvucontrol
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

    ## Bar
    

    ## Wallpapers
    

    ## Idle management

    ## Brightness control
    brightnessctl
  ];
}
