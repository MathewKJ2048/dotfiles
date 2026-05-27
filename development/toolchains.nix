{ pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # web development
    nodejs

    # python

    # rust

    # tex
    texliveMedium

    # nix
    nixd
  ];

  # java development
  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };


  
}