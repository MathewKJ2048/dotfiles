{ pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # rust
    rustc # compiler
    cargo # package manager
    clippy # linter
    rust-analyzer # language server

  ];


  
}