{ inputs, config, pkgs, ... }: {
  imports = [
    ./../../modules/nix/fonts.nix
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking = {
    hostName = "thinkpad";
    networkmanager.enable = true;
  };

  # Audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Localization
  ## Locales
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  ## Console keymap
  console.keyMap = "uk";

  # User
  users = {
    users.edward = {
      isNormalUser = true;
      description = "Edward";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
    };
    defaultUserShell = pkgs.zsh;
  };

  # Fingerprint recognition
  services."06cb-009a-fingerprint-sensor" = {
    enable = true;
    backend = "libfprint-tod";
    calib-data-file = ./calib-data.bin;
  };
  security.pam.services.edward.fprintAuth = true;

  # Gaming
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;

  # Graphics
  ## Enabling
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
    
  ## Xwayland support
  programs.xwayland.enable = true;

  # Enable notifs
  services.systembus-notify.enable = true;

  # Power management
  services.undervolt = {
    package = pkgs.undervolt;
    enable = true;
    coreOffset = -95;
    uncoreOffset = -10;
    turbo = 1;
    verbose = true;
  };

  # Nix
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = ["nix-command" "flakes"];
  programs.zsh.enable = true;
  system.stateVersion = "26.05";
  programs.dconf.enable = true;
  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
}
