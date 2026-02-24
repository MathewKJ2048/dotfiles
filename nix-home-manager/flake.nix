{
  description = "Home Manager configuration of mathew";

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
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system}; # this is efficient to enable quick eval. This does not mean "old" packages
      name = "mathew";
      fullName = "Mathew Kuthur James";
      locale = "en_US.UTF-8";
      gitArgs  = {
        email = "mathewkj2048@gmail.com"; 
        name = fullName;
      };
      userArgs = rec {
        username = name;
        homeDirectory = "/home/${username}";
        downloadsDirectory = "${homeDirectory}/Downloads";
        screenshotsDirecory = "${homeDirectory}/Desktop";
        videoDownloadDirectory = "${homeDirectory}/Desktop";
        dotFilesPath = "${homeDirectory}/Projects/dotfiles"; # path to where this repo itself is stored when cloned
      };
      commonSpecialArgs = {
        inherit name;
        inherit fullName;
        inherit gitArgs;
        inherit userArgs;
        inherit locale;
      };
    in
    {
      homeConfigurations."${name}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home.nix
        ];

        # Optionally use extraSpecialArgs to pass through arguments to home.nix
        # extraSpecialArgs is for home configurations, specialArgs is for nixOS configs
        extraSpecialArgs = commonSpecialArgs;
        
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          specialArgs = commonSpecialArgs;
          modules = [
            ../nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
              home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile 
              home-manager.users.${userArgs.username} = import ./home.nix;
              home-manager.extraSpecialArgs = commonSpecialArgs;
            }
          ];
        };
    };
}
