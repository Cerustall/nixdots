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
    mako
    libnotify

    ## Screenshots
    grim
    slurp

    ## Clipboard
    wl-clipboard

    ## Audio management
    pwvucontrol
    pipewire

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
  
  ];
}
