{ pkgs, config, userConf, systemConf, ... }:

{
  imports = [
    ./common.nix
    ../modules/development/git.nix
    ../modules/shell/shell.nix
    ../modules/tools/essential-tools.nix
  ];
}
