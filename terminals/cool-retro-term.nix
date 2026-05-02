{ config, pkgs, userConf, isNixOS, ... }: {

  home.packages = with pkgs; [
    cool-retro-term
  ];
  
  
}