{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    let
      userConf_Mathew_Kuthur_James = rec {
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

        gitArgs = {
          inherit email; # email for git, used for signing commits
          name = fullName; # name for git, used for signing commits
        };
      };

      mkHomeConfiguration = {hostName, userConf, systemConf, pkgs} : 
      home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ../hosts/${hostName}/home.nix
          ];
          extraSpecialArgs = {
            inherit userConf;
            systemConf = systemConf // {
              isNixOS = false; # this is merged to systemConf
            };
          };
        };

      mkNixosConfiguration = {hostName, userConf, systemConf} :
        let
          specialArgs = {
            inherit userConf;
            systemConf = systemConf // {
              isNixOS = true; # this is merged to systemConf
            };
          };
        in
        nixpkgs.lib.nixosSystem {
          modules = [
            ../hosts/${hostName}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
              home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile
              home-manager.users.${specialArgs.userConf.username} = ../hosts/${hostName}/home.nix;
              home-manager.extraSpecialArgs = specialArgs;
            }
          ];
          specialArgs = specialArgs;
        };
    in
    {

      homeConfigurations."malachite" = mkHomeConfiguration {
        hostName = "malachite";
        userConf = userConf_Mathew_Kuthur_James;
        systemConf = {};
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      };

      nixosConfigurations."sphalerite" = mkNixosConfiguration {
        hostName = "sphalerite";
        userConf = userConf_Mathew_Kuthur_James;
        systemConf.sshPasswordAuthentication = true;
      };

      nixosConfigurations."bauxite" = mkNixosConfiguration {
        hostName = "bauxite";
        userConf = userConf_Mathew_Kuthur_James;
        systemConf.sshPasswordAuthentication = true;
      };

      nixosConfigurations."wurtzite" = mkNixosConfiguration {
        hostName = "wurtzite";
        userConf = userConf_Mathew_Kuthur_James;
        systemConf.sshPasswordAuthentication = true;
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
