{ config, pkgs, lib, systemConf, ... }:
{
  home.packages = lib.optional systemConf.isNixOS pkgs.librewolf;
}