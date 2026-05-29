{ pkgs, userConf, isNixOS, ... }:

{
  imports = [
    ./minimal-headless.nix

    ../modules/apps/vscodium.nix # text editor
    ../modules/apps/browsers/firefox.nix  # browser
    ../modules/apps/terminals/ghostty.nix  # terminal

    ../modules/networking/networking.nix
    ../modules/theme/theme.nix
    ../modules/tools/tools.nix
  ];
}
