{
  config,
  pkgs,
  lib,
  userConf,
  systemConf,
  ...
}:
{
  home.packages = lib.optional systemConf.isNixOS pkgs.remmina;
}
