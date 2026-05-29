{ config, pkgs, lib, userConf, ... }: {

  imports = [
    ./cli-tools.nix
    ./fastfetch.nix
    ./zsh.nix
  ];

}