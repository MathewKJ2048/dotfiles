{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    userConf = rec {
      name = "mathew";
      fullName = "Mathew Kuthur James";
      email = "mathewkj2048@gmail.com"; 

      username = name;
      homeDirectory = "/home/${username}";
      downloadsDirectory = "${homeDirectory}/Downloads"; 
      desktopDirectory = "${homeDirectory}/Desktop";
      thisDirectory = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
      screenshotsDirectory = desktopDirectory; # location to which screenshots are saved
      videoDownloadDirectory = desktopDirectory; # locations to which downloaded videos are saved
      
      gitArgs  = {
        inherit email; # email for git, used for signing commits
        name = fullName; # name for git, used for signing commits
      };
    };
  in
  {
    homeConfigurations.default = 
    let
      systemConf = {
        isNixOS = false;
        KdeWayland = false;
        CinnamonX11 = false;
      };
    in
    home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [ 
        ../home-manager/default.nix
      ];
      extraSpecialArgs = {
        inherit userConf;
        inherit systemConf;
      };
    };

    nixosConfigurations."bootstrap" = 
    let 
      systemConf = {
        isNixOS = true;
        sshPasswordAuth = true;
        KdeWayland = true;
        CinnamonX11 = false;
        hostName = "bootstrap";
        locale = "en_US.UTF-8";
        timeZone = "America/Toronto";
        keyboardLayout = "us";
      };
      specialArgs = {
        inherit userConf;
        inherit systemConf;
      };
    in nixpkgs.lib.nixosSystem {
        modules = [
          ../configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
            home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile 
            home-manager.users.${userConf.username} = ../home-manager/minimal.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
        specialArgs = specialArgs;
      };


    nixosConfigurations."qemu-vm" = 
    let 
      systemConf = {
        isNixOS = true;
        sshPasswordAuth = true;
        KdeWayland = true;
        CinnamonX11 = false;
        hostName = "qemu-vm";
        locale = "en_US.UTF-8";
        timeZone = "America/Toronto";
        keyboardLayout = "us";
      };
      specialArgs = {
        inherit userConf;
        inherit systemConf;
      };
    in nixpkgs.lib.nixosSystem {
        modules = [
          ../nixos/configurations/virtual-machine-guest.nix
          ../nixos/hardware-configurations/qemu-intel-guest.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
            home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile 
            home-manager.users.${userConf.username} = ../home-manager/minimal.nix;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
        specialArgs = specialArgs;
      };

    };

}

/*

hostnames:

bootstrap: temporary, to get things up and running
malachite: main laptop - thinkpad L14-gen3
bauxite:    old laptop - dell inspiron
pyrite:     old phone  - galaxy
pyrolusite: main phone - pixel
wurtzite:   work laptop - thinkpad P14-Gen5

(incoming)
sphalerite: spare laptop - thinkpad T480
erythrite:  e-reader     - tbd



*/