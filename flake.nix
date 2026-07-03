{
  description = "flake/TODO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    mac-app-util.url = "github:hraban/mac-app-util";

    nixos-06cb-009a-fingerprint-sensor = {
      url = "github:viktor-grunwaldt/t480-fingerprint-nixos";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixos-06cb-009a-fingerprint-sensor, ... } @ inputs: {
    nixosConfigurations = {
      
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	      modules = [
	        ./hosts/desktop/configuration.nix
	        home-manager.nixosModules.home-manager {
	          home-manager = {
                    backupFileExtension = "hmbackup";
	            useGlobalPkgs = true;
	            useUserPackages = true;
	            extraSpecialArgs = { inherit inputs; };
	            users.edward = import ./hosts/desktop/home.nix;
	          };
	        }
	      ];
      };

      thinkpad = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
		    modules = [
		      ./hosts/thinkpad/configuration.nix
		      home-manager.nixosModules.home-manager {
		        home-manager = {
		        backupFileExtension = "hmbackup";
		        useGlobalPkgs = true;
		        useUserPackages = true;
		        extraSpecialArgs = { inherit inputs; };
		        users.edward = import ./hosts/thinkpad/home.nix;
		        };
		      }
		      nixos-06cb-009a-fingerprint-sensor.nixosModules."06cb-009a-fingerprint-sensor"
		    ];
      };
      
      # Config for RPi5? aarch64-linux

    };

    darwinConfigurations."osx" = inputs.nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./hosts/osx/configuration.nix
	      inputs.mac-app-util.darwinModules.default
        inputs.home-manager.darwinModules.home-manager {
          home-manager = {
            backupFileExtension = "hmbackup";
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.edward = import ./hosts/osx/home.nix;
            sharedModules = [
              inputs.mac-app-util.homeManagerModules.default
            ];
          };
        }
        inputs.nix-homebrew.darwinModules.nix-homebrew
      ];
      specialArgs = { inherit inputs; };
    };
  };
}
