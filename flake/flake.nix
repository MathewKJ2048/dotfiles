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

      userConf = import ../conf.nix;
      pkgs = nixpkgs.legacyPackages.${userConf.system}; # this is efficient to enable quick eval. This does not mean "old" packages
      commonSpecialArgs = {
          inherit userConf;
          standalone = false;
      };
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
          standalone = true;
        };
        
      };

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
          modules = [
            ../nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true; # use the same nixpkgs as the nixos system
              home-manager.useUserPackages = true; # prevent creation of a separate .nix-profile 
              home-manager.users.${userConf.username} = import ../home-manager/home.nix;
              home-manager.extraSpecialArgs = commonSpecialArgs;
            }
          ];
          specialArgs = commonSpecialArgs;
        };
    };
}
