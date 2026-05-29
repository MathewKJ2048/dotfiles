{ config, pkgs, lib, userConf, systemConf, ... }: {

  imports = [
    ./syncthing.nix
    ./rustdesk.nix
    ./remmina.nix
  ];

}