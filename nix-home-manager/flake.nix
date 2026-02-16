{
  description = "Home-manager flake";
  # this flake describes both the installation of home-manager, and the source that home-manager follows once installed

  inputs = {
    # source of truth
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home Manager - follows our nixpkgs for consistency
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs"; # this says where to get the source code of home-manager from
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }: 

    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = builtins.getEnv "USER";
    in 
    {
    packages.${system}.default = home-manager.packages.${system}.default;

    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; # make it follow the same source for the packages it installs
        modules = [ ./home.nix ]; # location to install packages
      };
    };

}
