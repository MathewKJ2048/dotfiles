{ config, pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # web development
    nodejs

    # python

    # rust

    # tex
    texliveFull

    # nix
    nixd
  ];

  # java development
  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };

  
}