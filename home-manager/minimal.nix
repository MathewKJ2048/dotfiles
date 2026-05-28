{ pkgs, userConf, isNixOS, ... }:

{ pkgs, userConf, isNixOS, ... }:

{
  imports = [
    ./minimal.nix

    ../modules/apps/vscodium.nix # text editor
    ../modules/apps/firefox.nix  # browser
    ../modules/apps/ghostty.nix  # terminal

    ../modules/networking/networking.nix
    ../modules/theme/theme.nix
    ../modules/tools/tools.nix
  ];
}
