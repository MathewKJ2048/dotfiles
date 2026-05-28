{ config, pkgs, lib, userConf, ... }: {

  imports = [
    ./syncthing.nix
    ./rustdesk.nix
    ./remmina.nix
  ];

}