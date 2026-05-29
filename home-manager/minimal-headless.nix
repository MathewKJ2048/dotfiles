{ pkgs, userConf, isNixOS, ... }:

{ pkgs, config, userConf, systemConf, ... }:

{
  imports = [
    ./common.nix
    ../modules/development/git.nix
    ../modules/shell/shell.nix
  ];
}
