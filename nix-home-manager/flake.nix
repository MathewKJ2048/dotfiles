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
      pkgs = nixpkgs.legacyPackages.${system};
      gitArgs  = {
        email = "mathewkj2048@gmail.com"; 
        name = "Mathew Kuthur James";
      };
    in
    {
      homeConfigurations."mathew" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        
        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 
          ./home.nix
        ];

        # Optionally use extraSpecialArgs to pass through arguments to home.nix
        # extraSpecialArgs is for home configurations, specialArgs is for nixOS configs
        extraSpecialArgs = {  
          inherit gitArgs;
        };
        
        
      };
    };
}