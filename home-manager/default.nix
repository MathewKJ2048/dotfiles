{ pkgs, userConf, isNixOS, ... }:

{
  imports = [
    ./common.nix

    ../modules/apps/apps.nix
    ../modules/development/development.nix
    ../modules/networking/networking.nix
    ../modules/shell/shell.nix
    ../modules/theme/theme.nix
    ../modules/tools/tools.nix
  ];
}
