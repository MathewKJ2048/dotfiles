{ pkgs, systemConf, ... }: {

  home.packages = with pkgs; [
  ] ++ lib.optional systemConf.isNixOS vlc;
  
  
}