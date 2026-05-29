
{ pkgs, userConf, systemConf, ... }:

{
  imports = [
    ./common.nix
    ./server.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  
}