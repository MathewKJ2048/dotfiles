{ pkgs, isNixOS, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional isNixOS vlc;
  
  
}