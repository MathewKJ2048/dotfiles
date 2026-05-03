{ config, pkgs, ... }: {

  
  home.packages = with pkgs; [
    nodejs # web development
    texliveFull # tex
  ];

  # java development
  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };

  # python development

  # rust development
  
}