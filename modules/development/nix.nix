{ pkgs, ... }: {

  
  home.packages = with pkgs; [
    
    # nix language
    nixd # LSP server
    nixfmt # formatter

  ];


  
}