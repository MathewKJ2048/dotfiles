{ pkgs, userConf, isNixOS, ... }:

{ pkgs, userConf, isNixOS, ... }:

{
  imports = [
    ./common.nix
    ../modules/development/git.nix
    ../modules/shell/shell.nix
  ];
}
