{
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  let
    userConf = rec {
      name = "mathew";
      fullName = "Mathew Kuthur James";
      email = "mathewkj2048@gmail.com"; 

      system = "x86_64-linux";
      
      KdeWayland = false; # this is when building for KDE on wayland
      CinnamonX11 = true; # this is when building for Cinnamon on X11

      locale = "en_US.UTF-8";
      timeZone = "America/New_York";
      keyboardLayout = "us";
      
      username = name;
      homeDirectory = "/home/${username}";
      downloadsDirectory = "${homeDirectory}/Downloads"; 
      desktopDirectory = "${homeDirectory}/Desktop";
      thisDirectory = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
      screenshotsDirecory = desktopDirectory; # location to which screenshots are saved
      videoDownloadDirectory = desktopDirectory; # locations to which downloaded videos are saved
      
      gitArgs  = {
        inherit email; # email for git, used for signing commits
        name = fullName; # name for git, used for signing commits
      };

    }
  in
  outputs =
    { nixpkgs, home-manager, ... }:
    let
      pkgs = nixpkgs.legacyPackages.${userConf.system}; # this is efficient to enable quick eval. This does not mean "old" packages
    in
    {
      homeConfigurations."${userConf.username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ../home-manager/home.nix
        ];

        # Optionally use extraSpecialArgs to pass through arguments to home.nix
        # extraSpecialArgs is for home configurations, specialArgs is for nixOS configs
        extraSpecialArgs = {
          inherit userConf;
          isNixOS = false;
        };
        
      };

      # let
      #   commonSpecialArgs = {
      #     inherit userConf;
      #     isNixOS = true;
      # };
      # in

      # nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      #     modules = [
      #       ./configuration.nix
      #       ./custom-hardware-configuration.nix
      #       home-manager.nixosModules.home-manager
      #       {
      #         home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
      #         home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile 
      #         home-manager.users.${userConf.username} = import ./home.nix;
      #         home-manager.extraSpecialArgs = commonSpecialArgs;
      #       }
      #     ];
      #     specialArgs = commonSpecialArgs;
      #   };

      
    };
}
