{
  config,
  pkgs,
  lib,
  userConf,
  systemConf,
  ...
}:
{

  imports = [
    ./syncthing.nix
    ./remmina.nix
  ];

}
