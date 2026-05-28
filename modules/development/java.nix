{ pkgs, ... }: {

  # java development
  programs.java = with pkgs; {
    enable = true;
    package = openjdk25;
  };
  
}