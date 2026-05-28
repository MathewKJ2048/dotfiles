{ pkgs, userConf, isNixOS, ... }:

{
  imports = [
    ./icons.nix
    ./fonts.nix
    ./cursors.nix
  ];
}
