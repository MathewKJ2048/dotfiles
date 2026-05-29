{ pkgs, userConf, systemConf, ... }:

{

  imports = [
    ./common.nix

    ../modules/apps/apps.nix
    ../modules/development/development.nix
    ../modules/games/games.nix
    ../modules/networking/networking.nix
    ../modules/shell/shell.nix
    ../modules/theme/theme.nix
    ../modules/tools/tools.nix
  ];

  
}
