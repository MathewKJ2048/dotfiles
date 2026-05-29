{ pkgs, userConf, isNixOS, ... }:

{ pkgs, userConf, systemConf, ... }:

{
  imports = [
    ./common.nix
    ../modules/development/git.nix
    ../modules/shell/shell.nix
  ];
}
