{ config, pkgs, isNixOS, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional isNixOS cool-retro-term;
  
  
}