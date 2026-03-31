{ inputs, config, pkgs, lib, ... }: {

  imports = [
    ./../../modules/nix/default.nix
    ./../../modules/desktop
  ];

  users.users.edward = {
    home = "/Users/edward";
    name = "edward";
  };

  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;

  security.pam.services.sudo_local.touchIdAuth = true;

  #programs.zsh.enable = true;

  system = {
    primaryUser = "edward";
    startup.chime = true;

    defaults = {
      
      screensaver = {
	askForPassword = true;
	askForPasswordDelay = 0;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.1;
        autohide-time-modifier = 0.75;
        mru-spaces = false;
        show-recents = false;
        tilesize = 24;
        orientation = "bottom";
        wvous-br-corner = 5;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        FXPreferredViewStyle = "clmv";
        ShowPathbar = true;
      };

      loginwindow = {
        LoginwindowText = "Welcome back!";
      };

      trackpad = {
        Clicking = true;
        Dragging = true;
        TrackpadThreeFingerDrag = true;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowDate = 1;
        ShowDayOfWeek = true;
      };

      NSGlobalDomain = {
        NSWindowShouldDragOnGesture = true;
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleTemperatureUnit = "Celsius";
        NSTableViewDefaultSizeMode = 1;
        KeyRepeat = 2;
      };

      CustomUserPreferences = {
        "com.apple.screensaver" = {
          loginWindowIdleTime = 60;
        };
      };

    };

  };

}
