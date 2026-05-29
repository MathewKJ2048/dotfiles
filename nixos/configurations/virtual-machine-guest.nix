
{ pkgs, userConf, systemConf, ... }:

{
  imports = [
    ./boot-vm.nix
    ./common.nix
    ./ssh.nix
  ];  
}