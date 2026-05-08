{ config, pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # web development
    nodejs

    # python

    # rust

    # tex
    texliveFull
  ];

  # java development
  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };
  
}