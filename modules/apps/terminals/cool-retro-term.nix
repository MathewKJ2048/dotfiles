{ config, pkgs, lib, systemConf, ... }:
{
  home.packages = lib.optional systemConf.isNixOS pkgs.cool-retro-term;
}