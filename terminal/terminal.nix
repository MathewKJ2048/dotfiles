{ config, pkgs, ... }: {
  
  # decorations

  home.packages = with pkgs; [

    ghostty
    
  ];


}