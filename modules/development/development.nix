{ config, pkgs, lib, userConf, systemConf, ... }: {

  imports = [
    ./android.nix
    ./git.nix
    ./java.nix
    ./python.nix
    ./rust.nix
    ./tex.nix
    ./web.nix
  ];

}