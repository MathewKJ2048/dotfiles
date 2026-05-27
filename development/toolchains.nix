{ pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # web development
    nodejs

    # python

    # rust
    rustc # compiler
    cargo # package manager
    clippy # linter
    rust-analyzer # language server

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